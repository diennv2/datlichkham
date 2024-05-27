// To parse this JSON data, do
//
//     final giaDichVuModel = giaDichVuModelFromJson(jsonString);

import 'dart:convert';

GiaDichVuModel giaDichVuModelFromJson(String str) =>
    GiaDichVuModel.fromJson(json.decode(str));

String giaDichVuModelToJson(GiaDichVuModel data) => json.encode(data.toJson());

class GiaDichVuModel {
  GiaDichVuModel({
    this.mucGia,
    this.moTa,
    this.gia,
    this.ngayApDung,
    this.dichVuId,
    this.id,
  });

  String? mucGia;
  String? moTa;
  int? gia;
  String? ngayApDung;
  int? dichVuId;
  int? id;

  factory GiaDichVuModel.fromJson(Map<String, dynamic> json) => GiaDichVuModel(
        mucGia: json["mucGia"],
        moTa: json["moTa"],
        gia: json["gia"],
        ngayApDung: json["ngayApDung"],
        dichVuId: json["dichVuId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "mucGia": mucGia,
        "moTa": moTa,
        "gia": gia,
        "ngayApDung": ngayApDung,
        "dichVuId": dichVuId,
        "id": id,
      };
}
