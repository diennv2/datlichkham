import 'dart:convert';

import 'package:ytehaiduong/app/data/nguoithan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/api.dart';
import '../../../common/auth_controller.dart';
import '../../../common/utils.dart';

class NguoithanController extends GetxController {
  final box = GetStorage();
  final AuthController _authController = Get.find();

  final listGioiTinh = ["Nam", "Nữ", "Không xác định"];
  TextEditingController inputHoTenController = TextEditingController();
  TextEditingController inputNgaySinhController = TextEditingController();
  TextEditingController inputGioiTinhController = TextEditingController();
  TextEditingController inputPhoneController = TextEditingController();
  TextEditingController inputQuanHeController = TextEditingController();
  TextEditingController inputDiaChiController = TextEditingController();

  final erroText = ["", "", "", "", ""].obs;
  final listData = <NguoiThanModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    loadDataNguoiThan();
    super.onReady();
  }

  @override
  void onClose() {}

  void handleNgaySinh(BuildContext context) async {
    DateTime initDate = DateTime.now();

    inputNgaySinhController.text = await Utils.selectDate(context, initDate);
  }

  int validateInput() {
    var result = 0;
    erroText.value = ["", "", "", "", ""];
    if (inputHoTenController.text.isEmpty) {
      erroText[0] = "Vui lòng nhập họ và tên";
      result++;
    }
    if (inputNgaySinhController.text.isEmpty) {
      erroText[1] = "Vui lòng nhập ngày sinh";
      result++;
    }
    if (inputPhoneController.text.isEmpty) {
      erroText[2] = "Vui lòng nhập số điện thoại";
      result++;
    }
    if (inputQuanHeController.text.isEmpty) {
      erroText[3] = "Vui lòng nhập mối quan hệ";
      result++;
    }
    if (inputDiaChiController.text.isEmpty) {
      erroText[4] = "Vui lòng nhập địa chỉ";
      result++;
    }
    update();
    return result;
  }

  Future<void> submit() async {
    if (validateInput() > 0) return;

    final form = <String, dynamic>{
      "hoVaTen": inputHoTenController.text,
      "tuoi": "0",
      "gioiTinh": inputGioiTinhController.text,
      "diaChi": inputDiaChiController.text,
      "phoneNumber": inputPhoneController.text,
      "moiQuanHe": inputQuanHeController.text,
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
    };

    isLoading.value = true;
    final res = await api.post("DangKyNguoiThan", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      Utils.showSuccessMessage(res.data["result"]["message"]);
    }
    update();
  }

  Future<void> loadDataNguoiThan() async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
    };

    isLoading.value = true;
    final res = await api.post("GetDanhSachNguoiThan", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList = res.data["result"]["nguoiThan"] as List;
      listData.value =
          convertList.map((data) => NguoiThanModel.fromJson(data)).toList();
    }
    update();
  }
}
