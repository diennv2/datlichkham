import 'dart:async';
import 'dart:io';

import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

import '../data/user_model.dart';
import 'api.dart';
import 'config.dart';

class AuthController extends GetxController {
  static final _log = Logger("AuthController");
  final box = GetStorage();
  bool isUpgrade = false;

  // Setting user info in app
  final userData = UserModel().obs;
  bool hasBadge = false;
  String tokenDevice = "";
  final isLoadingNotification = true.obs;
  int tenantId = 0;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {}

  void checkVersion() async {
    final res = await api.post("CheckVersion", data: {});

    if (res.statusCode == 200 && res.data['result']['errorCode'] == 0) {
      final _setingVersion = res.data['result']['appVersions'];
      if (Platform.isIOS &&
          _setingVersion[0]['type'] == 'ios' &&
          _setingVersion[0]['version'] > kAppVersionIos) {
        isUpgrade = true;
      }
      if (Platform.isAndroid &&
          _setingVersion[1]['type'] == 'android' &&
          _setingVersion[1]['version'] > kAppVersionAndroid) {
        isUpgrade = true;
      }

      checkLogin();
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  Future<void> checkLogin() async {
    var token = box.read("token");
    _log.info("Token login: $token");

    if (token == null || token == "") {
      Get.offNamed(Routes.LOGIN);
      return;
    }

    final form = <String, dynamic>{"token": box.read("token")};
    final res = await api.post("GetThongTinNguoiBenh", data: form);

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      userData.value =
          UserModel.fromJson(res.data['result']['thongTinNguoiBenhResultDto']);
      Get.offNamed(Routes.ROOT);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
