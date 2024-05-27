import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetSearchMutil extends StatelessWidget {
  const CustomBottomSheetSearchMutil(
      {Key? key,
      required this.onSelectParam,
      required this.listData,
      this.isLoading = false,
      this.hintText = "Nhập để tìm kiếm...",
      this.initSelected = ""})
      : super(key: key);

  final Function(String) onSelectParam;
  final List<String> listData;
  final bool isLoading;
  final String hintText;
  final String initSelected;

  @override
  Widget build(BuildContext context) {
    final selected = [].obs;
    final searchListData = listData.obs;
    if (initSelected.isNotEmpty && initSelected.split(", ").isNotEmpty) {
      selected.value = initSelected.split(", ");
    }

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
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(onPressed: () => Get.back(), child: Text("Hủy")),
                  const SizedBox(width: kDefaultPadding / 2),
                  ElevatedButton(
                      onPressed: () => this.onSelectParam(selected.join(", ")),
                      child: const Text(
                        "Chọn",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(width: kDefaultPadding / 2),
                ]),
                if (isLoading == true) ...[
                  SizedBox(
                      height: Get.height * 0.5,
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
                            return Obx(() => ListTile(
                                minLeadingWidth: 30,
                                leading:
                                    selected.contains(searchListData[index])
                                        ? const Icon(Icons.check)
                                        : const SizedBox.shrink(),
                                onTap: () {
                                  if (selected
                                      .contains(searchListData[index])) {
                                    selected.remove(searchListData[index]);
                                  } else {
                                    selected.add(searchListData[index]);
                                  }
                                },
                                title: Text(searchListData[index])));
                          }))))
                ]
              ],
            ),
          )),
    );
  }
}
