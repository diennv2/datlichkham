import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/modules/root/controllers/root_controller.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:ytehaiduong/app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../booking/controllers/booking_controller.dart';
import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: kGreenColor,
              backgroundImage: Image.asset("assets/icons/icon_ok.png").image,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              'Thành công!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: kDefaultPadding),
            SizedBox(
              width: Get.width * 0.5,
              child: RoundedButton(
                linearGradient: kGradientFirst,
                text: "Đã xong",
                press: () {
                  final bookingController = Get.put(BookingController());
                  bookingController.loadDataBooking();
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
