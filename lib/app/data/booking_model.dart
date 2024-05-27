import 'package:ytehaiduong/app/data/bacsy_model.dart';
import 'package:ytehaiduong/app/data/chuyenkhoa_model.dart';
import 'package:ytehaiduong/app/data/lichenkham_model.dart';

class BookingModel {
  BookingModel({
    this.lichHenKham,
    this.thongTinChuyenKhoa,
    this.thongTinBacSi,
  });

  LichHenKhamModel? lichHenKham;
  ChuyenKhoaModel? thongTinChuyenKhoa;
  BacSyModel? thongTinBacSi;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        lichHenKham: json["lichHenKham"] == null
            ? null
            : LichHenKhamModel.fromJson(json["lichHenKham"]),
        thongTinChuyenKhoa: json["thongTinChuyenKhoa"] == null
            ? null
            : ChuyenKhoaModel.fromJson(json["thongTinChuyenKhoa"]),
        thongTinBacSi: json["thongTinBacSi"] == null
            ? null
            : BacSyModel.fromJson(json["thongTinBacSi"]),
      );

  Map<String, dynamic> toJson() => {
        "lichHenKham": lichHenKham,
        "thongTinChuyenKhoa": thongTinChuyenKhoa,
        "thongTinBacSi": thongTinBacSi,
      };
}
