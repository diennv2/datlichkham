import 'dart:convert';

import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/data/block_time_model.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

import '../../../common/api.dart';
import '../../../common/utils.dart';
import '../../../data/bacsy_model.dart';
import '../../../data/chuyenkhoa_model.dart';
import '../../../data/lichenkham_model.dart';

class BookDetailController extends GetxController {
  static final _log = Logger("BookDetailController");
  final box = GetStorage();
  final AuthController _authController = Get.find();

  final listChuyenKhoa = <ChuyenKhoaModel>[].obs;
  final dataBacSy = <BacSyModel>[].obs;
  final listBacSy = <BacSyModel>[].obs;
  final isLoadingBS = false.obs;
  final isLoadingCK = false.obs;
  final isLoading = false.obs;
  final selectedBlockTime = 0.obs;
  final blockTimeModel = BlockTimeModel().obs;

  String _chuyenKhoaId = "0";
  String _bacSyId = "0";

  TextEditingController inputHoTenController = TextEditingController();
  TextEditingController inputBacSyController = TextEditingController();
  TextEditingController inputChuyenKhoaController = TextEditingController();
  TextEditingController inputNgayKhamController = TextEditingController();
  TextEditingController inputTrieuChungController = TextEditingController();

  final hasBHYT = false.obs;
  TextEditingController inputSoTheBHYTController = TextEditingController();
  TextEditingController inputNoiDangKyBDController = TextEditingController();
  TextEditingController inputThoiHanBatDauController = TextEditingController();
  TextEditingController inputThoiHanKetThucController = TextEditingController();
  final erroText = ["", "", "", "", "", "", ""].obs;

  final detailBookingForUpdate = LichHenKhamModel().obs;
  bool isUpdate = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initData();
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> initData() async {
    inputNgayKhamController.text =
        DateFormat("yyyy/MM/dd").format(DateTime.now());

    if (Get.arguments != null) {
      isUpdate = true;
      detailBookingForUpdate.value = Get.arguments["bookDetail"];
      inputNgayKhamController.text = DateFormat("yyyy/MM/dd")
          .format(DateTime.parse(detailBookingForUpdate.value.ngayHenKham!));
      selectedBlockTime.value = detailBookingForUpdate.value.khungKham!;
      inputTrieuChungController.text =
          detailBookingForUpdate.value.moTaTrieuChung!;
      update();
    }

    inputBacSyController.text = Get.parameters['bacSy'] ?? '';
    inputChuyenKhoaController.text = Get.parameters['chuyenKhoa'] ?? '';
    hasBHYT.value = Get.parameters['type'] != null &&
            Get.parameters['type'] == 'có bảo hiểm'
        ? true
        : false;
    _chuyenKhoaId = Get.parameters['chuyenKhoaId'] ?? '0';
    _bacSyId = Get.parameters['bacSyId'] ?? '0';

    await loadDataChuyenKhoa();
    await loadDataBacSy();

    if (int.parse(_chuyenKhoaId) > 0) {
      loadKhungGioKham(int.parse(_chuyenKhoaId));
    }
  }

  Future<void> loadDataChuyenKhoa() async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": _authController.tenantId
    };

    isLoadingCK.value = true;
    final res = await api.post("GetChuyenKhoa", data: jsonEncode(form));

    isLoadingCK.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList = res.data["result"]["chuyenKhoa"] as List;
      listChuyenKhoa.value =
          convertList.map((data) => ChuyenKhoaModel.fromJson(data)).toList();

      if (isUpdate) {
        selectChuyenKhoa(detailBookingForUpdate.value.tenChuyenKhoa!);
      }
    }
    update();
  }

  void selectChuyenKhoa(String value) async {
    clearError();

    inputChuyenKhoaController.text = value;
    final id = listChuyenKhoa.firstWhere((e) => e.ten == value).id;
    _chuyenKhoaId = "$id";
    if (inputNgayKhamController.text.isNotEmpty) loadKhungGioKham(id!);

    listBacSy.value = dataBacSy.where((e) => e.chuyenKhoaId == id).toList();
    inputBacSyController.text = "";
    _bacSyId = "0";

    update();
  }

  void selectBacSy(String value) async {
    clearError();

    inputBacSyController.text = value;
    final id = listBacSy
        .firstWhere((e) => "${e.chucDanh} ${e.surName} ${e.name}" == value)
        .bacSiId;
    _bacSyId = "$id";
    update();
  }

  Future<void> loadDataBacSy() async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": _authController.tenantId
    };

    isLoadingBS.value = true;
    final res = await api.post("GetDanhSachBacSiChuyenKhoaTenant",
        data: jsonEncode(form));
    isLoadingBS.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList =
          res.data["result"]["listDanhSachBacSiChuyenKhoaTenantDto"] as List;
      dataBacSy.value =
          convertList.map((data) => BacSyModel.fromJson(data)).toList();

      if (_chuyenKhoaId != "0") {
        listBacSy.value = dataBacSy
            .where((e) => e.chuyenKhoaId == int.parse(_chuyenKhoaId))
            .toList();

        if (isUpdate && detailBookingForUpdate.value.bacSiId != null) {
          final bs = listBacSy.firstWhere(
              (e) => e.bacSiId == detailBookingForUpdate.value.bacSiId);
          inputBacSyController.text = "${bs.chucDanh} ${bs.surName} ${bs.name}";
          _bacSyId = "${detailBookingForUpdate.value.bacSiId}";
        }
      }
    }
    update();
  }

  Future<void> loadKhungGioKham(int chuyenKhoaId) async {
    final form = <String, dynamic>{
      "ngayHenKham": inputNgayKhamController.text.replaceAll("/", "-"),
      "chuyenKhoaId": chuyenKhoaId,
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": _authController.tenantId
    };

    final res = await api.post("GetGioKhamTheoKhung", data: jsonEncode(form));
    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      blockTimeModel.value = BlockTimeModel.fromJson(res.data["result"]);
    }

    update();
  }

  void handleCheckBox(value) {
    hasBHYT(value);
    update();
  }

  void clearError() {
    erroText.value = ["", "", "", "", "", "", ""];
    update();
  }

  int validateInput() {
    clearError();
    final f = DateFormat("yyyyMMdd");

    var result = 0;
    if (inputChuyenKhoaController.text.isEmpty) {
      erroText[0] = "Vui lòng chọn chuyên khoa";
      result++;
    }
    // if (inputBacSyController.text.isEmpty) {
    //   erroText[1] = "Vui lòng chọn bác sỹ";
    //   result++;
    // }
    if (inputNgayKhamController.text.isEmpty) {
      erroText[2] = "Vui lòng chọn";
      result++;
    }
    final ngayKham =
        DateTime.parse(inputNgayKhamController.text.replaceAll("/", "-"));
    if (int.parse(f.format(ngayKham)) < int.parse(f.format(DateTime.now()))) {
      erroText[2] = "Vui lòng không chọn ngày quá khứ!";
      result++;
    }
    if (inputTrieuChungController.text.isEmpty) {
      erroText[4] = "Vui lòng mô tả triệu chứng";
      result++;
    }
    if (hasBHYT.value && inputSoTheBHYTController.text.isEmpty) {
      erroText[5] = "Vui lòng nhập số thẻ Số thẻ bảo hiểm y tế";
      result++;
    }
    if (hasBHYT.value && inputNoiDangKyBDController.text.isEmpty) {
      erroText[6] = "Vui lòng nhập nơi đăng ký ban đầu";
      result++;
    }
    update();
    return result;
  }

  Future<void> submit() async {
    if (validateInput() > 0) return;

    final form = <String, dynamic>{
      "nguoiThanId": "",
      "bacSiId": int.parse(_bacSyId),
      "chuyenKhoaId": int.parse(_chuyenKhoaId),
      "ngayHenKham":
          "${inputNgayKhamController.text.replaceAll('/', '-')} 00:00",
      "moTaTrieuChung": inputTrieuChungController.text,
      "isCoBHYT": hasBHYT.value,
      "soTheBHYT": inputSoTheBHYTController.text,
      "noiDangKyKCBDauTien": inputNoiDangKyBDController.text,
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": _authController.tenantId,
      "khungKham": selectedBlockTime.value.toString(),
      "lichHenKhamId": detailBookingForUpdate.value.lichHenKhamId ?? 0
    };

    isLoading.value = true;
    final res = await api.post(
        detailBookingForUpdate.value.lichHenKhamId != null &&
                detailBookingForUpdate.value.lichHenKhamId != 0
            ? "EditLichHenKham"
            : "DangKyKham",
        data: jsonEncode(form));
    isLoading.value = false;
    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      Get.offNamed(Routes.SUCCESS);
    }
  }

  void handleNgayKham(BuildContext context) async {
    final fd = DateFormat("yyyy/MM/dd");
    inputNgayKhamController.text = await Utils.selectDateBooking(context,
        DateTime.parse(inputNgayKhamController.text.replaceAll("/", "-")),
        initResult: inputNgayKhamController.text);
    if (inputChuyenKhoaController.text.isNotEmpty &&
        inputNgayKhamController.text.isNotEmpty) {
      loadKhungGioKham(int.parse(_chuyenKhoaId));
    }
    clearError();
  }

  // Future<void> generateDateBooking(
  //     {bool isToday = true,
  //     String startTimeWork1 = "8:30",
  //     String endTimeWork1 = "12:30",
  //     String startTimeWork2 = "13:30",
  //     String endTimeWork2 = "17:30",
  //     int blockTime = 15}) async {
  //   final f = DateFormat("HH:mm");
  //   final timeNow = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;
  //   _log.info("timeNow---------->[$timeNow]");
  //   _log.info("startTimeWork1---------->[$startTimeWork1]");
  //   _log.info("endTimeWork1---------->[$endTimeWork1]");
  //   _log.info("startTimeWork2---------->[$startTimeWork2]");
  //   _log.info("endTimeWork2---------->[$endTimeWork2]");

  //   if (int.parse(endTimeWork1.split(":")[0]) -
  //           int.parse(startTimeWork1.split(":")[0]) <
  //       0) return;
  //   if (int.parse(endTimeWork2.split(":")[0]) -
  //           int.parse(startTimeWork2.split(":")[0]) <
  //       0) return;
  //   final compareTime1 = (int.parse(endTimeWork1.split(":")[0]) -
  //               int.parse(startTimeWork1.split(":")[0])) *
  //           60 +
  //       int.parse(endTimeWork1.split(":")[1]) -
  //       int.parse(startTimeWork1.split(":")[1]);
  //   final compareTime2 = (int.parse(endTimeWork2.split(":")[0]) -
  //               int.parse(startTimeWork2.split(":")[0])) *
  //           60 +
  //       int.parse(endTimeWork2.split(":")[1]) -
  //       int.parse(startTimeWork2.split(":")[1]);

  //   if (compareTime1 % blockTime != 0) return;
  //   if (compareTime2 % blockTime != 0) return;

  //   var dt1 = DateTime(2020, 1, 1, int.parse(startTimeWork1.split(":")[0]),
  //       int.parse(startTimeWork1.split(":")[1]));
  //   listTime1.clear();
  //   for (var i = 1; i <= compareTime1 / blockTime + 1; i++) {
  //     final fdt = f.format(dt1);
  //     final compare =
  //         int.parse(fdt.split(":")[0]) * 60 + int.parse(fdt.split(":")[1]);
  //     listTime1.add(BlockTimeModel(
  //         id: i,
  //         name: fdt,
  //         activeColor: kPrimaryColor,
  //         disable: isToday && timeNow > compare ? true : false,
  //         compare: compare));
  //     dt1 = dt1.add(Duration(minutes: blockTime));
  //   }
  //   _log.info(
  //       "listTime1 [${listTime1.length}]: ${listTime1.map((e) => e.name).toList()}");

  //   var dt2 = DateTime(2020, 1, 1, int.parse(startTimeWork2.split(":")[0]),
  //       int.parse(startTimeWork2.split(":")[1]));
  //   listTime2.clear();
  //   for (var j = listTime1.length + 1;
  //       j <= (compareTime2 / blockTime + listTime1.length + 1);
  //       j++) {
  //     final fdt = f.format(dt2);
  //     final compare =
  //         int.parse(fdt.split(":")[0]) * 60 + int.parse(fdt.split(":")[1]);
  //     listTime2.add(BlockTimeModel(
  //         id: j,
  //         name: fdt,
  //         activeColor: kPrimaryColor,
  //         disable: isToday && timeNow > compare ? true : false,
  //         compare: compare));
  //     dt2 = dt2.add(Duration(minutes: blockTime));
  //   }
  //   _log.info(
  //       "listTime2 [${listTime2.length}]: ${listTime2.map((e) => e.name).toList()}");

  //   return;
  // }

  void handleSelectedBlockTime(GioKhamTheoKhung data) {
    selectedBlockTime.value = data.khungKham!;
    update();
  }
}
