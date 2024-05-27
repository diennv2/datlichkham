// To parse this JSON data, do
//
//     final dichVuModel = dichVuModelFromJson(jsonString);

import 'dart:convert';

DichVuModel dichVuModelFromJson(String str) =>
    DichVuModel.fromJson(json.decode(str));

String dichVuModelToJson(DichVuModel data) => json.encode(data.toJson());

class DichVuModel {
  DichVuModel({
    this.ten,
    this.moTa,
    this.id,
  });

  String? ten;
  String? moTa;
  int? id;

  factory DichVuModel.fromJson(Map<String, dynamic> json) => DichVuModel(
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
