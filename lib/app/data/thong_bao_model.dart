// To parse this JSON data, do
//
//     final thongBaoModel = thongBaoModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

ThongBaoModel thongBaoModelFromJson(String str) =>
    ThongBaoModel.fromJson(json.decode(str));

String thongBaoModelToJson(ThongBaoModel data) => json.encode(data.toJson());

class ThongBaoModel {
  ThongBaoModel({
    this.idThongBao,
    this.nguoiBenhId,
    this.thoiGianGui,
    this.tieuDe,
    this.noiDungTinNhan,
    this.trangThai,
  });

  int? idThongBao;
  int? nguoiBenhId;
  String? thoiGianGui;
  String? tieuDe;
  String? noiDungTinNhan;
  int? trangThai;

  factory ThongBaoModel.fromJson(Map<String, dynamic> json) => ThongBaoModel(
        idThongBao: json["idThongBao"] == null ? null : json["idThongBao"],
        nguoiBenhId: json["nguoiBenhId"] == null ? null : json["nguoiBenhId"],
        thoiGianGui: json["thoiGianGui"] == null ? null : json["thoiGianGui"],
        tieuDe: json["tieuDe"] == null ? null : json["tieuDe"],
        noiDungTinNhan:
            json["noiDungTinNhan"] == null ? null : json["noiDungTinNhan"],
        trangThai: json["trangThai"] == null ? null : json["trangThai"],
      );

  Map<String, dynamic> toJson() => {
        "idThongBao": idThongBao == null ? null : idThongBao,
        "nguoiBenhId": nguoiBenhId == null ? null : nguoiBenhId,
        "thoiGianGui": thoiGianGui == null ? null : thoiGianGui,
        "tieuDe": tieuDe == null ? null : tieuDe,
        "noiDungTinNhan": noiDungTinNhan == null ? null : noiDungTinNhan,
        "trangThai": trangThai == null ? null : trangThai,
      };

  String get thoiGianText {
    if (thoiGianGui != null) {
      final f = DateFormat("dd/MM/yyyy HH:mm");
      return f.format(DateTime.parse(thoiGianGui!));
    }
    return "";
  }
}
