import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

class BoxMainHeader extends StatelessWidget {
  const BoxMainHeader({
    Key? key,
    required this.title,
    this.icon = Icons.abc,
    required this.gradient,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final LinearGradient gradient;
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
                borderRadius: BorderRadiusDirectional.circular(10),
                gradient: gradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: kWhiteColor,
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
                          color: kWhiteColor,
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
