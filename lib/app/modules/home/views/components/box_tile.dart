import 'package:ytehaiduong/app/common/config.dart';
import 'package:flutter/material.dart';

class BoxTile extends StatelessWidget {
  const BoxTile({
    Key? key,
    required this.color,
    this.press,
  }) : super(key: key);
  final Color color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2,
              vertical: kDefaultPadding * 3 / 4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 4, offset: Offset(0, 2))
              ]),
          width: 150,
          child: Column(children: [
            Text("Được dịch từ tiếng Anh-Trong xuất bản và thiết kế đồ họa",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(height: 1.2, fontWeight: FontWeight.w400)),
            SizedBox(height: 5),
            Text(
                "Lorem ipsum là văn bản giữ chỗ thường được sử dụng để thể hiện hình thức trực quan của tài liệu hoặc kiểu chữ mà không dựa trên nội dung có ý nghĩa. Lorem ipsum có thể được sử dụng làm trình giữ chỗ trước khi có bản sao cuối cùng.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          ]),
        ),
      ),
    );
  }
}
