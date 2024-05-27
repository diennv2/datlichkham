import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/data/bacsy_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorContent extends StatelessWidget {
  DoctorContent({
    Key? key,
    required this.bacSyModel,
    required this.chuyenKhoa,
  }) : super(key: key);

  final BacSyModel bacSyModel;
  final String chuyenKhoa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "${bacSyModel.chucDanh} ${bacSyModel.surName} ${bacSyModel.name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Text("$chuyenKhoa",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text("Tiểu sử", style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              "${bacSyModel.tieuSu}",
              maxLines: null,
              style: TextStyle(
                  fontSize: 17, height: 1.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: kDefaultPadding * 3)
          ]),
    );
  }
}
