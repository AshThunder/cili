import 'package:cirilla/constants/constants.dart';
import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/models.dart';
import 'stores/stores.dart';
import 'widgets/widgets.dart';

class ChatBuddyUserList extends StatefulWidget {
  static const routeName = '/chat-buddy-user-list';

  final SettingStore? store;

  const ChatBuddyUserList({
    super.key,
    this.store,
  });

  @override
  State<ChatBuddyUserList> createState() => _ChatBuddyUserListState();
}

class _ChatBuddyUserListState extends State<ChatBuddyUserList> with AppBarMixin, LoadingMixin {
  late ChatUserStore _chatUserStore;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _chatUserStore = ChatUserStore(widget.store!.requestHelper)..getChatUsers();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _chatUserStore.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_controller.hasClients || _chatUserStore.loading || !_chatUserStore.canLoadMore) return;
    final thresholdReached = _controller.position.extentAfter < endReachedThreshold;

    if (thresholdReached) {
      _chatUserStore.getChatUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseStyleAppBar(context, title: "Buddy Members"),
      body: Observer(
        builder: (_) {
          bool loading = _chatUserStore.loading;
          List<ChatUser> users = _chatUserStore.chatUsers;
          List<ChatUser> emptyUser = List.generate(_chatUserStore.perPage, (index) => ChatUser()).toList();

          List<ChatUser> data = loading && users.isEmpty ? emptyUser : users;
          return CustomScrollView(
            controller: _controller,
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: _chatUserStore.refresh,
                builder: buildAppRefreshIndicator,
              ),
              if (data.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) => ChatUserItem(user: data[index]),
                      childCount: data.length,
                    ),
                  ),
                )
              else
                const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Empty'),
                  ),
                ),
              if (loading && users.isNotEmpty)
                SliverToBoxAdapter(
                  child: buildLoading(context, isLoading: _chatUserStore.canLoadMore),
                ),
            ],
          );
        },
      ),
    );
  }
}
