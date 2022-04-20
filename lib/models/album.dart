import 'dart:convert';

import 'photo.dart';
import 'user.dart';

List<Album> albumFromJson(List<dynamic> data) =>
    List<Album>.from(data.map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  Album({
    this.userId,
    this.user,
    this.id,
    this.title,
    this.photos,
  });

  int? userId;
  User? user;
  int? id;
  String? title;
  List<Photo>? photos;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
