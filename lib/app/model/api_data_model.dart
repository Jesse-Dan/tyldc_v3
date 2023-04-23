// To parse this JSON data, do
//
//     final api = apiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Api> apiFromJson(String str) => List<Api>.from(json.decode(str).map((x) => Api.fromJson(x)));

String apiToJson(List<Api> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Api {
    Api({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    final int userId;
    final int id;
    final String title;
    final bool completed;

    factory Api.fromJson(Map<String, dynamic> json) => Api(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
