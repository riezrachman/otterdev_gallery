import 'dart:convert';

List<Photo> photoFromJson(List<dynamic> data) =>
    List<Photo>.from(data.map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photo {
  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
