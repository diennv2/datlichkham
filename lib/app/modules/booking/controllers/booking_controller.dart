import 'dart:convert';
import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/data/lichenkham_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common/api.dart';
import '../../../common/config.dart';
import '../../../routes/app_pages.dart';

class BookingController extends GetxController {
  final box = GetStorage();
  final AuthController _authController = Get.find();

  final isLoading = true.obs;
  final listBooking = <LichHenKhamModel>[].obs;

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

  Future<void> loadDataBooking() async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": _authController.tenantId,
      // "tuNgay": "",
      // "denNgay": ""
    };

    isLoading.value = true;
    final res = await api.post("GetDanhSachDangKyKham", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList = res.data["result"]["lichHenKhamList"] as List;
      listBooking.value =
          convertList.map((data) => LichHenKhamModel.fromJson(data)).toList();
    }
    update();
  }

  Future<void> cancelBooking(BuildContext context, int id) async {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Hủy lịch đặt khám"),
            content: Container(
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child: const Text("Bạn có muốn hủy lịch hẹn này không?")),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Get.back(),
                child: const Text("Hủy"),
              ),
              CupertinoDialogAction(
                  onPressed: () async {
                    Get.back();
                    final form = <String, dynamic>{
                      "lichHenKhamId": id,
                      "token": box.read("token"),
                      "userid": box.read("userid"),
                      "username": box.read("username"),
                      "tenantId": _authController.tenantId,
                    };

                    final res = await api.post("HuyLichHenKham",
                        data: jsonEncode(form));

                    if (res.statusCode == 200 &&
                        res.data["result"]["errorCode"] == 0) {
                      Get.toNamed(Routes.SUCCESS);
                    }
                  },
                  child: Text("Đồng ý",
                      style: PrimaryStyle.medium(17, color: kRedColor)))
            ],
          );
        });
  }
}
