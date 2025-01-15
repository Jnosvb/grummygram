import 'dart:convert';

List<ActivityyyModel> activityyyModelFromJson(String str) =>
    List<ActivityyyModel>.from(
        json.decode(str).map((x) => ActivityyyModel.fromJson(x)));

String activityyyModelToJson(List<ActivityyyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityyyModel {
  final DateTime? createdAt;
  final String? title;
  final String? category;
  final Map<String, dynamic>? databefore;
  final Map<String, dynamic>? dataafter;

  ActivityyyModel({
    this.category,
    this.title,
    this.databefore,
    this.dataafter,
    this.createdAt,
  });

  factory ActivityyyModel.fromJson(Map<String, dynamic> json) =>
      ActivityyyModel(
        category: json["category"],
        title: json["activity"]["title"],
        databefore: json["activity"]["data_before"] != null
            ? Map<String, dynamic>.from(json["activity"]["data_before"])
            : null,
        dataafter: json["activity"]["data_after"] != null
            ? Map<String, dynamic>.from(json["activity"]["data_after"])
            : null,
        createdAt: json["activity"]["created_at"] == null
            ? null
            : DateTime.parse(json["activity"]["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "activity": {
          "title": title,
          "data_before": databefore,
          "data_after": dataafter,
          "created_at": createdAt?.toIso8601String(),
        },
      };
}
