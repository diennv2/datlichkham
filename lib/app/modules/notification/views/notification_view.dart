import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/primary_style.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: kGradientFirst,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Text("Thông báo",
                  style: PrimaryStyle.bold(20, color: kWhiteColor)),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 18),
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding),
                      topRight: Radius.circular(kDefaultPadding),
                    )),
                child: RefreshIndicator(
                    onRefresh: () => controller.loadDataNoti(),
                    child: GetX<NotificationController>(builder: (_) {
                      if (_.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (_.listNoti.isEmpty) {
                        return Center(
                            child: Text("Không có dữ liệu.",
                                style: PrimaryStyle.normal(14)));
                      }
                      return ListView.separated(
                          itemCount: _.listNoti.length,
                          separatorBuilder: (context, index) {
                            return const Divider(height: 0);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding / 3),
                              decoration: BoxDecoration(
                                color: _.listNoti[index].trangThai != 0
                                    ? kWhiteColor
                                    : kNotRead,
                              ),
                              child: ListTile(
                                onTap: () => _.setReadNoti(
                                    _.listNoti[index].idThongBao!, index),
                                title: RichText(
                                  text: TextSpan(
                                    text: '${_.listNoti[index].tieuDe}\n',
                                    style: PrimaryStyle.medium(15,
                                        height: 1.5, color: kBodyText),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              '${_.listNoti[index].noiDungTinNhan}',
                                          style: PrimaryStyle.normal(14,
                                              spacing: 0.1, color: kBodyText)),
                                    ],
                                  ),
                                ),
                                subtitle: Text(_.listNoti[index].thoiGianText,
                                    style: PrimaryStyle.regular(14,
                                        height: 1.2, color: kBorderColor)),
                              ),
                            );
                          });
                    })),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
