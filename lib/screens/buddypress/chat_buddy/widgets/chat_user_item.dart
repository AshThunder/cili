import 'package:cirilla/widgets/cirilla_shimmer.dart';
import 'package:cirilla/widgets/widgets.dart';

import '../models/models.dart';
import 'package:flutter/material.dart';

import '../chat_buddy_user_detail.dart';

class ChatUserItem extends StatelessWidget {
  final ChatUser? user;
  final Color? textColor;
  final Color? dividerColor;

  const ChatUserItem({
    super.key,
    this.user,
    this.textColor,
    this.dividerColor,
  });

  Widget buildImage({
    ChatUser? data,
    double shimmerSize = 30,
  }) {
    if (data?.id == null) {
      return CirillaShimmer(
        child: Container(
          height: shimmerSize,
          width: shimmerSize,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(shimmerSize / 2),
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(shimmerSize / 2),
      child: CirillaCacheImage(
        data?.avatar,
        width: shimmerSize,
        height: shimmerSize,
      ),
    );
  }

  Widget buildName({
    ChatUser? data,
    Color? color,
    double shimmerWidth = 140,
    double shimmerHeight = 14,
  }) {
    if (data?.id == null) {
      return CirillaShimmer(
        child: Container(
          height: shimmerHeight,
          width: shimmerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      );
    }
    return Text(data?.name ?? "User", style: TextStyle(color: color));
  }

  void navigate(BuildContext context) {
    if (user?.id != null) {
      Navigator.of(context).pushNamed(ChatBuddyUserDetail.routeName, arguments: {
        'user': user,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CirillaTile(
      leading: buildImage(data: user),
      title: buildName(data: user, color: textColor),
      colorDivider: dividerColor,
      isChevron: false,
      onTap: () => navigate(context),
    );
  }
}
