import 'package:ytehaiduong/app/modules/booking/controllers/booking_controller.dart';
import 'package:ytehaiduong/app/modules/home/controllers/home_controller.dart';
import 'package:ytehaiduong/app/modules/notification/controllers/notification_controller.dart';
import 'package:ytehaiduong/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.put(BookingController());
    Get.put(NotificationController());
    Get.put(HomeController());
    Get.put(SettingController());
  }
}
