import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/widgets/custom_appbar.dart';
import 'package:ytehaiduong/app/widgets/input_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_medical_form_controller.dart';

class CreateMedicalFormView extends GetView<CreateMedicalFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: kGradientFirst,
            )),
        Column(children: [
          CustomAppbar(
              isBack: true,
              title: "Khai báo y tế",
              onPressed: () => Get.back()),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding),
                        topRight: Radius.circular(kDefaultPadding),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 1",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding),
                        InputTextForm(
                            textTitle: "Tài khoản 2",
                            controllerText: controller.inputNameController),
                        SizedBox(height: kDefaultPadding * 2),
                        CupertinoButton(
                          child: Text("Khai báo"),
                          onPressed: () {},
                          color: kPrimaryColor,
                        ),
                        SizedBox(height: kDefaultPadding),
                      ],
                    ),
                  )))
        ]),
      ],
    ));
  }
}
