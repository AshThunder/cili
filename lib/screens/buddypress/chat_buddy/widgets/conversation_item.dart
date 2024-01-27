import 'package:cirilla/widgets/cirilla_shimmer.dart';

import '../models/models.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../chat_buddy_message.dart';

class ConversationItem extends StatelessWidget {
  final ChatConversation? conversation;

  const ConversationItem({
    super.key,
    this.conversation,
  });

  Widget buildUser({
    ChatConversation? data,
    bool loading = true,
    double shimmerWidth = 140,
    double shimmerHeight = 14,
    required ThemeData theme,
  }) {
    if (loading) {
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
    ChatUser? user = data?.recipients?.first;
    return RichText(
      text: TextSpan(
        text: "From: ",
        children: [
          TextSpan(
            text: user?.name ?? "",
            style: theme.textTheme.titleSmall,
          ),
        ],
        style: theme.textTheme.labelMedium?.copyWith(color: theme.textTheme.bodyLarge?.color),
      ),
    );
  }

  Widget buildTitle({
    ChatConversation? data,
    bool loading = true,
    double shimmerWidth = 170,
    double shimmerHeight = 16,
    required ThemeData theme,
  }) {
    if (loading) {
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
    return Text(
      data?.title ?? "",
      style: theme.textTheme.titleMedium,
    );
  }

  Widget buildMessage({
    ChatConversation? data,
    bool loading = true,
    double shimmerWidth = 210,
    double shimmerHeight = 12,
    required ThemeData theme,
  }) {
    if (loading) {
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
    return Text(
      (data?.message ?? "").replaceAll("\n", " "),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  void navigate(BuildContext context) {
    if (conversation?.id != null) {
      Navigator.of(context).pushNamed(ChatBuddyMessage.routeName, arguments: {
        'conversation': conversation,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    bool loading = conversation?.id == null;

    return InkWell(
      onTap: () => navigate(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildUser(
                        data: conversation,
                        loading: loading,
                        theme: theme,
                      ),
                      buildTitle(
                        data: conversation,
                        loading: loading,
                        theme: theme,
                      ),
                      const SizedBox(height: 2),
                      buildMessage(
                        data: conversation,
                        loading: loading,
                        theme: theme,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  FeatherIcons.chevronRight,
                  size: 16,
                )
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
        ],
      ),
    );
  }
}
