// To parse this JSON data, do
//
//     final nguoiThanModel = nguoiThanModelFromJson(jsonString);

import 'dart:convert';

NguoiThanModel nguoiThanModelFromJson(String str) =>
    NguoiThanModel.fromJson(json.decode(str));

String nguoiThanModelToJson(NguoiThanModel data) => json.encode(data.toJson());

class NguoiThanModel {
  NguoiThanModel({
    this.hoVaTen,
    this.tuoi,
    this.gioiTinh,
    this.diaChi,
    this.moiQuanHe,
    this.soDienThoai,
    this.nguoiBenhId,
    this.id,
  });

  String? hoVaTen;
  int? tuoi;
  String? gioiTinh;
  String? diaChi;
  String? moiQuanHe;
  String? soDienThoai;
  int? nguoiBenhId;
  int? id;

  factory NguoiThanModel.fromJson(Map<String, dynamic> json) => NguoiThanModel(
        hoVaTen: json["hoVaTen"] == null ? null : json["hoVaTen"],
        tuoi: json["tuoi"] == null ? null : json["tuoi"],
        gioiTinh: json["gioiTinh"] == null ? null : json["gioiTinh"],
        diaChi: json["diaChi"] == null ? null : json["diaChi"],
        moiQuanHe: json["moiQuanHe"] == null ? null : json["moiQuanHe"],
        soDienThoai: json["soDienThoai"] == null ? null : json["soDienThoai"],
        nguoiBenhId: json["nguoiBenhId"] == null ? null : json["nguoiBenhId"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "hoVaTen": hoVaTen == null ? null : hoVaTen,
        "tuoi": tuoi == null ? null : tuoi,
        "gioiTinh": gioiTinh == null ? null : gioiTinh,
        "diaChi": diaChi == null ? null : diaChi,
        "moiQuanHe": moiQuanHe == null ? null : moiQuanHe,
        "soDienThoai": soDienThoai == null ? null : soDienThoai,
        "nguoiBenhId": nguoiBenhId == null ? null : nguoiBenhId,
        "id": id == null ? null : id,
      };
}
