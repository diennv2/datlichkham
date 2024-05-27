import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

class BoxDoctor extends StatelessWidget {
  const BoxDoctor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      height: 180,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(
              10,
              (i) =>
                  DoctorTile(color: i % 2 == 0 ? Colors.red : Colors.green))),
    );
  }
}

class DoctorTile extends StatelessWidget {
  const DoctorTile({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          // margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              boxShadow: [
                BoxShadow(
                    color: kShadowColor, blurRadius: 4, offset: Offset(0, 2))
              ]),
          width: 120,
          child: Column(children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding / 2),
                        topRight: Radius.circular(kDefaultPadding / 2)),
                    child: Image.asset("assets/images/bs.jpg",
                        width: double.infinity, fit: BoxFit.cover))),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gs. Trần Bình Nguyên Anh ADD",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 1.2)),
                      SizedBox(
                        height: 2,
                      ),
                      Text("Tai mũi họng",
                          maxLines: 1, style: TextStyle(fontSize: 9))
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
