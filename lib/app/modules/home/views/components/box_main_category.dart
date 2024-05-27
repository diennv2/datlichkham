import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

class BoxMainCategory extends StatelessWidget {
  const BoxMainCategory(
      {Key? key, required this.icon, required this.title, required this.press})
      : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Column(
          children: [
            Container(
                height: 80,
                width: 60,
                decoration: BoxDecoration(
                    color: kBodyText.withOpacity(0.2), shape: BoxShape.circle),
                child: Icon(icon, color: kWhiteColor, size: 30)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("$title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
