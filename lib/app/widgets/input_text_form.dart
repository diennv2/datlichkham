import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/widgets/primary_input.dart';
import 'package:flutter/material.dart';

import '../common/primary_style.dart';

class InputTextForm extends StatelessWidget {
  const InputTextForm(
      {Key? key,
      required this.textTitle,
      required this.controllerText,
      this.viewError,
      this.type,
      this.icon,
      this.obscureText = false,
      this.requireInput = false,
      this.onTap,
      this.readOnly = false,
      this.hintText})
      : super(key: key);

  final String textTitle;
  final bool requireInput, readOnly;
  final TextEditingController controllerText;
  final TextInputType? type;
  final Widget? icon;
  final bool obscureText;
  final Widget? viewError;
  final Function()? onTap;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(textTitle, style: PrimaryStyle.bold(14)),
            const SizedBox(width: 5),
            if (requireInput)
              Text("*", style: PrimaryStyle.regular(12, color: kRedColor))
          ],
        ),
        const SizedBox(height: kDefaultPadding / 4),
        PrimaryInput(
            readOnly: readOnly,
            controller: controllerText,
            type: type,
            icon: icon,
            obscureText: obscureText,
            hintText: hintText,
            onTap: onTap),
        const SizedBox(height: 2),
        if (viewError != null) ...[viewError!],
      ],
    );
  }
}
