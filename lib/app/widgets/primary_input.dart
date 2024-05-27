import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:flutter/material.dart';

import '../common/config.dart';

class PrimaryInput extends StatelessWidget {
  const PrimaryInput(
      {Key? key,
      required this.controller,
      this.onTap,
      this.readOnly = false,
      this.icon,
      this.type,
      this.obscureText = false,
      this.maxLength,
      this.hintText})
      : super(key: key);

  final TextEditingController controller;
  final Function()? onTap;
  final bool readOnly;
  final Widget? icon;
  final TextInputType? type;
  final bool obscureText;
  final int? maxLength;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: type,
      obscureText: obscureText,
      maxLength: maxLength,
      style: PrimaryStyle.medium(17, spacing: 1),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
        errorStyle: const TextStyle(fontSize: 17),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
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
