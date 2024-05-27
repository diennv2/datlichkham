import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({
    Key? key,
    this.vertical = 8.5,
    this.horizontal = kDefaultPadding * 4,
  }) : super(key: key);

  final double vertical, horizontal;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: CircularProgressIndicator(color: kPrimaryColor, strokeWidth: 2),
        color: kPrimaryColor,
        onPressed: null);
  }
}
