import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/widgets/custom_appbar.dart';
import 'package:ytehaiduong/app/widgets/custom_bottom_sheet_search.dart';
import 'package:ytehaiduong/app/widgets/input_text_form.dart';
import 'package:ytehaiduong/app/widgets/input_textare_form.dart';
import 'package:ytehaiduong/app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/primary_style.dart';
import '../controllers/book_detail_controller.dart';
import 'block_time_view.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({Key? key}) : super(key: key);

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
        Column(children: [
          CustomAppbar(
              isBack: true,
              title: "Đặt lịch khám ${Get.parameters['type'] ?? ''}",
              onPressed: () => Get.back()),
          Expanded(
              child: GetBuilder<BookDetailController>(builder: (controller) {
            return Container(
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding),
                      topRight: Radius.circular(kDefaultPadding),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: kDefaultPadding / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: InputTextForm(
                            requireInput: true,
                            readOnly: true,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            viewError: controller.erroText[0].isNotEmpty
                                ? Text(controller.erroText[0],
                                    style: PrimaryStyle.normal(14,
                                        color: kRedColor))
                                : const SizedBox.shrink(),
                            onTap: () => {
                                  Get.bottomSheet(
                                      GetBuilder<BookDetailController>(
                                          builder: (_) {
                                    return CustomBottomSheetSearch(
                                        isLoading: _.isLoadingCK.value,
                                        listData: controller.listChuyenKhoa
                                            .map((e) => e.ten!)
                                            .toList(),
                                        onSelectParam: (val) {
                                          controller.selectChuyenKhoa(val);
                                          Get.back();
                                        });
                                  }), isScrollControlled: true)
                                },
                            textTitle: "Chuyên khoa",
                            controllerText:
                                controller.inputChuyenKhoaController),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: InputTextForm(
                            requireInput: false,
                            readOnly: true,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            viewError: controller.erroText[1].isNotEmpty
                                ? Text(controller.erroText[1],
                                    style: PrimaryStyle.normal(14,
                                        color: kRedColor))
                                : const SizedBox.shrink(),
                            onTap: () => {
                                  Get.bottomSheet(
                                      GetBuilder<BookDetailController>(
                                          builder: (_) {
                                    return CustomBottomSheetSearch(
                                        isLoading: _.isLoadingBS.value,
                                        listData: controller.listBacSy
                                            .map((e) =>
                                                "${e.chucDanh!} ${e.surName!} ${e.name!}")
                                            .toList(),
                                        onSelectParam: (val) {
                                          controller.selectBacSy(val);
                                          Get.back();
                                        });
                                  }), isScrollControlled: true)
                                },
                            textTitle: "Bác sỹ",
                            controllerText: controller.inputBacSyController),
                      ),
                      const Divider(
                          height: kDefaultPadding * 2,
                          thickness: kDefaultPadding / 2),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: InputTextForm(
                              requireInput: true,
                              readOnly: true,
                              onTap: () => controller.handleNgayKham(context),
                              textTitle: "Ngày khám",
                              viewError: controller.erroText[2].isNotEmpty
                                  ? Text(controller.erroText[2],
                                      style: PrimaryStyle.normal(14,
                                          color: kRedColor))
                                  : const SizedBox.shrink(),
                              controllerText:
                                  controller.inputNgayKhamController)),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Chọn khung giờ khám: ",
                            style: PrimaryStyle.bold(14)),
                      ),
                      GetBuilder<BookDetailController>(builder: (b1) {
                        if (b1.blockTimeModel.value.gioKhamTheoKhungSang ==
                            null) {
                          return const SizedBox.shrink();
                        }
                        return BlockTimeView(
                            data:
                                b1.blockTimeModel.value.gioKhamTheoKhungSang!);
                      }),
                      GetBuilder<BookDetailController>(builder: (b2) {
                        if (b2.blockTimeModel.value.gioKhamTheoKhungChieu ==
                            null) {
                          return const SizedBox.shrink();
                        }
                        return BlockTimeView(
                            data:
                                b2.blockTimeModel.value.gioKhamTheoKhungChieu!);
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: InputTextAreaForm(
                            textTitle: "Mô tả triệu chứng",
                            viewError: controller.erroText[4].isNotEmpty
                                ? Text(controller.erroText[4],
                                    style: PrimaryStyle.normal(14,
                                        color: kRedColor))
                                : const SizedBox.shrink(),
                            controllerText:
                                controller.inputTrieuChungController),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: kDefaultPadding / 2,
                          ),
                          Obx(() => Checkbox(
                              value: controller.hasBHYT.value,
                              onChanged: (val) =>
                                  controller.handleCheckBox(val))),
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () => controller
                                  .handleCheckBox(!controller.hasBHYT.value),
                              child: const Text("Có Bảo hiểm y tế"))
                        ],
                      ),
                      GetBuilder<BookDetailController>(builder: (_) {
                        if (_.hasBHYT.value == true) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: InputTextForm(
                                    requireInput: true,
                                    textTitle: "Số thẻ BHYT",
                                    viewError: controller.erroText[5].isNotEmpty
                                        ? Text(controller.erroText[5],
                                            style: PrimaryStyle.normal(14,
                                                color: kRedColor))
                                        : const SizedBox.shrink(),
                                    controllerText:
                                        controller.inputHoTenController),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: InputTextForm(
                                    requireInput: true,
                                    textTitle: "Nơi đăng ký KCB ban đầu",
                                    viewError: controller.erroText[6].isNotEmpty
                                        ? Text(controller.erroText[6],
                                            style: PrimaryStyle.normal(14,
                                                color: kRedColor))
                                        : const SizedBox.shrink(),
                                    controllerText:
                                        controller.inputHoTenController),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                      const SizedBox(height: kDefaultPadding * 4),
                    ],
                  ),
                ));
          }))
        ]),
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
                Expanded(child: GetBuilder<BookDetailController>(builder: (_) {
                  return RoundedButton(
                      text:
                          _.isUpdate == true ? "Sửa đặt lịch" : "Đặt lịch ngay",
                      press: () => _.submit(),
                      linearGradient: kGradientFirst);
                }))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
