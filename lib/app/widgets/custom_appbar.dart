import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
    required this.isBack,
    this.onPressed,
    this.actions,
  }) : super(key: key);

  final String title;
  final bool isBack;
  final Function()? onPressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return isBack == true
        ? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 100.0,
            leading: TextButton.icon(
                onPressed: onPressed,
                icon: Container(
                    padding: EdgeInsets.zero,
                    width: 10.0,
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.white)),
                label: Text(
                  "Quay lại",
                  style: PrimaryStyle.medium(13, color: kWhiteColor),
                )),
            centerTitle: true,
            title:
                Text(title, style: PrimaryStyle.medium(20, color: kWhiteColor)),
            actions: actions,
          )
        : AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title:
                Text(title, style: PrimaryStyle.medium(20, color: kWhiteColor)),
            actions: actions,
          );
  }
}
