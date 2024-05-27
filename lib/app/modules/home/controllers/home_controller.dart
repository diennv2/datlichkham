import 'dart:convert';
import 'dart:io';

import 'package:ytehaiduong/app/common/api.dart';
import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/data/bacsy_model.dart';
import 'package:ytehaiduong/app/data/chuyenkhoa_model.dart';
import 'package:ytehaiduong/app/data/tenant_model.dart';
import 'package:ytehaiduong/app/modules/booking/controllers/booking_controller.dart';
import 'package:ytehaiduong/app/modules/notification/controllers/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  final AuthController _authController = Get.find();
  final BookingController _bookingController = Get.find();
  final NotificationController _notificationController = Get.find();

  final isLoadingTenant = true.obs;
  final isLoadingChuyenKhoa = true.obs;
  final isLoadingDichVu = true.obs;
  final listTenant = <TenantModel>[].obs;
  final listBacSyYT = <BacSyModel>[].obs;
  final listChuyenKhoa = <ChuyenKhoaModel>[].obs;
  final listBacSy = <BacSyModel>[].obs;

  final isLoadingBSYT = false.obs;
  final isLoadingCK = false.obs;
  final isLoadingBS = false.obs;

  String selectedTenant = "";

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onReady() {
    _showUpgradeDialog(Get.context!);
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> _showUpgradeDialog(BuildContext context) async {
    if (!_authController.isUpgrade) return;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ứng dụng đã có phiên bản mới!!',
              textAlign: TextAlign.center),
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
                onPressed: () {
                  if (Platform.isAndroid || Platform.isIOS) {
                    final appId = Platform.isAndroid
                        ? kAppStoreIdAndroid
                        : kAppStoreIdIos;
                    final url = Uri.parse(
                      Platform.isAndroid
                          ? "market://details?id=$appId"
                          : "https://apps.apple.com/app/id$appId",
                    );
                    launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                child: const Text("Cập nhật ngay"))
          ],
        );
      },
    );
  }

  void initData() async {
    await loadDataTenants();
  }

  Future<void> loadDataTenants() async {
    listTenant.add(TenantModel(tenantName: 'Vui lòng lựa chọn đơn vị khám'));

    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username")
    };

    isLoadingTenant.value = true;
    final res = await api.post("GetTenants", data: jsonEncode(form));
    isLoadingTenant.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList = res.data["result"]["tenants"] as List;
      listTenant.value = convertList.reversed
          .map((data) => TenantModel.fromJson(data))
          .toList();

      if (listTenant.isNotEmpty) {
        selectedTenant = listTenant[0].tenantName!;
        _authController.tenantId = listTenant[0].tenantId!;
        await loadDataBacSyYeuThich(listTenant[0].tenantId!);
        await loadDataChuyenKhoa(listTenant[0].tenantId!);
        await loadDataTimBacSy(listTenant[0].tenantId!);
        await _bookingController.loadDataBooking();
        await _notificationController.loadDataNoti();
      }
    }
    update();
  }

  void selectTenant(String value) async {
    selectedTenant = value;
    final tenantId =
        listTenant.firstWhere((e) => e.tenantName == value).tenantId;
    _authController.tenantId = tenantId!;

    listBacSyYT.clear();
    listChuyenKhoa.clear();
    listBacSy.clear();

    await loadDataBacSyYeuThich(tenantId);
    await loadDataChuyenKhoa(tenantId);
    await loadDataTimBacSy(tenantId);
    await _bookingController.loadDataBooking();
  }

  Future<void> loadDataBacSyYeuThich(int tenantId) async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": tenantId
    };

    isLoadingBSYT.value = true;
    final res = await api.post("GetDanhSachBacSiChuyenKhoaTenant",
        data: jsonEncode(form));

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList =
          res.data["result"]["listDanhSachBacSiChuyenKhoaTenantDto"] as List;
      listBacSyYT.value =
          convertList.map((data) => BacSyModel.fromJson(data)).toList();
    }

    isLoadingBSYT.value = false;
    update();
  }

  Future<void> loadDataChuyenKhoa(int tenantId) async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": tenantId
    };

    isLoadingCK.value = true;
    final res = await api.post("GetChuyenKhoa", data: jsonEncode(form));
    isLoadingCK.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList = res.data["result"]["chuyenKhoa"] as List;
      listChuyenKhoa.value =
          convertList.map((data) => ChuyenKhoaModel.fromJson(data)).toList();
    }
    update();
  }

  Future<void> loadDataTimBacSy(int tenantId) async {
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "tenantId": tenantId
    };

    isLoadingBS.value = true;
    final res = await api.post("GetDanhSachBacSiChuyenKhoaTenant",
        data: jsonEncode(form));
    isLoadingBS.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      final convertList =
          res.data["result"]["listDanhSachBacSiChuyenKhoaTenantDto"] as List;
      listBacSy.value =
          convertList.map((data) => BacSyModel.fromJson(data)).toList();
    }
    update();
  }

  void selectedChuyenKhoa(String value) async {
    final chuyenKhoa = listChuyenKhoa.firstWhere((e) => e.ten == value);
    final listDoctor =
        listBacSy.where((e) => e.chuyenKhoaId == chuyenKhoa.id!).toList();
    Get.toNamed(Routes.DOCTOR_SPECIALIST, arguments: listDoctor, parameters: {
      'chuyenKhoaId': "${chuyenKhoa.id}",
      'chuyenKhoa': value,
      'tenant': selectedTenant
    });
  }

  void selectBacSy(String value) async {
    final doctor = listBacSy
        .firstWhere((e) => "${e.chucDanh} ${e.surName} ${e.name}" == value);
    final chuyenKhoa =
        listChuyenKhoa.firstWhere((e) => e.id == doctor.chuyenKhoaId);

    Get.toNamed(Routes.DOCTOR, arguments: doctor, parameters: {
      'chuyenKhoaId': "${chuyenKhoa.id}",
      'chuyenKhoa': chuyenKhoa.ten!,
      'tenant': selectedTenant
    });
  }
}
