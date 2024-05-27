import 'package:ytehaiduong/app/common/config.dart';
import 'package:ytehaiduong/app/routes/app_pages.dart';
import 'package:ytehaiduong/app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 200,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                fit: BoxFit.cover,
                image: Image.network("https://picsum.photos/200").image)),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 230,
            ),
            Text("Lorem Ipsum là gì?",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    letterSpacing: 1,
                    height: 1,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: kDefaultPadding),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Text(
                  "Lorem Ipsum chỉ đơn giản là một đoạn văn bản giả, được dùng vào việc trình bày và dàn trang phục vụ cho in ấn. Lorem Ipsum đã được sử dụng như một văn bản chuẩn cho ngành công nghiệp in ấn từ những năm 1500, khi một họa sĩ vô danh ghép nhiều đoạn văn bản với nhau để tạo thành một bản mẫu văn bản. Đoạn văn bản này không những đã tồn tại năm thế kỉ, mà khi được áp dụng vào tin học văn phòng, nội dung của nó vẫn không hề bị thay đổi. Nó đã được phổ biến trong những năm 1960 nhờ việc bán những bản giấy Letraset in những đoạn Lorem Ipsum, và gần đây hơn, được sử dụng trong các ứng dụng dàn trang, như Aldus PageMaker.\nTại sao lại sử dụng nó?\nChúng ta vẫn biết rằng, làm việc với một đoạn văn bản dễ đọc và rõ nghĩa dễ gây rối trí và cản trở việc tập trung vào yếu tố trình bày văn bản. Lorem Ipsum có ưu điểm hơn so với đoạn văn bản chỉ gồm nội dung kiểu 'Nội dung, nội dung, nội dung' là nó khiến văn bản giống thật hơn, bình thường hơn. Nhiều phần mềm thiết kế giao diện web và dàn trang ngày nay đã sử dụng Lorem Ipsum làm đoạn văn bản giả, và nếu bạn thử tìm các đoạn 'Lorem ipsum' trên mạng thì sẽ khám phá ra nhiều trang web hiện vẫn đang trong quá trình xây dựng. Có nhiều phiên bản khác nhau đã xuất hiện, đôi khi do vô tình, nhiều khi do cố ý (xen thêm vào những câu hài hước hay thông tục).",
                  style:
                      TextStyle(fontSize: 15, letterSpacing: 1, height: 1.2)),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: kDefaultPadding,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          width: Get.width,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  primary: kShadowColor,
                ),
              ),
              SizedBox(width: kDefaultPadding / 2),
              Expanded(
                  child: RoundedButton(
                      text: "Đặt lịch khám",
                      press: () => Get.toNamed(Routes.BOOK_DETAIL),
                      linearGradient: kGradientFirst))
            ],
          ),
        ),
      ),
    ]));
  }
}
