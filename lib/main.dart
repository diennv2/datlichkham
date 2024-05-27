import 'dart:async';

import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';
import 'app/common/api.dart';
import 'app/common/config.dart';
import 'app/common/interceptor/custom_interceptors.dart';
import 'app/common/utils.dart';
import 'app/routes/app_pages.dart';

final _log = Logger('main.dart');

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) =>
        print('[${record.level.name}][${record.time}] ${record.message}'));

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    api.options
      ..connectTimeout = kConnectTimeout
      ..receiveTimeout = kReceiveTimeout
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };
    api.interceptors.addAll([
      CustomInterceptors(),
      RetryInterceptor(
        dio: api,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 5), // wait 1 sec before first retry
          Duration(seconds: 10), // wait 2 sec before second retry
          Duration(seconds: 15), // wait 3 sec before third retry
        ],
      ),
    ]);
    await GetStorage.init();

    runApp(const MyApp());
  }, (error, stackTrace) {
    _log.severe("* App Error: $error");
    _log.severe("* StackTrace: $stackTrace");
    Utils.showErrorMessage("$error");
    // Utils.showErrorMessage(MSG_APP_EXCEPTION);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.handleFocus(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('vi', 'VN')],
        theme: ThemeData(
            brightness: Brightness.light,
            iconTheme: const IconThemeData(size: 30, color: kPrimaryColor),
            textTheme:
                GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: kPrimaryColor, secondary: kBlueColor),
            scaffoldBackgroundColor: Colors.white),
        title: "Y tế Hải Dương",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
