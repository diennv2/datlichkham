import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(gradient: kGradientFirst),
      child: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          ListTile(
            leading: CircleAvatar(
                radius: 30,
                backgroundColor: kPrimaryColor,
                backgroundImage: Image.network(
                    _authController.userData.value.profilePicture!,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/icons/logo.jpg")).image),
            title: Text("${_authController.userData.value.hoVaTen}",
                style: PrimaryStyle.bold(16, color: kWhiteColor)),
            subtitle: Text("${_authController.userData.value.phoneNumber}",
                style: PrimaryStyle.normal(14, color: kWhiteColor)),
            trailing: IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: kWhiteColor,
                ),
                onPressed: () => controller.hanldeLogout(context)),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding),
                )),
            child: Column(
              children: [
                ListTile(
                  onTap: () => Get.toNamed(Routes.INFO),
                  minLeadingWidth: 0,
                  leading: const Icon(Icons.person),
                  title: const Text("Thông tin cá nhân"),
                  trailing: const Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () => Get.toNamed(Routes.CHANGE_PASS),
                  leading: const Icon(Icons.password_rounded),
                  minLeadingWidth: 0,
                  title: const Text("Đổi mật khẩu"),
                  trailing: const Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () => Get.toNamed(Routes.NGUOITHAN),
                  leading: const Icon(Icons.people_alt_outlined),
                  minLeadingWidth: 0,
                  title: const Text("Thành viên gia đình"),
                  trailing: const Icon(Icons.chevron_right),
                ),
                // ListTile(
                //   onTap: () => Get.toNamed(Routes.BOOK_HISTORY),
                //   leading: Icon(Icons.schedule),
                //   minLeadingWidth: 0,
                //   title: Text("Lịch sử đặt khám"),
                //   trailing: Icon(Icons.chevron_right),
                // ),

                // ListTile(
                //   onTap: () => {},
                //   leading: Icon(Icons.fingerprint),
                //   minLeadingWidth: 0,
                //   title: Text("Đăng nhập bằng vân tay"),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // ListTile(
                //   onTap: () => {},
                //   leading: Icon(Icons.face_unlock_rounded),
                //   minLeadingWidth: 0,
                //   title: Text("Đăng nhập bằng khuôn mặt"),
                //   trailing: Icon(Icons.chevron_right),
                // ),

                ListTile(
                  onTap: () => {},
                  leading: const Icon(Icons.info_outline),
                  minLeadingWidth: 0,
                  title: const Text("Giới thiệu"),
                  trailing: const Icon(Icons.chevron_right),
                ),
                GetBuilder<SettingController>(
                  builder: (_) {
                    if (_.showFingerPrint.value) {
                      return ListTile(
                        onTap: () =>
                            controller.handleStoreFingerPrintOrFaceId(1),
                        leading: const Icon(Icons.fingerprint),
                        minLeadingWidth: 0,
                        title: const Text("Đăng nhập bằng vân tay"),
                        trailing: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              onChanged: (value) {},
                              activeColor: kGreenColor,
                              thumbColor: controller.valueFingerPrint.value
                                  ? Colors.white
                                  : kShadowColor,
                              value: controller.valueFingerPrint.value),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                GetBuilder<SettingController>(
                  builder: (_) {
                    if (_.showFaceId.value) {
                      return ListTile(
                        onTap: () =>
                            controller.handleStoreFingerPrintOrFaceId(2),
                        leading: const Icon(Icons.face),
                        minLeadingWidth: 0,
                        title: const Text("Đăng nhập bằng khuôn mặt"),
                        trailing: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              onChanged: (value) {},
                              activeColor: kGreenColor,
                              thumbColor: controller.valueFaceId.value
                                  ? Colors.white
                                  : kShadowColor,
                              value: controller.valueFaceId.value),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                ListTile(
                    onTap: () => controller.hanldeLogout(context),
                    leading: const Icon(Icons.logout),
                    minLeadingWidth: 0,
                    title: const Text("Đăng xuất")),
              ],
            ),
          ),
        ])),
      ),
    ));
  }
}
