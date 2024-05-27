// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.hoVaTen,
    this.ngaySinh,
    this.gioiTinh,
    this.diaChi,
    this.phoneNumber,
    this.emailAddress,
    this.profilePicture,
    this.thangSinh,
    this.namSinh,
    this.soTheBhyt,
    this.noiDkBanDau,
    this.maDonViBhxh,
    this.giaTriSuDungTuNgay,
    this.thoiDiemDuNam,
  });

  String? hoVaTen;
  int? ngaySinh;
  String? gioiTinh;
  String? diaChi;
  String? phoneNumber;
  String? emailAddress;
  String? profilePicture;
  int? thangSinh;
  int? namSinh;
  String? soTheBhyt;
  String? noiDkBanDau;
  String? maDonViBhxh;
  String? giaTriSuDungTuNgay;
  String? thoiDiemDuNam;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        hoVaTen: json["hoVaTen"],
        ngaySinh: json["ngaySinh"],
        gioiTinh: json["gioiTinh"],
        diaChi: json["diaChi"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        profilePicture:
            json["profilePicture"] == null ? "" : json["profilePicture"],
        thangSinh: json["thangSinh"],
        namSinh: json["namSinh"],
        soTheBhyt: json["soTheBHYT"],
        noiDkBanDau: json["noiDkBanDau"],
        maDonViBhxh: json["maDonViBHXH"],
        giaTriSuDungTuNgay: json["giaTriSuDungTuNgay"],
        thoiDiemDuNam: json["thoiDiemDuNam"],
      );

  Map<String, dynamic> toJson() => {
        "hoVaTen": hoVaTen,
        "ngaySinh": ngaySinh,
        "gioiTinh": gioiTinh,
        "diaChi": diaChi,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "profilePicture": profilePicture,
        "thangSinh": thangSinh,
        "namSinh": namSinh,
        "soTheBHYT": soTheBhyt,
        "noiDkBanDau": noiDkBanDau,
        "maDonViBHXH": maDonViBhxh,
        "giaTriSuDungTuNgay": giaTriSuDungTuNgay,
        "thoiDiemDuNam": thoiDiemDuNam,
      };

  String get ngaysinhText {
    if (ngaySinh != null && thangSinh != null && namSinh != null) {
      return "$namSinh/${thangSinh.toString().padLeft(2, '0')}/${ngaySinh.toString().padLeft(2, '0')}";
    }
    return "";
  }
}
