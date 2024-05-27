import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

class SettingController extends GetxController {
  final box = GetStorage();
  final AuthController _authController = Get.find();
  final _authLocal = LocalAuthentication();
  final showFingerPrint = false.obs;
  final showFaceId = false.obs;
  final valueFingerPrint = false.obs;
  final valueFaceId = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void initData() async {
    // check has fingerprint or faceid
    if (await _authLocal.canCheckBiometrics == true) {
      List<BiometricType> listBiometricType =
          await _authLocal.getAvailableBiometrics();
      for (var item in listBiometricType) {
        if (item == BiometricType.fingerprint ||
            item == BiometricType.weak ||
            item == BiometricType.strong) {
          showFingerPrint.value = true;
          if (box.read("fingerPrint") != null) {
            valueFingerPrint.value = box.read("fingerPrint");
            update();
          }
        }
        if (item == BiometricType.face) {
          showFaceId.value = true;
          if (box.read("face") != null) {
            valueFingerPrint.value = box.read("face");
            update();
          }
        }
      }
    }
  }

  void hanldeLogout(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Đăng xuất"),
            content: Container(
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child:
                    const Text("Bạn có muốn đăng xuất tài khoản này không?")),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Get.back(),
                child: const Text("Hủy"),
              ),
              CupertinoDialogAction(
                  onPressed: () {
                    box.remove("token");
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: const Text("Đồng ý",
                      style: TextStyle(
                          fontSize: 17,
                          color: kRedColor,
                          fontWeight: FontWeight.w500)))
            ],
          );
        });
  }

  void handleStoreFingerPrintOrFaceId(mode) async {
    if (await _authLocal.canCheckBiometrics == false) return;
    List<BiometricType> availableBiometrics =
        await _authLocal.getAvailableBiometrics();
    if (mode == 1 &&
        (availableBiometrics.contains(BiometricType.fingerprint) ||
            availableBiometrics.contains(BiometricType.weak) ||
            availableBiometrics.contains(BiometricType.strong))) {
      valueFingerPrint.value = !valueFingerPrint.value;
      box.write("fingerPrint", valueFingerPrint.value);
    } else if (mode == 2 && availableBiometrics.contains(BiometricType.face)) {
      valueFaceId.value = !valueFaceId.value;
      box.write("face", valueFaceId.value);
    }
    update();
  }
}
