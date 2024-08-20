import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;

  Photo({
    required this.id,
    this.title,
    this.description,
    required this.userId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  Photo copyWith({
    int? id,
    String? title,
    String? description,
    int? userId,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Photo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        userId: userId ?? this.userId,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
