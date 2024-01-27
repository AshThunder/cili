import 'package:cirilla/mixins/utility_mixin.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_user.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ChatUser {
  int? id;

  String? name;

  @JsonKey(name: 'user_login')
  String? userLogin;

  @JsonKey(name: 'avatar_urls', fromJson: _fromAvatarUrls)
  String? avatar;

  ChatUser({
    this.id,
    this.name,
    this.userLogin,
    this.avatar,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) => _$ChatUserFromJson(json);

  static String? _fromAvatarUrls(dynamic value) {
    String text = get(value, ["full"], "");
    return text.contains("http")
        ? text
        : text.isNotEmpty
            ? "https:$text"
            : null;
  }
}
