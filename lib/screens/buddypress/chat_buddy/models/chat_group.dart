import 'package:cirilla/mixins/utility_mixin.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_group.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ChatGroup {
  int? id;

  @JsonKey(name: 'creator_id')
  int? creatorId;

  @JsonKey(name: 'parent_id')
  int? parentId;

  String? name;

  String? status;

  @JsonKey(name: "date_created_gmt")
  String? createdAt;

  @JsonKey(name: "created_since")
  String? createdSince;

  @JsonKey(name: 'avatar_urls', fromJson: _fromAvatarUrls)
  String? avatar;

  ChatGroup({
    this.id,
    this.creatorId,
    this.parentId,
    this.name,
    this.status,
    this.createdAt,
    this.createdSince,
    this.avatar,
  });

  factory ChatGroup.fromJson(Map<String, dynamic> json) => _$ChatGroupFromJson(json);

  static String? _fromAvatarUrls(dynamic value) {
    return get(value, ["full"]) as String?;
  }
}
