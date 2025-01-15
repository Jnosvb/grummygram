// To parse this JSON data, do
//
//     final loginModels = loginModelsFromJson(jsonString);

import 'dart:convert';

LoginModels loginModelsFromJson(String str) =>
    LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
  LoginModels({
    this.name,
    this.isActive,
    this.message,
    this.data,
  });
  String? name;
  bool? isActive;
  String? message;
  Data? data;

  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
        name: json["name"],
        isActive: json["is_active"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.nama,
    this.tanggal_lahir,
    this.email,
    this.no_telp,
    this.alamat,
    this.jenis_kelamin,
    this.foto,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? nama;
  String? tanggal_lahir;
  String? email;
  String? no_telp;
  String? alamat;
  String? jenis_kelamin;
  String? foto;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        tanggal_lahir: json["tanggal_lahir"],
        email: json["email"],
        no_telp: json["no_telp"],
        alamat: json["role_id"],
        jenis_kelamin: json["jenis_kelamin"],
        foto: json["foto"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "tanggal_lahir": tanggal_lahir,
        "email": email,
        "no_telp": no_telp,
        "alamat": alamat,
        "jenis_kelamin": jenis_kelamin,
        "foto": foto,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
