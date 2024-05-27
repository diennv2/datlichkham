// To parse this JSON data, do
//
//     final blockTimeModel = blockTimeModelFromJson(jsonString);

import 'dart:convert';

BlockTimeModel blockTimeModelFromJson(String str) =>
    BlockTimeModel.fromJson(json.decode(str));

String blockTimeModelToJson(BlockTimeModel data) => json.encode(data.toJson());

class BlockTimeModel {
  BlockTimeModel({
    this.khamSession,
    this.gioBatDauLamViecSang,
    this.gioKetThucLamViecSang,
    this.gioBatDauLamViecChieu,
    this.gioKetThucLamViecChieu,
    this.gioKhamTheoKhungSang,
    this.gioKhamTheoKhungChieu,
  });

  int? khamSession;
  String? gioBatDauLamViecSang;
  String? gioKetThucLamViecSang;
  String? gioBatDauLamViecChieu;
  String? gioKetThucLamViecChieu;
  List<GioKhamTheoKhung>? gioKhamTheoKhungSang;
  List<GioKhamTheoKhung>? gioKhamTheoKhungChieu;

  factory BlockTimeModel.fromJson(Map<String, dynamic> json) => BlockTimeModel(
        khamSession: json["khamSession"],
        gioBatDauLamViecSang: json["gioBatDauLamViecSang"],
        gioKetThucLamViecSang: json["gioKetThucLamViecSang"],
        gioBatDauLamViecChieu: json["gioBatDauLamViecChieu"],
        gioKetThucLamViecChieu: json["gioKetThucLamViecChieu"],
        gioKhamTheoKhungSang: json["gioKhamTheoKhungSang"] == null
            ? null
            : List<GioKhamTheoKhung>.from(json["gioKhamTheoKhungSang"]
                .map((x) => GioKhamTheoKhung.fromJson(x))),
        gioKhamTheoKhungChieu: json["gioKhamTheoKhungChieu"] == null
            ? null
            : List<GioKhamTheoKhung>.from(json["gioKhamTheoKhungChieu"]
                .map((x) => GioKhamTheoKhung.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "khamSession": khamSession,
        "gioBatDauLamViecSang": gioBatDauLamViecSang,
        "gioKetThucLamViecSang": gioKetThucLamViecSang,
        "gioBatDauLamViecChieu": gioBatDauLamViecChieu,
        "gioKetThucLamViecChieu": gioKetThucLamViecChieu,
        "gioKhamTheoKhungSang": gioKhamTheoKhungSang == null
            ? null
            : List<dynamic>.from(gioKhamTheoKhungSang!.map((x) => x.toJson())),
        "gioKhamTheoKhungChieu": gioKhamTheoKhungChieu == null
            ? null
            : List<dynamic>.from(gioKhamTheoKhungChieu!.map((x) => x.toJson())),
      };
}

class GioKhamTheoKhung {
  GioKhamTheoKhung({
    this.khungKham,
    this.gioKham,
    this.isCoTheDat,
    this.moTa,
  });

  int? khungKham;
  String? gioKham;
  bool? isCoTheDat;
  String? moTa;

  factory GioKhamTheoKhung.fromJson(Map<String, dynamic> json) =>
      GioKhamTheoKhung(
        khungKham: json["khungKham"],
        gioKham: json["gioKham"],
        isCoTheDat: json["isCoTheDat"],
        moTa: json["moTa"],
      );

  Map<String, dynamic> toJson() => {
        "khungKham": khungKham,
        "gioKham": gioKham,
        "isCoTheDat": isCoTheDat,
        "moTa": moTa,
      };
}
