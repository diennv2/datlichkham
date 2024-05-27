import 'package:ytehaiduong/app/common/auth_controller.dart';
import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      authController.checkVersion();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kOrangeColor,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
                bottom: kDefaultPadding,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "by [Techber.vn] © 2022 ",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ))),
            Center(
                child: Image.asset(
              "assets/icons/logo.jpg",
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            )),
          ],
        ),
      ),
    );
  }
}
