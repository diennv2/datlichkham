import 'package:get/get.dart';

import '../controllers/nguoithan_controller.dart';

class NguoithanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NguoithanController>(
      () => NguoithanController(),
    );
  }
}
