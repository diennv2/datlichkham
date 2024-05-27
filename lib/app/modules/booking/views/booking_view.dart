import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kGradientFirst,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Text("Lịch hẹn khám bệnh",
                  style: PrimaryStyle.bold(20, color: kWhiteColor)),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: kDefaultPadding / 2),
                decoration: const BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding),
                      topRight: Radius.circular(kDefaultPadding),
                    )),
                child: RefreshIndicator(
                  onRefresh: () => controller.loadDataBooking(),
                  child: GetBuilder<BookingController>(builder: (_) {
                    if (_.listBooking.isEmpty) {
                      return Center(
                          child: Text("Không có dữ liệu.",
                              style: PrimaryStyle.normal(14)));
                    }
                    return ListView.separated(
                        itemCount: _.listBooking.length,
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Row(children: [
                            Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: kWhiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 0,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Text(_.listBooking[index].dayFromDate,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      _.listBooking[index].dailyFromDate,
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  ],
                                )),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.bottomSheet(
                                    Container(
                                        height: 130,
                                        color: Colors.white,
                                        child: Column(children: [
                                          ListTile(
                                              title: const Text(
                                                  "Sửa lịch hẹn khám"),
                                              onTap: () {
                                                Get.back();
                                                Get.toNamed(Routes.BOOK_DETAIL,
                                                    arguments: {
                                                      "bookDetail":
                                                          _.listBooking[index]
                                                    });
                                              }),
                                          const Divider(),
                                          ListTile(
                                            title: Text(
                                              "Hủy đặt lịch",
                                              style: PrimaryStyle.normal(14,
                                                  color: kRedColor),
                                            ),
                                            onTap: () {
                                              Get.back();
                                              controller.cancelBooking(
                                                  context,
                                                  _.listBooking[index]
                                                      .lichHenKhamId!);
                                            },
                                          )
                                        ])),
                                    isDismissible: true,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: kDefaultPadding / 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _.listBooking[index].tenBacSy,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Khoa ${_.listBooking[index].tenChuyenKhoa}",
                                        style: const TextStyle(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      // isCoBHYT
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_.listBooking[index].gioKham}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            " | ${_.listBooking[index].baoHiemText}",
                                            style: const TextStyle(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Text(
                                            "Trạng thái: ",
                                          ),
                                          Text(
                                            _.listBooking[index].isDaKham ==
                                                    true
                                                ? "Đặt lịch thành công"
                                                : "Chờ xác nhận",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: controller
                                                            .listBooking[index]
                                                            .isDaKham ==
                                                        true
                                                    ? kGreenColor
                                                    : kBorderColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        });
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
