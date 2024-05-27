import 'dart:io';

import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/modules/info/controllers/info_controller.dart';
import 'package:ytehaiduong/app/widgets/custom_appbar.dart';
import 'package:ytehaiduong/app/widgets/dropdown_form.dart';
import 'package:ytehaiduong/app/widgets/input_text_form.dart';
import 'package:ytehaiduong/app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: kGradientFirst,
            )),
        GetBuilder<InfoController>(
          builder: (controller) => Column(children: [
            CustomAppbar(
                isBack: true,
                title: "Cập nhật thông tin",
                onPressed: () => Get.back()),
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kDefaultPadding),
                          topRight: Radius.circular(kDefaultPadding),
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kDefaultPadding / 2,
                          ),
                          Center(
                              child: InkWell(
                            onTap: () => controller.handlePicture(context),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: kPrimaryColor,
                              backgroundImage: controller.selectedImage != null
                                  ? Image.file(
                                          File(controller.selectedImage!.path),
                                          fit: BoxFit.cover)
                                      .image
                                  : Image.network(controller.profileImage.value,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Image.asset(
                                              "assets/icons/logo.jpg")).image,
                              child:
                                  const Icon(Icons.edit, color: Colors.white),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InputTextForm(
                              requireInput: true,
                              textTitle: "Họ và tên",
                              controllerText: controller.inputHoTenController,
                              viewError: controller.erroText[0].isNotEmpty
                                  ? Text(controller.erroText[0],
                                      style: PrimaryStyle.normal(14,
                                          color: kRedColor))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: InputTextForm(
                                    requireInput: true,
                                    readOnly: true,
                                    onTap: () =>
                                        controller.handleNgaySinh(context),
                                    textTitle: "Ngày sinh",
                                    type: TextInputType.phone,
                                    controllerText:
                                        controller.inputNgaySinhController,
                                    viewError: controller.erroText[1].isNotEmpty
                                        ? Text(controller.erroText[1],
                                            style: PrimaryStyle.normal(14,
                                                color: kRedColor))
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                                const SizedBox(width: kDefaultPadding),
                                Expanded(
                                  child: DropDownForm(
                                    title: "Giới tính",
                                    list: controller.listGioiTinh,
                                    initValue: "Nam",
                                    onChange: (val) => controller
                                        .inputGioiTinhController.text = val,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InputTextForm(
                              requireInput: true,
                              textTitle: "Số điện thoại",
                              type: TextInputType.phone,
                              controllerText: controller.inputPhoneController,
                              viewError: controller.erroText[2].isNotEmpty
                                  ? Text(controller.erroText[2],
                                      style: PrimaryStyle.normal(14,
                                          color: kRedColor))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InputTextForm(
                              requireInput: true,
                              textTitle: "Email",
                              type: TextInputType.emailAddress,
                              controllerText: controller.inputEmailController,
                              viewError: controller.erroText[3].isNotEmpty
                                  ? Text(controller.erroText[3],
                                      style: PrimaryStyle.normal(14,
                                          color: kRedColor))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InputTextForm(
                              requireInput: true,
                              textTitle: "Địa chỉ",
                              controllerText: controller.inputDiaChiController,
                              viewError: controller.erroText[4].isNotEmpty
                                  ? Text(controller.erroText[4],
                                      style: PrimaryStyle.normal(14,
                                          color: kRedColor))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          const Divider(
                              height: kDefaultPadding * 2,
                              thickness: kDefaultPadding / 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InputTextForm(
                                textTitle: "Số thẻ BHYT",
                                type: TextInputType.phone,
                                controllerText: controller.inputBHYTController),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: InputTextForm(
                              textTitle: "Nơi đăng ký KCB ban đầu",
                              controllerText: controller.inputKCBController,
                              viewError: controller.erroText[5].isNotEmpty
                                  ? Text(controller.erroText[5],
                                      style: PrimaryStyle.normal(14,
                                          color: kRedColor))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: InputTextForm(
                                  readOnly: true,
                                  onTap: () =>
                                      controller.handleThoiHanBatDau(context),
                                  textTitle: "Thời hạn thẻ",
                                  controllerText:
                                      controller.inputThoiHanBatDauController,
                                  viewError: controller.erroText[6].isNotEmpty
                                      ? Text(controller.erroText[6],
                                          style: PrimaryStyle.normal(14,
                                              color: kRedColor))
                                      : const SizedBox.shrink(),
                                )),
                                Text(" - ",
                                    style: PrimaryStyle.normal(20,
                                        height: 3, spacing: 3)),
                                Expanded(
                                    child: InputTextForm(
                                  readOnly: true,
                                  onTap: () =>
                                      controller.handleThoiHanKetThuc(context),
                                  textTitle: "",
                                  controllerText:
                                      controller.inputThoiHanKetThucController,
                                  viewError: controller.erroText[7].isNotEmpty
                                      ? Text(controller.erroText[7],
                                          style: PrimaryStyle.normal(14,
                                              color: kRedColor))
                                      : const SizedBox.shrink(),
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding * 4),
                        ],
                      ),
                    )))
          ]),
        ),
        Positioned(
          bottom: kDefaultPadding,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            width: Get.width,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    primary: kShadowColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const SizedBox(width: kDefaultPadding / 2),
                Expanded(
                    child: GetBuilder<InfoController>(
                        builder: (_) => RoundedButton(
                            text: _.isLoading.value
                                ? "Đang xử lý..."
                                : "Cập nhật",
                            press: () => _.isLoading.value ? null : _.submit(),
                            linearGradient: _.isLoading.value
                                ? kGradientLoading
                                : kGradientFirst)))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
