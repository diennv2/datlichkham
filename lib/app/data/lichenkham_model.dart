// To parse this JSON data, do
//
//     final lichHenKhamModel = lichHenKhamModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

LichHenKhamModel lichHenKhamModelFromJson(String str) =>
    LichHenKhamModel.fromJson(json.decode(str));

String lichHenKhamModelToJson(LichHenKhamModel data) =>
    json.encode(data.toJson());

class LichHenKhamModel {
  LichHenKhamModel(
      {this.lichHenKhamId,
      this.ngayHenKham,
      this.moTaTrieuChung,
      this.isCoBhyt,
      this.soTheBhyt,
      this.noiDangKyKcbDauTien,
      this.bhytValidDate,
      this.phuongThucThanhToan,
      this.isDaKham,
      this.isDaThanhToan,
      this.timeHoanThanhKham,
      this.timeHoanThanhThanhToan,
      this.chiDinhDichVuSerialize,
      this.flag,
      this.qrString,
      this.bacSiId,
      this.tongTienDaThanhToan,
      this.tienThua,
      this.thuNganId,
      this.nguoiBenhId,
      this.nguoiThanId,
      this.chuyenKhoaId,
      this.tenChuyenKhoa,
      this.moTaChuyenKhoa,
      this.tenantId,
      this.tenantName,
      this.name,
      this.surname,
      this.emailAddress,
      this.phoneNumber,
      this.tieuSu,
      this.chucDanh,
      this.type,
      this.khungKham,
      this.gioKham});

  int? lichHenKhamId;
  String? ngayHenKham;
  String? moTaTrieuChung;
  bool? isCoBhyt;
  String? soTheBhyt;
  String? noiDangKyKcbDauTien;
  String? bhytValidDate;
  int? phuongThucThanhToan;
  bool? isDaKham;
  bool? isDaThanhToan;
  String? timeHoanThanhKham;
  String? timeHoanThanhThanhToan;
  String? chiDinhDichVuSerialize;
  int? flag;
  String? qrString;
  int? bacSiId;
  double? tongTienDaThanhToan;
  double? tienThua;
  int? thuNganId;
  int? nguoiBenhId;
  int? nguoiThanId;
  int? chuyenKhoaId;
  String? tenChuyenKhoa;
  String? moTaChuyenKhoa;
  int? tenantId;
  String? tenantName;
  String? name;
  String? surname;
  String? emailAddress;
  String? phoneNumber;
  String? tieuSu;
  String? chucDanh;
  String? type;
  int? khungKham;
  String? gioKham;

  factory LichHenKhamModel.fromJson(Map<String, dynamic> json) =>
      LichHenKhamModel(
        lichHenKhamId: json["lichHenKhamId"],
        ngayHenKham: json["ngayHenKham"],
        moTaTrieuChung: json["moTaTrieuChung"],
        isCoBhyt: json["isCoBHYT"],
        soTheBhyt: json["soTheBHYT"],
        noiDangKyKcbDauTien: json["noiDangKyKCBDauTien"],
        bhytValidDate: json["bhytValidDate"],
        phuongThucThanhToan: json["phuongThucThanhToan"],
        isDaKham: json["isDaKham"],
        isDaThanhToan: json["isDaThanhToan"],
        timeHoanThanhKham: json["timeHoanThanhKham"],
        timeHoanThanhThanhToan: json["timeHoanThanhThanhToan"],
        chiDinhDichVuSerialize: json["chiDinhDichVuSerialize"],
        flag: json["flag"],
        qrString: json["qrString"],
        bacSiId: json["bacSiId"],
        tongTienDaThanhToan: json["tongTienDaThanhToan"],
        tienThua: json["tienThua"],
        thuNganId: json["thuNganId"],
        nguoiBenhId: json["nguoiBenhId"],
        nguoiThanId: json["nguoiThanId"],
        chuyenKhoaId: json["chuyenKhoaId"],
        tenChuyenKhoa: json["tenChuyenKhoa"],
        moTaChuyenKhoa: json["moTaChuyenKhoa"],
        tenantId: json["tenantId"],
        tenantName: json["tenantName"],
        name: json["name"],
        surname: json["surname"],
        emailAddress: json["emailAddress"],
        phoneNumber: json["phoneNumber"],
        tieuSu: json["tieuSu"],
        chucDanh: json["chucDanh"],
        type: json["type"],
        khungKham: json["khungKham"] ?? json["khungKham"],
        gioKham: json["gioKham"] ?? json["gioKham"],
      );

  Map<String, dynamic> toJson() => {
        "lichHenKhamId": lichHenKhamId,
        "ngayHenKham": ngayHenKham,
        "moTaTrieuChung": moTaTrieuChung,
        "isCoBHYT": isCoBhyt,
        "soTheBHYT": soTheBhyt,
        "noiDangKyKCBDauTien": noiDangKyKcbDauTien,
        "bhytValidDate": bhytValidDate,
        "phuongThucThanhToan": phuongThucThanhToan,
        "isDaKham": isDaKham,
        "isDaThanhToan": isDaThanhToan,
        "timeHoanThanhKham": timeHoanThanhKham,
        "timeHoanThanhThanhToan": timeHoanThanhThanhToan,
        "chiDinhDichVuSerialize": chiDinhDichVuSerialize,
        "flag": flag,
        "qrString": qrString,
        "bacSiId": bacSiId,
        "tongTienDaThanhToan": tongTienDaThanhToan,
        "tienThua": tienThua,
        "thuNganId": thuNganId,
        "nguoiBenhId": nguoiBenhId,
        "nguoiThanId": nguoiThanId,
        "chuyenKhoaId": chuyenKhoaId,
        "tenChuyenKhoa": tenChuyenKhoa,
        "moTaChuyenKhoa": moTaChuyenKhoa,
        "tenantId": tenantId,
        "tenantName": tenantName,
        "name": name,
        "surname": surname,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "tieuSu": tieuSu,
        "chucDanh": chucDanh,
        "type": type,
        "khungKham": khungKham,
        "gioKham": gioKham,
      };

  String get dayFromDate {
    if (ngayHenKham == null) return "";
    final f = DateFormat("dd");
    return f.format(DateTime.parse(ngayHenKham!));
  }

  String get dailyFromDate {
    if (ngayHenKham == null) return "";
    final f = DateFormat("MM/yyyy");
    return f.format(DateTime.parse(ngayHenKham!));
  }

  String get timeFromDate {
    if (ngayHenKham == null) return "";
    final f = DateFormat("HH:mm");
    return f.format(DateTime.parse(ngayHenKham!));
  }

  String get baoHiemText {
    if (isCoBhyt != null && isCoBhyt == true) return "Khám BHYT";
    return "Khám thường";
  }

  String get tenBacSy {
    if (chucDanh != null && name != null && surname != null) {
      return "$chucDanh $name $surname";
    }
    return "Chưa chỉ định bác sỹ";
  }
}
