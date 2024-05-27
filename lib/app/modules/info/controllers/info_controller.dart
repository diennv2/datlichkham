import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/data/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

import '../../../common/api.dart';
import '../../../common/utils.dart';

class InfoController extends GetxController {
  static final _log = Logger("InfoController");
  final box = GetStorage();
  final AuthController _authController = Get.find();

  final listGioiTinh = ["Nam", "Nữ", "Không xác định"];
  List<String> listTinhTP = dataThanhPho.map((e) => "${e.name}").toList();
  List<String> listQuanHuyen = ["Không xác định"];
  List<String> listPhuongXa = ["Không xác định"];

  final profileImage = "".obs;
  TextEditingController inputHoTenController = TextEditingController();
  TextEditingController inputNgaySinhController = TextEditingController();
  TextEditingController inputGioiTinhController = TextEditingController();
  TextEditingController inputPhoneController = TextEditingController();
  TextEditingController inputEmailController = TextEditingController();
  TextEditingController inputDiaChiController = TextEditingController();

  TextEditingController inputBHYTController = TextEditingController();
  TextEditingController inputKCBController = TextEditingController();
  TextEditingController inputThoiHanBatDauController = TextEditingController();
  TextEditingController inputThoiHanKetThucController = TextEditingController();

  final erroText = ["", "", "", "", "", "", "", ""].obs;
  final isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

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
    profileImage.value = _authController.userData.value.profilePicture!;
    inputHoTenController.text = _authController.userData.value.hoVaTen!;
    inputNgaySinhController.text = _authController.userData.value.ngaysinhText;
    inputGioiTinhController.text = _authController.userData.value.gioiTinh!;
    inputPhoneController.text = _authController.userData.value.phoneNumber!;
    inputEmailController.text = _authController.userData.value.emailAddress!;
    inputDiaChiController.text = _authController.userData.value.diaChi!;
    inputBHYTController.text = _authController.userData.value.soTheBhyt!;
    inputKCBController.text = _authController.userData.value.noiDkBanDau!;
    update();
  }

  void handleNgaySinh(BuildContext context) async {
    DateTime initDate = DateTime.now();
    if (_authController.userData.value.ngaysinhText != "") {
      initDate = DateTime.parse(
          _authController.userData.value.ngaysinhText.replaceAll("/", "-"));
    }

    inputNgaySinhController.text = await Utils.selectDate(context, initDate);
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
    erroText.value = ["", "", "", "", "", "", "", ""];
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
    if (inputEmailController.text.isNotEmpty &&
        !inputEmailController.text.contains('@')) {
      erroText[3] = "Vui lòng nhập đúng định dạng email";
      result++;
    }
    if (inputDiaChiController.text.isEmpty) {
      erroText[4] = "Vui lòng nhập địa chỉ";
      result++;
    }
    if (inputBHYTController.text.isNotEmpty &&
        inputKCBController.text.isEmpty) {
      erroText[5] = "Vui lòng nhập nơi khám chữa bệnh";
      result++;
    }
    if (inputBHYTController.text.isNotEmpty &&
        inputThoiHanBatDauController.text.isEmpty) {
      erroText[6] = "Vui lòng nhập thời hạn bắt đầu";
      result++;
    }
    if (inputBHYTController.text.isNotEmpty &&
        inputThoiHanKetThucController.text.isEmpty) {
      erroText[7] = "Vui lòng nhập thời hạn kết thúc";
      result++;
    }
    update();
    return result;
  }

  Future<void> submit() async {
    if (validateInput() > 0) return;

    final form = <String, dynamic>{
      "profilePicture": profileImage.value,
      "hoVaTen": inputHoTenController.text,
      "tuoi": "",
      "gioiTinh": inputGioiTinhController.text,
      "diaChi": inputDiaChiController.text,
      "phoneNumber": inputPhoneController.text,
      "emailAddress": inputEmailController.text,
      "ngaySinh": inputNgaySinhController.text.substring(8, 10),
      "thangSinh": inputNgaySinhController.text.substring(5, 7),
      "namSinh": inputNgaySinhController.text.substring(0, 4),
      "soTheBHYT": inputBHYTController.text,
      "noiDkBanDau": inputKCBController.text,
      // "giaTriSuDungTuNgay": giaTriSuDungTuNgay
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
    };

    isLoading.value = true;
    final res =
        await api.post("CapNhatThongTinNguoiBenh", data: jsonEncode(form));
    isLoading.value = false;

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      Utils.showSuccessMessage(res.data["result"]["message"]);
    }
  }

  Future<void> handlePicture(BuildContext context) async {
    try {
      // 1280x738
      final XFile? image = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1280,
          maxHeight: 738,
          imageQuality: 80);
      selectedImage = image;
      update();
      await uploadImage();
    } catch (e) {
      _log.severe("Error picker: $e");
    }
  }

  Future<void> uploadImage() async {
    Uint8List dataAsByteArray = await File(selectedImage!.path).readAsBytes();
    final form = <String, dynamic>{
      "token": box.read("token"),
      "userid": box.read("userid"),
      "username": box.read("username"),
      "jpegFileName": selectedImage!.name,
      "data": dataAsByteArray
    };

    final res = await api.post("UpdateAnh", data: jsonEncode(form));

    if (res.statusCode == 200 && res.data["result"]["errorCode"] == 0) {
      profileImage.value = res.data["result"]["imageUrl"];
      Utils.showSuccessMessage(res.data["result"]["message"]);
    }
  }
}
