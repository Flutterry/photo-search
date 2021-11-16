import 'dart:convert';

extension ImageModelFunctions on ImageModel {}

class ImageModel {
  ImageModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.urls,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  Urls urls;

  factory ImageModel.fromJson(String str) =>
      ImageModel.fromMap(json.decode(str));

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        urls: Urls.fromMap(json["urls"]),
      );
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );
}
