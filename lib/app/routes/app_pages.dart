import 'package:get/get.dart';

import '../common/auth_binding.dart';
import '../modules/book_detail/bindings/book_detail_binding.dart';
import '../modules/book_detail/views/book_detail_view.dart';
import '../modules/book_history/bindings/book_history_binding.dart';
import '../modules/book_history/views/book_history_view.dart';
import '../modules/change_pass/bindings/change_pass_binding.dart';
import '../modules/change_pass/views/change_pass_view.dart';
import '../modules/create_medical_form/bindings/create_medical_form_binding.dart';
import '../modules/create_medical_form/views/create_medical_form_view.dart';
import '../modules/doctor/bindings/doctor_binding.dart';
import '../modules/doctor/views/doctor_view.dart';
import '../modules/doctor_specialist/bindings/doctor_specialist_binding.dart';
import '../modules/doctor_specialist/views/doctor_specialist_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/info/bindings/info_binding.dart';
import '../modules/info/views/info_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/news_detail/bindings/news_detail_binding.dart';
import '../modules/news_detail/views/news_detail_view.dart';
import '../modules/nguoithan/bindings/nguoithan_binding.dart';
import '../modules/nguoithan/views/nguoithan_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash_view.dart';
import '../modules/success/bindings/success_binding.dart';
import '../modules/success/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAIL,
      page: () => BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_MEDICAL_FORM,
      page: () => CreateMedicalFormView(),
      binding: CreateMedicalFormBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR,
      page: () => DoctorView(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_HISTORY,
      page: () => BookHistoryView(),
      binding: BookHistoryBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => NewsDetailView(),
      binding: NewsDetailBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_SPECIALIST,
      page: () => DoctorSpecialistView(),
      binding: DoctorSpecialistBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASS,
      page: () => ChangePassView(),
      binding: ChangePassBinding(),
    ),
    GetPage(
      name: _Paths.INFO,
      page: () => InfoView(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: _Paths.NGUOITHAN,
      page: () => NguoithanView(),
      binding: NguoithanBinding(),
    ),
  ];
}
