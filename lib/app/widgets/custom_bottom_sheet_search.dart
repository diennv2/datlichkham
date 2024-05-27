import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetSearch extends StatelessWidget {
  const CustomBottomSheetSearch(
      {Key? key,
      required this.onSelectParam,
      required this.listData,
      this.isLoading = false,
      this.hintText = "Nhập để tìm kiếm..."})
      : super(key: key);

  final Function(String) onSelectParam;
  final List<String> listData;
  final bool isLoading;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final searchListData = listData.obs;

    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  topRight: Radius.circular(kDefaultPadding)),
              color: kWhiteColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search), hintText: hintText),
                  onChanged: (val) {
                    if (listData.isNotEmpty) {
                      searchListData.value = listData
                          .where((e) =>
                              e.toLowerCase().contains(val.toLowerCase()))
                          .toList();
                    }
                  },
                ),
                if (isLoading == true) ...[
                  SizedBox(
                      height: Get.height * 0.6,
                      child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ))
                ],
                if (isLoading == false) ...[
                  Expanded(
                      child: Obx(() => ListView.builder(
                          itemCount: searchListData.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                                onTap: () {
                                  onSelectParam(searchListData[index]);
                                },
                                title: Text(searchListData[index]));
                          }))))
                ]
              ],
            ),
          )),
    );
  }
}
