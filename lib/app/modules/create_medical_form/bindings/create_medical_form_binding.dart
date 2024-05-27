import 'package:get/get.dart';

import '../controllers/create_medical_form_controller.dart';

class CreateMedicalFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMedicalFormController>(
      () => CreateMedicalFormController(),
    );
  }
}
