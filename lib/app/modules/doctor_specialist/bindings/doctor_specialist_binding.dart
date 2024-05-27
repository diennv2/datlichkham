import 'package:get/get.dart';

import '../controllers/doctor_specialist_controller.dart';

class DoctorSpecialistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorSpecialistController>(
      () => DoctorSpecialistController(),
    );
  }
}
