import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/store/store.dart';
import 'package:flutter/material.dart';

class ChatBuddyGroupDetail extends StatelessWidget with AppBarMixin {
  static const routeName = '/chat-buddy-group-detail';

  final Map? args;
  final SettingStore? store;

  const ChatBuddyGroupDetail({
    super.key,
    this.store,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseStyleAppBar(context, title: "Buddy Group Detail"),
    );
  }
}
