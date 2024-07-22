import 'package:flutter/material.dart';

// config version
const kAppVersion = "1.0.0";
const kAppVersionIos = 1;
const kAppVersionAndroid = 1;
// config store
const kAppStoreIdIos = "";
const kAppStoreIdAndroid = "vn.techber.ytehaiduong";
// config enviroment
const kAppMode = 1; // 0: Staging, 1:Production
const kApiUrlStaging = "https://virtserver.swaggerhub.com/k9369/TTKC/1.0.0/";
const kApiKeyStaging = "";
const kApiUrlProduction =
    "https://ttkc.techber.vn/api/services/app/MobileAppServices/";
const kApiKeyProduction = "";
// config color
const kDenimColor = Color(0xff1c398c);
const kPrimaryColor = Color(0xff449be6);
const kBodyText = Color(0xff000000);
const kGrayText = Color(0xff3C3C43); // with opacity 0.6
const kRedColor = Color(0xff449be6);
const kBlueColor = Color(0xff4169E1);
const kGreenColor = Color(0xff2E8B57);
const kOrangeColor = Color(0xffff924d);
const kBorderColor = Color(0xff707070);
const kGreyColor = Color(0xff9E9E9E);
const kWhiteColor = Color(0xffffffff);
const kShadowColor = Color(0xFF9F9F9F);
const kNotRead = Color(0xfff7f7d7);

// [Color(0xffec9f05), Color(0xffff4e00)],
const kGradientFirst = LinearGradient(
    colors: [Color(0xff449be6), Color(0xffa4c2dc)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
const kGradientSecond = LinearGradient(
    colors: [Color(0xff449be6), Color(0xffa4c2dc)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight);
const kGradientLoading = LinearGradient(
    colors: [Color(0xFF9F9F9F), Color(0xff707070)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

// config other
const kDefaultPadding = 20.0;
const kAppBarHeight = 56.0;
const kConnectTimeout = 10000; // 10s
const kReceiveTimeout = 60000; // 60s

// config message
const MSG_APP_UPGRADE = "新しいバージョンのアプリケーションがあります。\n更新をお願いします。";
const MSG_APP_EXCEPTION =
    "Xin lỗi bạn, có vẻ ứng dụng không thể đáp ứng được yêu cầu này. Vui lòng liên hệ với kỹ thuật để được giải quyết.";
const MSG_NO_INTERNET = "Vui lòng bật kết nối mạng để sử dụng ứng dụng!";
const MSG_API_ERROR = "Kết nối mạng kém. Vui lòng thử lại lần nữa";
const MSG_API_TIMEOUT = "Kết nối quá yếu. Vui lòng thử lại lần nữa";
const MSG_API_EXPIRED = "Hết phiên đăng nhập. Vui lòng đăng nhập lại";
