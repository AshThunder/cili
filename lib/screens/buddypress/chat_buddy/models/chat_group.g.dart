// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGroup _$ChatGroupFromJson(Map<String, dynamic> json) => ChatGroup(
      id: json['id'] as int?,
      creatorId: json['creator_id'] as int?,
      parentId: json['parent_id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      createdAt: json['date_created_gmt'] as String?,
      createdSince: json['created_since'] as String?,
      avatar: ChatGroup._fromAvatarUrls(json['avatar_urls']),
    );
