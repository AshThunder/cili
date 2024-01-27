import 'package:cirilla/constants/constants.dart';
import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/models.dart';
import 'stores/stores.dart';
import 'widgets/widgets.dart';

class ChatBuddyGroupList extends StatefulWidget {
  static const routeName = '/chat-buddy-group-list';

  final SettingStore? store;

  const ChatBuddyGroupList({
    super.key,
    this.store,
  });

  @override
  State<ChatBuddyGroupList> createState() => _ChatBuddyGroupListState();
}

class _ChatBuddyGroupListState extends State<ChatBuddyGroupList> with AppBarMixin, LoadingMixin {
  late ChatGroupStore _chatGroupStore;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _chatGroupStore = ChatGroupStore(widget.store!.requestHelper)..getChatGroups();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _chatGroupStore.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_controller.hasClients || _chatGroupStore.loading || !_chatGroupStore.canLoadMore) return;
    final thresholdReached = _controller.position.extentAfter < endReachedThreshold;

    if (thresholdReached) {
      _chatGroupStore.getChatGroups();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseStyleAppBar(context, title: "Buddy Groups"),
      body: Observer(
        builder: (_) {
          bool loading = _chatGroupStore.loading;
          List<ChatGroup> groups = _chatGroupStore.chatGroups;
          List<ChatGroup> emptyGroup = List.generate(_chatGroupStore.perPage, (index) => ChatGroup()).toList();

          List<ChatGroup> data = loading && groups.isEmpty ? emptyGroup : groups;
          return CustomScrollView(
            controller: _controller,
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: _chatGroupStore.refresh,
                builder: buildAppRefreshIndicator,
              ),
              if (data.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) => ChatGroupItem(group: data[index]),
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
              if (loading && groups.isNotEmpty)
                SliverToBoxAdapter(
                  child: buildLoading(context, isLoading: _chatGroupStore.canLoadMore),
                ),
            ],
          );
        },
      ),
    );
  }
}
