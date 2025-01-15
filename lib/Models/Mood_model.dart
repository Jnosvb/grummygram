import 'dart:convert';

List<MoodModel> moodModelFromJson(String str) =>
    List<MoodModel>.from(json.decode(str).map((x) => MoodModel.fromJson(x)));

String moodModelToJson(List<MoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoodModel {
  MoodModel({
    this.id,
    this.id_kategori_mood,
    this.kategoriMood,
    this.detail_mood,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? id_kategori_mood;
  String? kategoriMood;
  String? detail_mood;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MoodModel.fromJson(Map<String, dynamic> json) => MoodModel(
        id: json["id"],
        id_kategori_mood: json["id_kategori_mood"],
        kategoriMood: json["kategori_mood"],
        detail_mood: json["detail_mood"],
        icon: json["icon"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kategori_mood": id_kategori_mood,
        "kategori_mood": kategoriMood,
        "detail_mood": detail_mood,
        "icon": icon,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
