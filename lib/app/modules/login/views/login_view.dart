import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:ytehaiduong/app/widgets/button_loading.dart';
import 'package:ytehaiduong/app/widgets/input_text_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 128,
                          height: 128,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: kDefaultPadding),
                        const Text(
                          'Y TẾ HẢI DƯƠNG',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding * 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InputTextForm(
                          hintText: "Số thẻ CCCD hoặc số CMTND",
                          textTitle: "Tài khoản",
                          controllerText: controller.inputAccountNameController,
                          viewError: Obx(() => controller.errorList[0] != ""
                              ? Text(controller.errorList[0],
                              style: PrimaryStyle.normal(14, color: kRedColor))
                              : const SizedBox.shrink()),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Obx(() {
                          return InputTextForm(
                            textTitle: "Mật khẩu",
                            controllerText: controller.inputPasswordController,
                            icon: IconButton(
                                onPressed: () => controller.isShowPassword.value =
                                !controller.isShowPassword.value,
                                icon: controller.isShowPassword.value
                                    ? const Icon(Icons.lock)
                                    : const Icon(Icons.visibility)),
                            obscureText: controller.isShowPassword.value,
                            viewError: controller.errorList[1] != ""
                                ? Text(controller.errorList[1],
                                style:
                                PrimaryStyle.normal(14, color: kRedColor))
                                : const SizedBox.shrink(),
                          );
                        }),
                        const SizedBox(height: kDefaultPadding * 2),
                        Center(child: Obx(() {
                          if (controller.isLoading.value) {
                            return const ButtonLoading(
                                horizontal: kDefaultPadding * 4.5);
                          }

                          return CupertinoButton(
                              color: kDenimColor,
                              onPressed: () => controller.submit(),
                              child: const Text("Đăng nhập"));
                        })),
                        const Divider(height: kDefaultPadding * 2),
                        Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (controller.showFingerPrint.value) ...[
                                IconButton(
                                    onPressed: () => controller.autoLogin(1),
                                    icon:
                                    const Icon(Icons.fingerprint, size: 46))
                              ],
                              if (controller.showFaceId.value) ...[
                                IconButton(
                                    onPressed: () => controller.autoLogin(2),
                                    icon: const Icon(Icons.face, size: 46))
                              ]
                            ]))
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding * 1.8),
                    GestureDetector(
                        onTap: () => Get.toNamed(Routes.REGISTER),
                        child: const Text("Đăng ký mới",
                            style: TextStyle(
                                fontSize: 17,
                                color: kBlueColor,
                                decoration: TextDecoration.underline))),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg-login.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
