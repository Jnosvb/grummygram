import 'dart:convert';

List<CatatanModel> catatanModelFromJson(String str) => List<CatatanModel>.from(
    json.decode(str).map((x) => CatatanModel.fromJson(x)));

String catatanModelToJson(List<CatatanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatatanModel {
  CatatanModel({
    this.id,
    this.idUser,
    this.idCatatanDetail,
    this.createdAt,
    this.updatedAt,
    this.catatanDetail,
  });

  int? id;
  int? idUser;
  int? idCatatanDetail;
  DateTime? createdAt;
  DateTime? updatedAt;
  CatatanDetail? catatanDetail;

  factory CatatanModel.fromJson(Map<String, dynamic> json) => CatatanModel(
        id: json["id"],
        idUser: json["id_user"],
        idCatatanDetail: json["id_catatan_detail"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        catatanDetail: json["catatan_detail"] == null
            ? null
            : CatatanDetail.fromJson(json["catatan_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_catatan_detail": idCatatanDetail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "catatan_detail": catatanDetail?.toJson(),
      };
}

class CatatanDetail {
  CatatanDetail({
    this.id,
    this.judul,
    this.kegiatan,
    this.idMood,
    this.createdAt,
    this.updatedAt,
    this.mood,
  });

  int? id;
  String? judul;
  String? kegiatan;
  int? idMood;
  DateTime? createdAt;
  DateTime? updatedAt;
  Mood? mood;

  factory CatatanDetail.fromJson(Map<String, dynamic> json) => CatatanDetail(
        id: json["id"],
        judul: json["judul"],
        kegiatan: json["kegiatan"],
        idMood: json["id_mood"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mood: json["mood"] == null ? null : Mood.fromJson(json["mood"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "kegiatan": kegiatan,
        "id_mood": idMood,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "mood": mood?.toJson(),
      };
}

class Mood {
  Mood({
    this.id,
    this.idKategoriMood,
    this.detailMood,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idKategoriMood;
  String? detailMood;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Mood.fromJson(Map<String, dynamic> json) => Mood(
        id: json["id"],
        idKategoriMood: json["id_kategori_mood"],
        detailMood: json["detail_mood"],
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
        "id_kategori_mood": idKategoriMood,
        "detail_mood": detailMood,
        "icon": icon,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class LastData {
  LastData({
    this.id,
    this.idUser,
    this.idCatatanDetail,
    this.createdAt,
    this.updatedAt,
    this.lastdatadetail,
  });

  int? id;
  int? idUser;
  int? idCatatanDetail;
  DateTime? createdAt;
  DateTime? updatedAt;
  LastDataDetail? lastdatadetail;

  factory LastData.fromJson(Map<String, dynamic> json) => LastData(
        id: json["id"],
        idUser: json["id_user"],
        idCatatanDetail: json["id_catatan_detail"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lastdatadetail: json["catatan_detail"] == null
            ? null
            : LastDataDetail.fromJson(json["catatan_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_catatan_detail": idCatatanDetail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "catatan_detail": lastdatadetail?.toJson(),
      };
}

class LastDataDetail {
  LastDataDetail({
    this.id,
    this.judul,
    this.kegiatan,
    this.idMood,
    this.createdAt,
    this.updatedAt,
    this.mood,
  });

  int? id;
  String? judul;
  String? kegiatan;
  int? idMood;
  DateTime? createdAt;
  DateTime? updatedAt;
  MoodLastData? mood;

  factory LastDataDetail.fromJson(Map<String, dynamic> json) => LastDataDetail(
        id: json["id"],
        judul: json["judul"],
        kegiatan: json["kegiatan"],
        idMood: json["id_mood"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mood: json["mood"] == null ? null : MoodLastData.fromJson(json["mood"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "kegiatan": kegiatan,
        "id_mood": idMood,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "mood": mood?.toJson(),
      };
}

class MoodLastData {
  MoodLastData({
    this.id,
    this.idKategoriMood,
    this.detailMood,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idKategoriMood;
  String? detailMood;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MoodLastData.fromJson(Map<String, dynamic> json) => MoodLastData(
        id: json["id"],
        idKategoriMood: json["id_kategori_mood"],
        detailMood: json["detail_mood"],
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
        "id_kategori_mood": idKategoriMood,
        "detail_mood": detailMood,
        "icon": icon,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
