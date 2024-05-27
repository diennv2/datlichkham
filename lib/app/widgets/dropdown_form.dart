import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/common/primary_style.dart';
import 'package:flutter/material.dart';

import 'custom_dropdown.dart';

class DropDownForm extends StatelessWidget {
  const DropDownForm({
    Key? key,
    required this.title,
    required this.initValue,
    required this.onChange,
    required this.list,
    this.requireInput = false,
    this.viewError,
  }) : super(key: key);
  final String title, initValue;
  final bool requireInput;
  final Function(dynamic) onChange;
  final List<String> list;
  final Widget? viewError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: PrimaryStyle.bold(14)),
            const SizedBox(width: 5),
            if (requireInput)
              Text("*", style: PrimaryStyle.regular(12, color: kRedColor))
          ],
        ),
        const SizedBox(height: kDefaultPadding / 4),
        CustomDropDown(
            initValue: initValue,
            onChange: onChange,
            listDropDown: list
                .map((String val) =>
                    DropdownMenuItem(value: val, child: Text(val)))
                .toList()),
        if (viewError != null) ...[viewError!],
      ],
    );
  }
}
