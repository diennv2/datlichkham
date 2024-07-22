import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/data/tenant_model.dart';
import 'package:ytehaiduong/app/modules/notification/views/notification_view.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:ytehaiduong/app/widgets/custom_bottom_sheet_search.dart';
import 'package:ytehaiduong/app/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/auth_controller.dart';
import '../controllers/home_controller.dart';
import 'components/box_doctor2.dart';
import 'components/box_main_category.dart';
import 'components/box_main_header.dart';

class HomeView extends GetView<HomeController> {
  static final _log = Logger("HomeView");
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),

        child: Column(
          children: [
            // Thêm phần chào, avatar và chuông thông báo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: Image.network(
                        _authController.userData.value.profilePicture!,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/icons/logo.jpg")).image),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Xin chào, ${_authController.userData.value.hoVaTen} !',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Chúng tôi có thể giúp gì cho bạn?',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            GetBuilder<HomeController>(
              builder: (_) {
                if (_.isLoadingTenant.value == true) {
                  return const CircularProgressIndicator();
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomDropDown(
                      initValue: _.selectedTenant,
                      onChange: (value) => _.selectTenant(value),
                      listDropDown: _. listTenant
                          .map((TenantModel val) => DropdownMenuItem(
                          value: val.tenantName,
                          child: Text("${val.tenantName}",
                              style: PrimaryStyle.bold(14))))
                          .toList()),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              children: [
                BoxMainHeader(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse("https://techber.vn"))) {
                        _log.info("Can not open this url");
                      }
                    },
                    title: "Xem Tin tức",
                    // gradient: kGradientFirst,
                    icon: Icons.newspaper),
                BoxMainHeader(
                    onTap: () => Get.toNamed(Routes.BOOK_DETAIL),
                    title: "Đặt lịch khám",
                    // gradient: kGradientFirst,
                    icon: Icons.schedule_outlined),
                BoxMainHeader(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse("tel:02202223555"))) {
                        _log.info("Can not open this url");
                      }
                    },
                    title: "Tư vấn khám",
                    // gradient: kGradientFirst,
                    icon: Icons.phone_enabled_outlined),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            const Text(
              "Bác sỹ được yêu thích ❤",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            GetBuilder<HomeController>(builder: (_) {
              if (_.isLoadingBSYT.value) {
                return const BoxDoctor2(data: [], data2: [], tenant: '');
              }
              return BoxDoctor2(
                  data: controller.listBacSyYT,
                  data2: controller.listChuyenKhoa,
                  tenant: controller.selectedTenant);
            }),
            const SizedBox(height: kDefaultPadding),
            const SizedBox(height: 10),
            InkWell(
              onTap: () =>
                  Get.bottomSheet(GetBuilder<HomeController>(builder: (_) {
                return CustomBottomSheetSearch(
                    isLoading: _.isLoadingCK.value,
                    listData: controller.listChuyenKhoa
                        .map((val) => val.ten!)
                        .toList(),
                    onSelectParam: (val) {
                      Get.back();
                      _.selectedChuyenKhoa(val);
                    });
              }), isScrollControlled: true),
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tìm bác sỹ theo chuyên khoa",
                      style: PrimaryStyle.bold(17, color: kWhiteColor),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: kDefaultPadding),
                    const Icon(
                      Icons.search,
                      color: kWhiteColor,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                    gradient: kGradientFirst),
                child: Column(children: [
                  Text(
                    "Danh mục",
                    style: PrimaryStyle.bold(18, color: kWhiteColor),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoxMainCategory(
                              press: () => Get.toNamed(Routes.BOOK_DETAIL,
                                  parameters: {'type': 'thường'}),
                              title: "Khám thường",
                              icon: Icons.calendar_month),
                          BoxMainCategory(
                              press: () => Get.toNamed(Routes.BOOK_DETAIL,
                                  parameters: {'type': 'có bảo hiểm'}),
                              title: "Khám Bảo hiểm y tế",
                              icon: Icons.folder_special_sharp),
                          BoxMainCategory(
                              press: () => Get.bottomSheet(
                                      GetBuilder<HomeController>(builder: (_) {
                                    return CustomBottomSheetSearch(
                                        isLoading: _.isLoadingBS.value,
                                        listData: controller.listBacSy
                                            .map((val) =>
                                                "${val.chucDanh!} ${val.surName!} ${val.name!}")
                                            .toList(),
                                        onSelectParam: (val) {
                                          Get.back();
                                          controller.selectBacSy(val);
                                        });
                                  }), isScrollControlled: true),
                              title: "Tìm kiếm bác sỹ",
                              icon: Icons.person_search),
                        ],
                      ),
                    ],
                  ),
                ])),
            const SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
