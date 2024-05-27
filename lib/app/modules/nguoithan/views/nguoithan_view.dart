import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../common/config.dart';
import '../../../widgets/dropdown_form.dart';
import '../../../widgets/input_text_form.dart';
import '../../../widgets/rounded_button.dart';
import '../controllers/nguoithan_controller.dart';

class NguoithanView extends GetView<NguoithanController> {
  const NguoithanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách người thân',
          style: PrimaryStyle.normal(20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<NguoithanController>(
          builder: (_) => SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: InputTextForm(
                      requireInput: true,
                      textTitle: "Họ và tên",
                      controllerText: _.inputHoTenController,
                      viewError: _.erroText[0].isNotEmpty
                          ? Text(_.erroText[0],
                              style: PrimaryStyle.normal(14, color: kRedColor))
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InputTextForm(
                            requireInput: true,
                            readOnly: true,
                            onTap: () => _.handleNgaySinh(context),
                            textTitle: "Ngày sinh",
                            type: TextInputType.phone,
                            controllerText: _.inputNgaySinhController,
                            viewError: _.erroText[1].isNotEmpty
                                ? Text(_.erroText[1],
                                    style: PrimaryStyle.normal(14,
                                        color: kRedColor))
                                : SizedBox.shrink(),
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        Expanded(
                          child: DropDownForm(
                            title: "Giới tính",
                            list: _.listGioiTinh,
                            initValue: "Nam",
                            onChange: (val) =>
                                _.inputGioiTinhController.text = val,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: InputTextForm(
                      requireInput: true,
                      textTitle: "Số điện thoại",
                      type: TextInputType.phone,
                      controllerText: _.inputPhoneController,
                      viewError: _.erroText[2].isNotEmpty
                          ? Text(_.erroText[2],
                              style: PrimaryStyle.normal(14, color: kRedColor))
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: InputTextForm(
                      requireInput: true,
                      textTitle: "Mối quan hệ",
                      controllerText: _.inputQuanHeController,
                      viewError: _.erroText[3].isNotEmpty
                          ? Text(_.erroText[3],
                              style: PrimaryStyle.normal(14, color: kRedColor))
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: InputTextForm(
                      requireInput: true,
                      textTitle: "Địa chỉ",
                      controllerText: _.inputDiaChiController,
                      viewError: _.erroText[4].isNotEmpty
                          ? Text(_.erroText[4],
                              style: PrimaryStyle.normal(14, color: kRedColor))
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: RoundedButton(
                        text: _.isLoading.value
                            ? "Đang xử lý..."
                            : "Đăng ký người thân",
                        press: () => _.isLoading.value ? null : _.submit(),
                        linearGradient: _.isLoading.value
                            ? kGradientLoading
                            : kGradientFirst),
                  ),
                  const Divider(
                      height: kDefaultPadding * 2,
                      thickness: kDefaultPadding / 2),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                        itemCount: _.listData.length,
                        separatorBuilder: (context, index) {
                          return const Divider(height: 0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding / 3),
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  text:
                                      'Họ và tên: ${_.listData[index].hoVaTen}\n',
                                  style: PrimaryStyle.medium(16),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Số điện thoại: ${_.listData[index].soDienThoai}',
                                        style: PrimaryStyle.normal(14)),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                  "Quan hệ: ${_.listData[index].moiQuanHe}",
                                  style: PrimaryStyle.regular(14, height: 2)),
                            ),
                          );
                        }),
                  )
                  // buildListNguoiThan()
                ],
              ))),
    );
  }
}
