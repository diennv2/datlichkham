import 'dart:convert';
import 'dart:typed_data';

import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logging/logging.dart';
import 'config.dart';

class Utils {
  static final _log = Logger("Utils");

  static void handleFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }

  static Future<bool> hasConnection() async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  static void showSuccessMessage(String text) {
    showMessage(Icons.task_alt_rounded, text, kGreenColor);
  }

  static void showWarningMessage(String text) {
    showMessage(Icons.warning_amber_rounded, text, kBlueColor);
  }

  static void showErrorMessage(String text) {
    // showMessage(Icons.highlight_off_rounded, text, kRedColor, intShow: 10);
    showCupertinoAlert(
        context: Get.context!, title: "error", content: text, onPressed: () {});
  }

  static void showMessage(IconData icon, String text, Color color,
      {int intShow = 2}) {
    Get.snackbar("", text,
        margin: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: intShow),
        backgroundColor: Colors.white,
        colorText: kBodyText,
        icon: Icon(
          icon,
          color: color,
          size: 30,
        ),
        onTap: (_) => Get.back(),
        borderWidth: 1,
        borderColor: color,
        titleText: SizedBox.shrink());
  }

  static void showCupertinoAlert(
      {required BuildContext context,
      required String title,
      required String content,
      required Function() onPressed}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Container(
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child: Text(content, style: PrimaryStyle.regular(14))),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Get.back(),
                child: Text("キャンセル",
                    style: PrimaryStyle.medium(14, color: kBlueColor)),
              ),
              CupertinoDialogAction(
                  onPressed: onPressed,
                  child: Text("OK",
                      style: PrimaryStyle.medium(14, color: kBlueColor)))
            ],
          );
        });
  }

  static void showCupertinoAlertConfig(
      {required BuildContext context,
      required String title,
      required String content,
      required Function() onPressed}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Container(
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child: Text(content, style: PrimaryStyle.regular(14))),
            actions: [
              CupertinoDialogAction(
                  onPressed: onPressed,
                  child: Text("OK",
                      style: PrimaryStyle.medium(14, color: kBlueColor)))
            ],
          );
        });
  }

  static Future<String> selectDate(
      BuildContext context, DateTime initDate) async {
    final fd = DateFormat("yyyy/MM/dd");
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(initDate.year + 1),
        confirmText: "Chọn");
    if (pickedDate != null) {
      return fd.format(pickedDate);
    }
    return "";
  }

  static Future<String> selectDateBooking(
      BuildContext context, DateTime initDate,
      {String initResult = ""}) async {
    final fd = DateFormat("yyyy/MM/dd");
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(initDate.year),
        lastDate: DateTime(initDate.year + 1),
        confirmText: "Chọn");
    if (pickedDate != null) {
      return fd.format(pickedDate);
    }
    return initResult;
  }

  static Future<String> selectTime(BuildContext context, TimeOfDay? initTime,
      {String initResult = ""}) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        confirmText: "Chọn",
        initialTime: initTime ?? TimeOfDay.now());
    if (pickedTime != null) {
      return "${pickedTime.format(context)}";
    }
    return initResult;
  }

  static Future<bool> checkBiometrics() async {
    final _auth = LocalAuthentication();
    try {
      if (await _auth.canCheckBiometrics == false) return false;
      return await _auth.authenticate(
          localizedReason: "Vui lòng quét vân tay để đăng nhập tự động.");
    } catch (e) {
      _log.severe("Errr: $e");
      showErrorMessage(
          "Không thể đăng nhập tự động. Vui lòng kiểm tra lại thiết bị có hỗ trợ hay không.");
      return false;
    }
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      width: double.infinity,
      fit: BoxFit.fitWidth,
      errorBuilder: (context, error, stack) => Image.asset(
          "assets/images/bs.jpg",
          width: double.infinity,
          fit: BoxFit.fitWidth),
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
