import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_history_controller.dart';

class BookHistoryView extends GetView<BookHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử đặt khám'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Đang tải dữ liệu...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
