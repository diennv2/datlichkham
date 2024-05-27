import 'dart:convert';

import 'package:ytehaiduong/app/data/data_model.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/api.dart';
import '../../../common/utils.dart';

class RegisterController extends GetxController {
  final listGioiTinh = ["Nam", "Nữ", "Không xác định"];
  List<String> listTinhTP = dataThanhPho.map((e) => "${e.name}").toList();
  List<String> listQuanHuyen = ["Không xác định"];
  List<String> listPhuongXa = ["Không xác định"];

  TextEditingController inputCCCDController = TextEditingController();
  TextEditingController inputPasswordController = TextEditingController();

  TextEditingController inputHoTenController = TextEditingController();
  TextEditingController inputNgaySinhController = TextEditingController();
  TextEditingController inputGioiTinhController = TextEditingController();
  TextEditingController inputPhoneController = TextEditingController();
  TextEditingController inputEmailController = TextEditingController();

  TextEditingController inputTinhTPController = TextEditingController();
  TextEditingController inputQuanHuyenController = TextEditingController();
  TextEditingController inputPhuongXaController = TextEditingController();
  TextEditingController inputDiaChiController = TextEditingController();

  TextEditingController inputBHYTController = TextEditingController();
  TextEditingController inputKCBController = TextEditingController();
  TextEditingController inputThoiHanBatDauController = TextEditingController();
  TextEditingController inputThoiHanKetThucController = TextEditingController();

  final erroText = ["", "", "", "", "", "", "", "", "", "", "", "", ""].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initData() {
    inputGioiTinhController.text = "Nam";
    inputQuanHuyenController.text = "Không xác định";
    inputPhuongXaController.text = "Không xác định";
  }

  void handleChangeThanhPho(String val) {
    inputTinhTPController.text = val;
    inputQuanHuyenController.text = "Không xác định";
    inputPhuongXaController.text = "Không xác định";
    listQuanHuyen = ["Không xác định"];
    listPhuongXa = ["Không xác định"];
    update();
    if (val == "Không xác định") return;

    final provinceId = dataThanhPho.firstWhere((tp) => tp.name == val).id;
    listQuanHuyen = ["Không xác định"];
    listQuanHuyen.addAll(dataQuanHuyen
        .where((qh) => qh.provinceId == provinceId)
        .map((e) => "${e.name}")
        .toList());
    update();
  }

  void handleChangeQuanHuyen(String val) {
    inputQuanHuyenController.text = val;
    inputPhuongXaController.text = "Không xác định";
    listPhuongXa = ["Không xác định"];
    update();
    if (inputTinhTPController.text == "Không xác định" ||
        val == "Không xác định") return;

    final provinceId = dataThanhPho
        .firstWhere((tp) => tp.name == inputTinhTPController.text)
        .id;

    final districtId = dataQuanHuyen.firstWhere((qh) => qh.name == val).id;
    listPhuongXa.addAll(dataPhuongXa
        .where(
            (px) => px.provinceId == provinceId && px.districtId == districtId)
        .map((e) => "${e.name}")
        .toList());
    update();
  }

  void handleChangePhuongXa(String val) {
    inputPhuongXaController.text = val;
    update();
  }

  void handleNgaySinh(BuildContext context) async {
    inputNgaySinhController.text =
        await Utils.selectDate(context, DateTime.now());
  }

  void handleThoiHanBatDau(BuildContext context) async {
    inputThoiHanBatDauController.text =
        await Utils.selectDate(context, DateTime.now());
  }

  void handleThoiHanKetThuc(BuildContext context) async {
    inputThoiHanKetThucController.text =
        await Utils.selectDate(context, DateTime.now());
  }

  int validateInput() {
    var result = 0;
    erroText.value = ["", "", "", "", "", "", "", "", "", "", "", "", ""];
    if (inputCCCDController.text.isEmpty) {
      erroText[0] = "Vui lòng nhập thông tin căn cước công dân";
      result++;
    }
    if (inputPasswordController.text.isEmpty) {
      erroText[1] = "Vui lòng nhập mật khẩu";
      result++;
    }
    if (inputHoTenController.text.isEmpty) {
      erroText[2] = "Vui lòng nhập họ và tên";
      result++;
    }
    if (inputNgaySinhController.text.isEmpty) {
      erroText[3] = "Vui lòng nhập ngày sinh";
      result++;
    }
    if (inputPhoneController.text.isEmpty) {
      erroText[4] = "Vui lòng nhập số điện thoại";
      result++;
    }
    if (inputEmailController.text.isNotEmpty &&
        !inputEmailController.text.contains('@')) {
      erroText[5] = "Vui lòng nhập đúng định dạng email";
      result++;
    }
    if (inputTinhTPController.text == "Không xác định") {
      erroText[6] = "Vui lòng chọn thành phố";
    }
    if (inputQuanHuyenController.text == "Không xác định") {
      erroText[7] = "Vui lòng chọn quận huyện";
      result++;
    }
    if (inputPhuongXaController.text == "Không xác định") {
      erroText[8] = "Vui lòng chọn phường xã";
      result++;
    }
    if (inputDiaChiController.text.isEmpty) {
      erroText[9] = "Vui lòng nhập địa chỉ";
      result++;
    }
    if (inputBHYTController.text.isNotEmpty &&
        inputKCBController.text.isEmpty) {
      erroText[10] = "Vui lòng nhập nơi khám chữa bệnh";
      result++;
    }
    if (inputBHYTController.text.isNotEmpty &&
        inputThoiHanBatDauController.text.isEmpty) {
      erroText[11] = "Vui lòng nhập thời hạn bắt đầu";
      result++;
    }
    if (inputBHYTController.text.isNotEmpty &&
        inputThoiHanKetThucController.text.isEmpty) {
      erroText[12] = "Vui lòng nhập thời hạn kết thúc";
      result++;
    }
    update();
    return result;
  }

  Future<void> submit() async {
    if (validateInput() > 0) return;

    final form = <String, dynamic>{
      "hoVaTen": inputHoTenController.text,
      "tuoi": "",
      "gioiTinh": inputGioiTinhController.text,
      "diaChi":
          "${inputDiaChiController.text}, ${inputPhuongXaController.text}, ${inputQuanHuyenController.text}, ${inputTinhTPController.text}",
      "userName": inputCCCDController.text,
      "phoneNumber": inputPhoneController.text,
      "emailAddress": inputEmailController.text,
      "password": inputPasswordController.text,
      "namSinh": inputNgaySinhController.text.substring(0, 4),
      "thangSinh": inputNgaySinhController.text.substring(5, 7),
      "ngaySinh": inputNgaySinhController.text.substring(8, 10),
      "soTheBHYT": inputBHYTController.text,
      "noiDkBanDau": inputKCBController.text
    };

    isLoading.value = true;
    final res = await api.post("Register", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      Utils.showSuccessMessage(res.data["result"]["message"]);
      Get.offNamed(Routes.LOGIN);
    }
  }
}
