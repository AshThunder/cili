import 'package:cirilla/mixins/utility_mixin.dart';
import 'package:cirilla/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'chat_user.dart';

part 'chat_conversation.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ChatConversation {
  int? id;

  @JsonKey(name: 'subject', fromJson: _fromRendered)
  String? title;

  @JsonKey(name: 'excerpt', fromJson: _fromRendered)
  String? message;

  @JsonKey(name: 'date_gmt')
  String? date;

  @JsonKey(name: 'unread_count')
  int? unreadCount;

  @JsonKey(name: 'sender_ids', fromJson: _fromSenderIds)
  List<int>? senderIds;

  @JsonKey(name: 'starred_message_ids', fromJson: _fromStarredMessageIds)
  List<int>? starredMessageIds;

  @JsonKey(fromJson: _fromRecipients)
  List<ChatUser>? recipients;

  ChatConversation({
    this.id,
    this.title,
    this.message,
    this.date,
    this.unreadCount,
    this.senderIds,
    this.starredMessageIds,
    this.recipients,
  });

  factory ChatConversation.fromJson(Map<String, dynamic> json) => _$ChatConversationFromJson(json);

  static String? _fromRendered(dynamic value) {
    return get(value, ["rendered"]) as String?;
  }

  static List<ChatUser>? _fromRecipients(dynamic value) {
    if (value is List && value.isNotEmpty) {
      return value
          .map((v) {
            return ChatUser.fromJson({
              "id": ConvertData.stringToInt(get(v, ['user_id'])),
              "name": get(v, ['name']),
              'avatar_urls': get(v, ['user_avatars']),
            });
          })
          .toList()
          .cast<ChatUser>();
    }
    return [] as List<ChatUser>;
  }

  static List<int>? _fromSenderIds(dynamic value) {
    if (value is Map && value.isNotEmpty) {
      return value.keys.map((e) => ConvertData.stringToInt(e)).toList().cast<int>();
    }
    return ([]).cast<int>();
  }

  static List<int>? _fromStarredMessageIds(dynamic value) {
    if (value is List && value.isNotEmpty) {
      return value.map((e) => ConvertData.stringToInt(e)).toList().cast<int>();
    }
    return ([]).cast<int>();
  }
}

@JsonSerializable(
  createToJson: false,
)
class ChatMessage {
  int? id;

  @JsonKey(name: 'sender_id')
  int? senderId;

  @JsonKey(name: 'subject', fromJson: _fromText)
  String? title;

  @JsonKey(name: 'message', fromJson: _fromText)
  String? message;

  @JsonKey(name: 'date_sent')
  String? date;

  ChatMessage({
    this.id,
    this.senderId,
    this.title,
    this.message,
    this.date,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  static String? _fromText(dynamic value) {
    return get(value, ["rendered"]) as String?;
  }
}
