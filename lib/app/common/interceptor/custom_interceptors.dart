import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

import '../../routes/app_pages.dart';
import '../api.dart';
import '../config.dart';
import '../utils.dart';

class CustomInterceptors extends Interceptor {
  static final _log = Logger("CustomInterceptors");

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await Utils.hasConnection() == false) {
      Utils.showErrorMessage(MSG_NO_INTERNET);
      isLoading(false);
      return;
    }

    final box = GetStorage();
    const apiURL = kAppMode == 0 ? kApiUrlStaging : kApiUrlProduction;
    const apiKey = kAppMode == 0 ? kApiKeyStaging : kApiKeyProduction;

    options.baseUrl = apiURL;
    options.headers['x-api-key'] = apiKey;
    options.headers['Authorization'] = "Bearer ${box.read("token")}";
    options.headers['user-agent'] =
        Platform.isAndroid ? 'android-$kAppVersion' : 'ios-$kAppVersion';
    _log.info("REQUEST [${options.method}]: ${options.uri}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log.info(
        "RESPONSE [${response.statusCode}][${response.requestOptions.path}]: ${response.data}");
    if (response.statusCode == 200 &&
        response.data['result']['errorCode'] != 0) {
      Utils.showErrorMessage("${response.data['result']['message']}");
      if (response.data['result']['errorCode'] == 401) {
        Get.offNamed(Routes.LOGIN);
      }
    } else if (response.statusCode == 403) {
      Utils.showWarningMessage(MSG_API_EXPIRED);
      Get.offNamed(Routes.LOGIN);
    } else if (response.statusCode == 504) {
      Utils.showErrorMessage(MSG_API_TIMEOUT);
    } else if (response.statusCode != 200) {
      Utils.showErrorMessage(MSG_API_ERROR);
    }

    return handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    _log.severe(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    _log.severe(err.message);

    isLoading(false);
    if (err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.connectTimeout) {
      Utils.showWarningMessage(MSG_API_TIMEOUT);
      return;
    }
    return handler.next(err);
  }
}
