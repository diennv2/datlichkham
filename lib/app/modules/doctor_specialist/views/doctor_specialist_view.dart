import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/data/bacsy_model.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:ytehaiduong/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/utils.dart';
import '../controllers/doctor_specialist_controller.dart';

class DoctorSpecialistView extends GetView<DoctorSpecialistController> {
  final tenant = Get.parameters['tenant']!;
  final chuyenKhoa = Get.parameters['chuyenKhoa']!;
  final chuyenKhoaId = Get.parameters['chuyenKhoaId']!;

  List<Widget> buildDoctor() {
    List<BacSyModel> list = Get.arguments as List<BacSyModel>;
    return List.generate(
        list.length,
        (index) => ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: list[index].image != null
                      ? Utils.imageFromBase64String(list[index].image!).image
                      : const AssetImage("assets/images/bs.jpg")),
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              onTap: () => Get.toNamed(Routes.DOCTOR,
                  arguments: list[index],
                  parameters: {
                    'tenant': tenant,
                    'chuyenKhoa': chuyenKhoa,
                    'chuyenKhoaId': chuyenKhoaId
                  }),
              title: ListBody(
                children: [
                  Text(
                    "${list[index].chucDanh} ${list[index].surName} ${list[index].name}",
                    overflow: TextOverflow.ellipsis,
                    style: PrimaryStyle.normal(18),
                  ),
                  Text(
                    "${list[index].tieuSu}",
                    overflow: TextOverflow.ellipsis,
                    style: PrimaryStyle.medium(16),
                  ),
                ],
              ),
              subtitle: Text("${list[index].soLanDat} Lượt đặt khám",
                  style: PrimaryStyle.regular(12)),
            ));
  }

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
            isBack: true, title: "Chuyên khoa", onPressed: () => Get.back()),
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
                child: Column(children: [
                  Text(
                    chuyenKhoa.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Divider(height: kDefaultPadding, thickness: 2),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: buildDoctor()),
                    ),
                  ),
                ])))
      ])
    ]));
  }
}
