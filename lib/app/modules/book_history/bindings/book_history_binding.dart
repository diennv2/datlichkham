import 'package:get/get.dart';

import '../controllers/book_history_controller.dart';

class BookHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookHistoryController>(
      () => BookHistoryController(),
    );
  }
}
