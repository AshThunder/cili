// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => ChatUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userLogin: json['user_login'] as String?,
      avatar: ChatUser._fromAvatarUrls(json['avatar_urls']),
    );
