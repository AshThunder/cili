import 'package:cirilla/constants/assets.dart';
import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/models/models.dart';
import 'package:cirilla/store/store.dart';
import 'package:cirilla/utils/utils.dart';
import 'package:cirilla/widgets/widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as flutter_chat_types;

import 'models/models.dart';
import 'stores/stores.dart';
import 'widgets/widgets.dart';

class ChatBuddyMessage extends StatefulWidget {
  static const routeName = '/chat-buddy-message';

  final Map? args;
  final SettingStore? store;

  const ChatBuddyMessage({
    super.key,
    this.store,
    this.args,
  });

  @override
  State<ChatBuddyMessage> createState() => _ChatBuddyMessageState();
}

class _ChatBuddyMessageState extends State<ChatBuddyMessage> with AppBarMixin, SnackMixin {
  late ChatMessageStore _chatMessageStore;
  late AuthStore _authStore;

  @override
  void didChangeDependencies() {
    _authStore = Provider.of<AuthStore>(context);

    dynamic data = widget.args?["conversation"];
    ChatConversation? conversation = data is ChatConversation ? data : null;

    _chatMessageStore = ChatMessageStore(widget.store!.requestHelper, conversation: conversation)
      ..getChatMessages()
      ..readMessage();
    super.didChangeDependencies();
  }

  int getIntDate(String? date) {
    DateTime value = date?.isNotEmpty == true ? DateTime.parse(date!) : DateTime.now();
    return value.millisecondsSinceEpoch;
  }

  List<flutter_chat_types.Message> convertToChat(
      List<ChatMessage>? data, int id, List<ChatUser>? users, int unreadCount) {
    List<flutter_chat_types.Message> messages = [];
    if (data?.isNotEmpty == true) {
      List<ChatMessage> dataReversed = data!.reversed.toList();
      int count = 0;
      for (ChatMessage item in dataReversed) {
        ChatUser? user = users?.firstWhereIndexedOrNull((_, r) => r.id == item.senderId);
        String status = id != user?.id && count < unreadCount ? 'sent' : 'seen';
        messages.add(flutter_chat_types.Message.fromJson(
          {
            "author": {
              "firstName": user?.name,
              "id": "${user?.id}",
              "imageUrl": user?.avatar ?? Assets.noImageUrl,
            },
            "createdAt": getIntDate(item.date),
            "id": item.id.toString(),
            "status": status,
            "text": unescape(item.message),
            "type": "text"
          },
        ));
        if (status == "sent") {
          count++;
        }
      }
    }
    return messages.toList();
  }

  AppBar buildAppbar({
    required Widget title,
    required ThemeData theme,
  }) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: theme.appBarTheme.backgroundColor,
      // actionsIconTheme: IconThemeData(size: 22, opacity: 0),
      leading: leading(),
      centerTitle: true,
      title: title,
    );
  }

  Widget buildNotify({required String title, required ThemeData theme}) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Center(
        child: Text(title),
      ),
    );
  }

  /// Handle user submit chat content
  void _handleChat(flutter_chat_types.PartialText txt) async {
    try {
      Map<String, dynamic> data = {
        "context": "edit",
        "id": _chatMessageStore.conversation?.id,
        "message": txt.text,
        "recipients": _chatMessageStore.conversation?.recipients?.map((e) => e.id).toList() ?? []
      };
      List<ChatMessage>? messages = await _chatMessageStore.createMessage(
        data: data,
      );
      _chatMessageStore.onChanged(messages: messages);
    } catch (e) {
      if (mounted) showError(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Observer(
      builder: (_) {
        User? userSelf = _authStore.user;
        int idSelf = ConvertData.stringToInt(userSelf?.id);

        ChatConversation? conversation = _chatMessageStore.conversation;
        ChatUser? user = _chatMessageStore.conversation?.recipients?.firstWhereIndexedOrNull((_, r) => r.id != idSelf);

        late Widget child;
        if (conversation?.id == null) {
          child = buildNotify(title: "Id empty", theme: theme);
        } else if (_chatMessageStore.loading) {
          child = buildNotify(title: "Loading", theme: theme);
        } else if (_chatMessageStore.error) {
          child = buildNotify(title: "Error", theme: theme);
        } else {
          child = ChatMessageContent(
            data: convertToChat(
                _chatMessageStore.chatMessages, idSelf, conversation?.recipients ?? [], conversation?.unreadCount ?? 0),
            userId: userSelf?.id ?? "",
            handleChat: _handleChat,
          );
        }

        return ChatMessageScaffold(
          appBar: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CirillaCacheImage(
                  user?.avatar,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(width: 10),
              Text(user?.name ?? "User"),
            ],
          ),
          messages: child,
        );
      },
    );
  }
}
