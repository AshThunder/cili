import 'package:cirilla/widgets/cirilla_shimmer.dart';
import 'package:cirilla/widgets/widgets.dart';

import '../models/models.dart';
import 'package:flutter/material.dart';

import '../chat_buddy_group_detail.dart';

class ChatGroupItem extends StatelessWidget {
  final ChatGroup? group;
  final Color? textColor;
  final Color? subtextColor;
  final Color? dividerColor;

  const ChatGroupItem({
    super.key,
    this.group,
    this.textColor,
    this.subtextColor,
    this.dividerColor,
  });

  Widget buildImage({
    ChatGroup? data,
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
        data?.avatar ?? "",
        width: shimmerSize,
        height: shimmerSize,
      ),
    );
  }

  Widget buildName({
    ChatGroup? data,
    Color? color,
    double shimmerWidth = 140,
    double shimmerHeight = 16,
    required ThemeData theme,
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
    return Text(data?.name ?? "User", style: theme.textTheme.titleMedium?.copyWith(color: color));
  }

  Widget buildStatus({
    ChatGroup? data,
    Color? color,
    double shimmerWidth = 70,
    double shimmerHeight = 14,
    required ThemeData theme,
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
    late String text;
    switch (data?.status) {
      case "private":
        text = "Private Group";
        break;
      case "hidden":
        text = "Hidden Group";
        break;
      default:
        text = "Public Group";
    }
    return Text(text, style: theme.textTheme.bodySmall?.copyWith(color: color));
  }

  Widget buildTimeCreate({
    ChatGroup? data,
    Color? color,
    double shimmerWidth = 70,
    double shimmerHeight = 14,
    required ThemeData theme,
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
    return Text("Active ${data?.createdSince}", style: theme.textTheme.bodySmall?.copyWith(color: color));
  }

  void navigate(BuildContext context) {
    if (group?.id != null) {
      Navigator.of(context).pushNamed(ChatBuddyGroupDetail.routeName, arguments: {
        'group': group,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () => navigate(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                buildImage(data: group),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildName(data: group, color: textColor, theme: theme),
                      buildTimeCreate(data: group, color: subtextColor, theme: theme),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                buildStatus(data: group, color: subtextColor, theme: theme),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: dividerColor),
        ],
      ),
    );
  }
}
