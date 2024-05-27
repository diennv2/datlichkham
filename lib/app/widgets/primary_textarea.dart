import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

import '../common/primary_style.dart';

class PrimaryTextArea extends StatelessWidget {
  const PrimaryTextArea(
      {Key? key,
      required this.controller,
      this.readOnly = false,
      this.icon,
      this.minLines = 5})
      : super(key: key);

  final TextEditingController controller;
  final bool readOnly;
  final Widget? icon;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: TextInputType.multiline,
      style: PrimaryStyle.medium(14, spacing: 1),
      minLines: minLines,
      maxLines: null,
      decoration: InputDecoration(
        suffixIcon: icon,
        errorStyle: PrimaryStyle.normal(17, color: kRedColor),
        contentPadding: const EdgeInsets.all(kDefaultPadding / 2),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: kBorderColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 1),
        ),
      ),
    );
  }
}
