import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/primary_style.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/input_text_form.dart';
import '../../../widgets/rounded_button.dart';
import '../controllers/change_pass_controller.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          height: 200,
          decoration: const BoxDecoration(
            gradient: kGradientFirst,
          )),
      GetBuilder<ChangePassController>(
          builder: (controller) => Column(children: [
                CustomAppbar(
                    isBack: true,
                    title: "Đổi mật khẩu",
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
                              const SizedBox(height: kDefaultPadding / 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: InputTextForm(
                                  requireInput: true,
                                  obscureText: true,
                                  textTitle: "Mật khẩu cũ",
                                  controllerText:
                                      controller.inputPasswordController,
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
                                child: InputTextForm(
                                  requireInput: true,
                                  obscureText: true,
                                  textTitle: "Mật khẩu mới",
                                  controllerText:
                                      controller.inputNewPasswordController,
                                  viewError: controller.erroText[1].isNotEmpty
                                      ? Text(controller.erroText[1],
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
                                  obscureText: true,
                                  textTitle: "Mật khẩu xác nhận",
                                  controllerText:
                                      controller.inputConfirmPasswordController,
                                  viewError: controller.erroText[2].isNotEmpty
                                      ? Text(controller.erroText[2],
                                          style: PrimaryStyle.normal(14,
                                              color: kRedColor))
                                      : const SizedBox.shrink(),
                                ),
                              ),
                            ],
                          ),
                        ))),
              ])),
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
              Expanded(child:
                  GetBuilder<ChangePassController>(builder: (controller) {
                return RoundedButton(
                    text: controller.isLoading.value
                        ? "Đang xử lý..."
                        : "Đổi mật khẩu",
                    press: () =>
                        controller.isLoading.value ? null : controller.submit(),
                    linearGradient: controller.isLoading.value
                        ? kGradientLoading
                        : kGradientFirst);
              }))
            ],
          ),
        ),
      ),
    ]));
  }
}
