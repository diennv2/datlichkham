import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/api.dart';
import '../../../common/utils.dart';

class ChangePassController extends GetxController {
  final box = GetStorage();
  TextEditingController inputPasswordController = TextEditingController();
  TextEditingController inputNewPasswordController = TextEditingController();
  TextEditingController inputConfirmPasswordController =
      TextEditingController();
  final erroText = ["", "", ""].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  int validateInput() {
    var result = 0;
    erroText.value = ["", "", ""];
    if (inputPasswordController.text.isEmpty) {
      erroText[0] = "Vui lòng nhập mật khẩu cũ";
      result++;
    }
    if (inputNewPasswordController.text.isEmpty) {
      erroText[1] = "Vui lòng nhập mật khẩu mới";
      result++;
    }
    if (inputConfirmPasswordController.text.isEmpty) {
      erroText[2] = "Vui lòng nhập mật khẩu xác nhận";
      result++;
    }
    if (inputNewPasswordController.text.isNotEmpty &&
        inputConfirmPasswordController.text.isNotEmpty &&
        inputNewPasswordController.text !=
            inputConfirmPasswordController.text) {
      erroText[2] = "Mật khẩu xác nhận chưa giống nhau";
      result++;
    }

    update();
    return result;
  }

  Future<void> submit() async {
    if (validateInput() > 0) return;

    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "oldPassWord": inputPasswordController.text,
      "newPassWord": inputNewPasswordController.text,
    };

    isLoading.value = true;
    final res = await api.post("DoiMatKhau", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      Utils.showSuccessMessage(res.data["result"]["message"]);
    }
    update();
  }
}
