import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  const IconImage(
      {Key? key, required this.iconName,
        this.padding = EdgeInsets.zero,
        this.width = 24,
        this.height = 24,
      })
      : super(key: key);

  final String iconName;
  final EdgeInsetsGeometry padding;
  final double width,height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset('assets/icons/$iconName', width: width, height: height),
    );
  }
}
