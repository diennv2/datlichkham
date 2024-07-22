import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

class BoxMainHeader extends StatelessWidget {
  const BoxMainHeader({
    Key? key,
    required this.title,
    this.icon = Icons.abc,
    // required this.gradient,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  // final LinearGradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.deepOrange.withOpacity(0.5),
                  width: 1.0,
                  style: BorderStyle.solid
                ),
                // gradient: gradient
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Text("$title",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
