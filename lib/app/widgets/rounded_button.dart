import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.linearGradient,
    this.textColor = Colors.white,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final LinearGradient linearGradient;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29), gradient: linearGradient),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 17),
            textStyle: TextStyle(
                color: textColor,
                fontSize: size.width <= 320 ? 14 : 17,
                fontWeight: FontWeight.bold)),
        onPressed: press,
        child: Text(text),
      ),
    );
  }
}
