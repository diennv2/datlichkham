import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/data/bacsy_model.dart';
import 'package:ytehaiduong/app/data/chuyenkhoa_model.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils.dart';

class BoxDoctor2 extends StatelessWidget {
  const BoxDoctor2({
    Key? key,
    required this.data,
    required this.data2,
    required this.tenant,
  }) : super(key: key);

  final List<BacSyModel> data;
  final List<ChuyenKhoaModel> data2;
  final String tenant;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
        height: 352,
        child: data.isNotEmpty
            ? GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0),
                itemBuilder: (context, index) {
                  final tenChuyenKhoa = data2.isEmpty
                      ? ''
                      : data2
                          .firstWhere((e) => e.id == data[index].chuyenKhoaId)
                          .ten!;
                  return DoctorTile(
                    avartar: data[index].image,
                    name:
                        "${data[index].chucDanh} ${data[index].surName} ${data[index].name}",
                    chuyenKhoa: tenChuyenKhoa,
                    press: () => Get.toNamed(Routes.DOCTOR,
                        arguments: data[index],
                        parameters: {
                          'chuyenKhoaId': "${data[index].chuyenKhoaId}",
                          'chuyenKhoa': tenChuyenKhoa,
                          'tenant': tenant,
                        }),
                  );
                })
            : const Center(child: Text("Đang tải dữ liệu...")));
  }
}

class DoctorTile extends StatelessWidget {
  const DoctorTile({
    Key? key,
    required this.press,
    this.avartar,
    required this.name,
    required this.chuyenKhoa,
  }) : super(key: key);

  final String? avartar;
  final String name;
  final String chuyenKhoa;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              boxShadow: const [
                BoxShadow(
                    color: kShadowColor, blurRadius: 4, offset: Offset(3, 3))
              ]),
          width: 120,
          height: 160,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(kDefaultPadding / 2),
                            topRight: Radius.circular(kDefaultPadding / 2)),
                        child: Utils.imageFromBase64String(avartar!))),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.1)),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(chuyenKhoa,
                              maxLines: 1, style: const TextStyle(fontSize: 10))
                        ],
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
