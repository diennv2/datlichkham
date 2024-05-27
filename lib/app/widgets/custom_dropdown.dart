import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.initValue = "",
    required this.onChange,
    required this.listDropDown,
  }) : super(key: key);

  final String initValue;
  final ValueChanged onChange;
  final List<DropdownMenuItem<String>> listDropDown;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        dropdownColor: kWhiteColor,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        items: listDropDown,
        onChanged: onChange,
        value: initValue,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          fillColor: kWhiteColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor, width: 1),
          ),
        ));
  }
}
