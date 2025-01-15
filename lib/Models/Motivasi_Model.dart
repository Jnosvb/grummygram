import 'dart:convert';

List<MotivasiModel> motivasiModelFromJson(String str) =>
    List<MotivasiModel>.from(
        json.decode(str).map((x) => MotivasiModel.fromJson(x)));

String motivasiModelToJson(List<MotivasiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MotivasiModel {
  MotivasiModel({
    this.idmotivasi,
    this.isiMotivasi,
    this.iduser,
    this.nama,
    this.createdAt,
    this.updateAt,
  });

  int? idmotivasi; // Ubah tipe menjadi int?
  String? isiMotivasi;
  String? nama;
  int? iduser; // Ubah tipe menjadi int?
  DateTime? createdAt;
  DateTime? updateAt;

  factory MotivasiModel.fromJson(Map<String, dynamic> json) => MotivasiModel(
        idmotivasi:
            json["idmotivasi"], // Ini sudah int, jadi tidak perlu diconvert
        isiMotivasi: json["isi_motivasi"],
        nama: json["user"]["nama"],
        iduser: json["id"], // iduser harus int?
        createdAt: DateTime.parse(json["created_at"]),
        updateAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "idmotivasi": idmotivasi,
        "isi_motivasi": isiMotivasi,
        "nama": nama,
        "id": iduser, // iduser juga sudah menjadi int
        "created_at":
            "${createdAt?.year.toString().padLeft(4, '0')}-${createdAt?.month.toString().padLeft(2, '0')}-${createdAt?.day.toString().padLeft(2, '0')}",
        "updated_at": updateAt,
      };
}
