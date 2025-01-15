import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) =>
    List<ActivityModel>.from(
        json.decode(str).map((x) => ActivityModel.fromJson(x)));

String activityModelToJson(List<ActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
  ActivityModel({
    this.category,
    this.activity,
  });

  String? category;
  ActivityDetail? activity;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        category: json["category"],
        activity: json["activity"] == null
            ? null
            : ActivityDetail.fromJson(json["activity"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "activity": activity?.toJson(),
      };
}

class ActivityDetail {
  ActivityDetail({
    this.title,
    this.changes,
    this.createdAt,
  });

  String? title;
  Map<String, dynamic>? changes;
  DateTime? createdAt;

  factory ActivityDetail.fromJson(Map<String, dynamic> json) => ActivityDetail(
        title: json["title"],
        changes: json["changes"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "changes": changes,
        "created_at": createdAt?.toIso8601String(),
      };
}

class ChangeDetail {
  ChangeDetail({
    this.before,
    this.after,
  });

  String? before;
  String? after;

  factory ChangeDetail.fromJson(Map<String, dynamic> json) => ChangeDetail(
        before: json["before"],
        after: json["after"],
      );

  Map<String, dynamic> toJson() => {
        "before": before,
        "after": after,
      };
}
