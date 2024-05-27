import 'package:ytehaiduong/app/widgets/primary_textarea.dart';
import 'package:flutter/material.dart';

import '../common/config.dart';
import '../common/primary_style.dart';

class InputTextAreaForm extends StatelessWidget {
  const InputTextAreaForm({
    Key? key,
    required this.textTitle,
    required this.controllerText,
    this.viewError,
    this.icon,
    this.requireInput = false,
    this.minLines = 5,
  }) : super(key: key);

  final String textTitle;
  final bool requireInput;
  final TextEditingController controllerText;
  final int minLines;
  final Widget? icon;
  final Widget? viewError;

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
        PrimaryTextArea(
          controller: controllerText,
          icon: icon,
          minLines: minLines,
        ),
        const SizedBox(height: 2),
        if (viewError != null) ...[viewError!],
      ],
    );
  }
}
