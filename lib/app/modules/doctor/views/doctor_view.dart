import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/common/utils.dart';
import 'package:ytehaiduong/app/data/bacsy_model.dart';
import 'package:ytehaiduong/app/modules/doctor/views/components/doctor_content.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:ytehaiduong/app/widgets/custom_appbar.dart';
import 'package:ytehaiduong/app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';

class DoctorView extends GetView<DoctorController> {
  final _tenant = Get.parameters['tenant'] ?? '';
  final _chuyenKhoa = Get.parameters['chuyenKhoa'] ?? '';
  final _chuyenKhoaId = Get.parameters['chuyenKhoaId'] ?? '';
  final BacSyModel _bacSyModel = Get.arguments as BacSyModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          height: 200,
          decoration: const BoxDecoration(
            gradient: kGradientFirst,
          )),
      Column(children: [
        CustomAppbar(
            isBack: true, title: "Hồ sơ bác sỹ", onPressed: () => Get.back()),
        Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 2, vertical: kDefaultPadding),
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding),
                      topRight: Radius.circular(kDefaultPadding),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 70,
                              backgroundImage: (_bacSyModel.image != null &&
                                      _bacSyModel.image!.isNotEmpty)
                                  ? Utils.imageFromBase64String(
                                          _bacSyModel.image!)
                                      .image
                                  : const AssetImage("assets/images/bs.jpg")),
                          const SizedBox(width: kDefaultPadding),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _tenant,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: kDefaultPadding / 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.people_alt_rounded,
                                          size: 24),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Lượt khám: ",
                                      ),
                                      Text("${_bacSyModel.soLanDat}",
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.favorite_border_rounded,
                                  //       size: 24,
                                  //     ),
                                  //     SizedBox(width: 5),
                                  //     Text("Yêu thích: ",
                                  //         style: TextStyle(color: kBodyText)),
                                  //     Text("1,200",
                                  //         style: TextStyle(
                                  //           fontSize: 17,
                                  //           fontWeight: FontWeight.w600,
                                  //         )),
                                  //   ],
                                  // )
                                ]),
                          ),
                        ],
                      ),
                      DoctorContent(
                          bacSyModel: _bacSyModel,
                          chuyenKhoa: "Chuyên khoa: $_chuyenKhoa")
                    ],
                  ),
                ))),
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
                  elevation: 0, backgroundColor: kShadowColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15),
                ),
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
              const SizedBox(width: kDefaultPadding / 2),
              Expanded(
                  child: RoundedButton(
                      text: "Đặt lịch ngay",
                      press: () => Get.toNamed(Routes.BOOK_DETAIL, parameters: {
                            'chuyenKhoaId': _chuyenKhoaId,
                            'chuyenKhoa': _chuyenKhoa,
                            'bacSy':
                                '${_bacSyModel.chucDanh} ${_bacSyModel.surName} ${_bacSyModel.name}',
                            'bacSyId': "${_bacSyModel.bacSiId}"
                          }),
                      linearGradient: kGradientFirst))
            ],
          ),
        ),
      ),
    ]));
  }
}
