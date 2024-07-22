import 'dart:convert';

import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

import '../../../common/api.dart';
import '../../../common/utils.dart';
import '../../../data/user_model.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.find();
  final _authLocal = LocalAuthentication();

  final box = GetStorage();
  GlobalKey<FormState> keyFormLogin = GlobalKey<FormState>();
  TextEditingController inputAccountNameController = TextEditingController();
  TextEditingController inputTenantNameController = TextEditingController();
  TextEditingController inputPasswordController = TextEditingController();

  final isLoadingTenant = true.obs;
  final errorList = ["", ""].obs;
  final isShowPassword = true.obs;
  final isLoading = false.obs;
  final showFingerPrint = false.obs;
  final showFaceId = false.obs;

  String selectedTenant = "";
  @override
  void onInit() {
    // inputAccountNameController.text = "031083001045";
    // inputPasswordController.text = "123456";
    super.onInit();
  }

  @override
  void onReady() {
    initData();
    super.onReady();
  }

  @override
  void onClose() {
    inputAccountNameController.dispose();
    inputPasswordController.dispose();
  }

  void initData() async {
    if (_authController.isUpgrade == true) {
      return await _showUpgradeDialog(Get.context!);
    }

    // check has fingerprint or faceid
    if (await _authLocal.canCheckBiometrics == true) {
      List<BiometricType> listBiometricType =
          await _authLocal.getAvailableBiometrics();

      for (var item in listBiometricType) {
        if (item == BiometricType.fingerprint ||
            item == BiometricType.weak ||
            item == BiometricType.strong) {
          showFingerPrint.value = true;
        }
        if (item == BiometricType.face) {
          showFaceId.value = true;
        }
      }
    }
  }

  bool validate() {
    var result = true;
    final input1 = inputAccountNameController.text.trim();
    final input2 = inputPasswordController.text.trim();
    errorList.value = ["", "", ""];

    if (input1.isEmpty) {
      errorList[0] = "Vui lòng nhập tài khoản";
      result = false;
    }

    if (input1.length < 12) {
      errorList[0] = "Vui lòng nhập chính xác!";
      result = false;
    }

    if (input2.isEmpty) {
      errorList[1] = "Vui lòng nhập mật khẩu";
      result = false;
    }


    return result;
  }

  Future<void> autoLogin(mode) async {
    if (await Utils.checkBiometrics() == false) return;

    if (mode == 1 && box.read("fingerPrint") == null ||
        box.read("fingerPrint") == false) {
      Utils.showWarningMessage("Vui lòng cài đặt sau khi đăng nhập.");
      return;
    }
    if (mode == 2 && box.read("face") == null || box.read("face") == false) {
      Utils.showWarningMessage("Vui lòng cài đặt sau khi đăng nhập.");
      return;
    }
    if (showFaceId.value || showFingerPrint.value) {
      inputAccountNameController.text = box.read("username");
      inputPasswordController.text = box.read("pass");
      submit();
    }
  }

  Future<void> submit() async {
    if (!validate()) return;

    final form = <String, dynamic>{
      "accountName": inputAccountNameController.text.trim(),
      "passWord": inputPasswordController.text
    };

    isLoading.value = true;
    final res = await api.post("MobileLogin", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      box.write("token", res.data["result"]["token"]);
      box.write("userid", res.data["result"]["userid"]);
      box.write("username", res.data["result"]["username"]);
      box.write("pass", inputPasswordController.text);
      await getUserInfo();
    }
  }

  Future<void> getUserInfo() async {
    final form = <String, dynamic>{"token": box.read("token")};

    isLoading.value = true;
    final res = await api.post("GetThongTinNguoiBenh", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      _authController.userData.value =
          UserModel.fromJson(res.data['result']['thongTinNguoiBenhResultDto']);

      Get.offNamed(Routes.ROOT);
    }
  }

  Future<void> _showUpgradeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('Đã có phiên bản mới!!', textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Chúng tôi rất tiếc. Phiên bản hiện tại không còn được hỗ trợ',
                    textAlign: TextAlign.left),
                Text(
                    'Vui lòng ấn vào nút cập nhật phía dưới để nâng cấp ứng dụng!',
                    textAlign: TextAlign.left)
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.only(bottom: kDefaultPadding),
          actions: <Widget>[
            CupertinoButton(
                color: kPrimaryColor,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cập nhật ngay"))
          ],
        );
      },
    );
  }
}
