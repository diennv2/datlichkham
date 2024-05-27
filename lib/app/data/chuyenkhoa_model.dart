// To parse this JSON data, do
//
//     final chuyenKhoaModel = chuyenKhoaModelFromJson(jsonString);

import 'dart:convert';

ChuyenKhoaModel chuyenKhoaModelFromJson(String str) =>
    ChuyenKhoaModel.fromJson(json.decode(str));

String chuyenKhoaModelToJson(ChuyenKhoaModel data) =>
    json.encode(data.toJson());

class ChuyenKhoaModel {
  ChuyenKhoaModel({
    this.ten,
    this.moTa,
    this.id,
  });

  String? ten;
  String? moTa;
  int? id;

  factory ChuyenKhoaModel.fromJson(Map<String, dynamic> json) =>
      ChuyenKhoaModel(
        ten: json["ten"],
        moTa: json["moTa"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ten": ten,
        "moTa": moTa,
        "id": id,
      };
}
