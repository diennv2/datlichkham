import 'package:ytehaiduong/app/modules/booking/views/booking_view.dart';
import 'package:ytehaiduong/app/modules/home/views/home_view.dart';
import 'package:ytehaiduong/app/modules/notification/views/notification_view.dart';
import 'package:ytehaiduong/app/modules/setting/views/setting_view.dart';
import 'package:ytehaiduong/app/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: GetBuilder<RootController>(
          builder: (_) => Scaffold(
                body: PageView(
                  controller: _.pageController,
                  onPageChanged: _.onPageChanged,
                  children: [
                    HomeView(),
                    BookingView(),
                    NotificationView(),
                    SettingView()
                  ],
                ),
                bottomNavigationBar: CustomBottomNavigation(),
              )),
    );
  }
}
