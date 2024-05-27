// To parse this JSON data, do
//
//     final bacSyModel = bacSyModelFromJson(jsonString);

import 'dart:convert';

BacSyModel bacSyModelFromJson(String str) =>
    BacSyModel.fromJson(json.decode(str));

String bacSyModelToJson(BacSyModel data) => json.encode(data.toJson());

class BacSyModel {
  BacSyModel({
    this.bacSiId,
    this.chuyenKhoaId,
    this.name,
    this.surName,
    this.chucDanh,
    this.emailAddress,
    this.phoneNumber,
    this.image,
    this.tieuSu,
    this.soLanDat,
  });

  int? bacSiId;
  int? chuyenKhoaId;
  String? name;
  String? surName;
  String? chucDanh;
  String? emailAddress;
  String? phoneNumber;
  String? image;
  String? tieuSu;
  int? soLanDat;

  factory BacSyModel.fromJson(Map<String, dynamic> json) => BacSyModel(
        bacSiId: json["bacSiId"],
        chuyenKhoaId: json["chuyenKhoaId"],
        name: json["name"],
        surName: json["surname"],
        chucDanh: json["chucDanh"],
        emailAddress: json["emailAddress"],
        phoneNumber: json["phoneNumber"],
        image: json["image"],
        tieuSu: json["tieuSu"] ?? "",
        soLanDat: json["soLanDat"],
      );

  Map<String, dynamic> toJson() => {
        "bacSiId": bacSiId,
        "chuyenKhoaId": chuyenKhoaId,
        "name": name,
        "surName": surName,
        "chucDanh": chucDanh,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "image": image,
        "tieuSu": tieuSu,
        "soLanDat": soLanDat,
      };
}
