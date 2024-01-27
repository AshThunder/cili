import 'package:awesome_icons/awesome_icons.dart';
import 'package:cirilla/constants/constants.dart';
import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/models.dart';
import 'stores/stores.dart';
import 'widgets/widgets.dart';

import 'chat_buddy_message_form.dart';

class ChatBuddyMessageList extends StatefulWidget {
  static const routeName = '/chat-buddy-message-list';

  final SettingStore? store;

  const ChatBuddyMessageList({
    super.key,
    this.store,
  });

  @override
  State<ChatBuddyMessageList> createState() => _ChatBuddyMessageListState();
}

class _ChatBuddyMessageListState extends State<ChatBuddyMessageList>
    with AppBarMixin, LoadingMixin, SingleTickerProviderStateMixin {
  late ChatConversationStore _chatConversationStore;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _chatConversationStore = ChatConversationStore(
      widget.store!.requestHelper,
      box: "inbox",
    )..getChatConversations();
    super.didChangeDependencies();
  }

  void _onChanged(index) {
    late String box;
    switch (index) {
      case 1:
        box = "starred";
        break;
      case 2:
        box = "sentbox";
        break;
      default:
        box = "inbox";
    }
    if (box != _chatConversationStore.box) {
      _chatConversationStore.onChanged(box: box);
    }
  }

  Widget buildTab({required String title}) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: leading(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, _, __) => ChatBuddyMessageForm(
                    callback: () => Navigator.pop(context, "OK"),
                  ),
                ),
              ).then((value) {
                if (value == "OK") {
                  if (_chatConversationStore.box != "sentbox") {
                    _tabController?.animateTo(2);
                    _onChanged(2);
                  } else {
                    _chatConversationStore.refresh();
                  }
                }
              });
            },
            icon: const Icon(FontAwesomeIcons.plusCircle, size: 20),
          ),
          const SizedBox(width: 8)
        ],
        centerTitle: true,
        title: Text(
          "Chat Messages",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        bottom: TabBar(
          onTap: _onChanged,
          labelPadding: EdgeInsets.zero,
          labelColor: theme.primaryColor,
          controller: _tabController,
          labelStyle: theme.textTheme.titleSmall,
          unselectedLabelColor: theme.textTheme.titleSmall?.color,
          indicatorWeight: 2,
          indicatorColor: theme.primaryColor,
          tabs: [
            buildTab(title: "Inbox"),
            buildTab(title: "Starred"),
            buildTab(title: "Sent"),
          ],
        ),
      ),
      // body: buildContent(),
      body: _ListConversation(
        store: _chatConversationStore,
      ),
    );
  }
}

class _ListConversation extends StatefulWidget {
  final ChatConversationStore store;

  const _ListConversation({required this.store});

  @override
  State<_ListConversation> createState() => _ListConversationState();
}

class _ListConversationState extends State<_ListConversation> with LoadingMixin {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (!_controller.hasClients || widget.store.loading || !widget.store.canLoadMore) return;
    final thresholdReached = _controller.position.extentAfter < endReachedThreshold;

    if (thresholdReached) {
      widget.store.getChatConversations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        bool loading = widget.store.loading;
        List<ChatConversation> conversations = widget.store.conversations;

        List<ChatConversation> emptyConversation =
            List.generate(widget.store.perPage, (index) => ChatConversation()).toList();

        List<ChatConversation> data = loading && conversations.isEmpty ? emptyConversation : conversations;

        return CustomScrollView(
          controller: _controller,
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: widget.store.refresh,
              builder: buildAppRefreshIndicator,
            ),
            if (data.isNotEmpty)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      return ConversationItem(
                        conversation: data[index],
                      );
                    },
                    childCount: data.length,
                  ),
                ),
              )
            else
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 50),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Text('Empty'),
                  ),
                ),
              ),
            if (loading && conversations.isNotEmpty)
              SliverToBoxAdapter(
                child: buildLoading(context, isLoading: widget.store.canLoadMore),
              ),
          ],
        );
      },
    );
  }
}
