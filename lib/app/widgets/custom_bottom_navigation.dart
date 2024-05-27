import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/modules/root/controllers/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
        builder: (_) => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) => _.changeRootPageIndex(index),
              currentIndex: _.rootPageIndex.value,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.black45,
              selectedIconTheme: const IconThemeData(
                  color: kPrimaryColor, opacity: 1.0, size: 32),
              unselectedIconTheme:
                  const IconThemeData(color: Colors.black45, opacity: 0.5),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Trang chủ'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history_sharp), label: 'Lịch hẹn'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Thông báo'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Cá nhân'),
              ],
            ));
  }
}
