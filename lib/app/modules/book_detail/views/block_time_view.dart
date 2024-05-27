import 'package:ytehaiduong/app/data/block_time_model.dart';
import 'package:ytehaiduong/app/modules/book_detail/controllers/book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/config.dart';

class BlockTimeView extends StatelessWidget {
  const BlockTimeView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<GioKhamTheoKhung> data;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookDetailController>();

    return SizedBox(
      height: 255,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: kDefaultPadding / 4),
        crossAxisCount: 3,
        childAspectRatio: (12 / 3),
        shrinkWrap: true,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: List.generate(data.length, (index) {
          return GestureDetector(
            onTap: () => data[index].isCoTheDat == true
                ? controller.handleSelectedBlockTime(data[index])
                : null,
            child: Container(
              decoration: BoxDecoration(
                  border: data[index].isCoTheDat == true
                      ? Border.all(width: 0.5, color: kPrimaryColor)
                      : null,
                  color: controller.selectedBlockTime.value ==
                          data[index].khungKham
                      ? kPrimaryColor
                      : data[index].isCoTheDat == false
                          ? kBorderColor
                          : Colors.white),
              child: Center(
                child: Text(
                  "${data[index].gioKham}",
                  style: TextStyle(
                      color: controller.selectedBlockTime.value ==
                                  data[index].khungKham ||
                              data[index].isCoTheDat == false
                          ? Colors.white
                          : kPrimaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
