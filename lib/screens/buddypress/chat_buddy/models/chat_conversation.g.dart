// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatConversation _$ChatConversationFromJson(Map<String, dynamic> json) => ChatConversation(
      id: json['id'] as int?,
      title: ChatConversation._fromRendered(json['subject']),
      message: ChatConversation._fromRendered(json['excerpt']),
      date: json['date_gmt'] as String?,
      unreadCount: json['unread_count'] as int?,
      senderIds: ChatConversation._fromSenderIds(json['sender_ids']),
      starredMessageIds: ChatConversation._fromStarredMessageIds(json['starred_message_ids']),
      recipients: ChatConversation._fromRecipients(json['recipients']),
    );

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as int?,
      senderId: json['sender_id'] as int?,
      title: ChatMessage._fromText(json['subject']),
      message: ChatMessage._fromText(json['message']),
      date: json['date_sent'] as String?,
    );
