import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/api.dart';
import '../../../data/thong_bao_model.dart';

class NotificationController extends GetxController {
  final box = GetStorage();
  final isLoading = true.obs;
  final listNoti = <ThongBaoModel>[].obs;

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

  Future<void> loadDataNoti() async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username")
    };

    isLoading.value = true;
    final res = await api.post("GetThongBaoNguoiBenh", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList = res.data["result"]["listThongBaoNguoiBenh"] as List;
      listNoti.value =
          convertList.map((data) => ThongBaoModel.fromJson(data)).toList();
    }
  }

  Future<void> setReadNoti(int id, index) async {
    final form = <String, dynamic>{
      "idThongBao": id,
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username")
    };

    isLoading.value = true;
    final res =
        await api.post("SetTrangThaiThongBaoNguoiBenh", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      listNoti[index].trangThai = 1;
      listNoti.refresh();
    }
  }
}
