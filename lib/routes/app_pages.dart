//import 'package:k_body_analysis/app/module/camera/bindings/camera_binding.dart';
import 'package:k_body_analysis/app/module/disability/bindings/developmental_disability_selection_binding.dart';
import 'package:k_body_analysis/app/module/disability/bindings/disability_binding.dart';
import 'package:k_body_analysis/app/module/disability/bindings/disability_type_binding.dart';
import 'package:k_body_analysis/app/module/disability/bindings/gmfcs_level_binding.dart';
import 'package:k_body_analysis/app/module/disability/bindings/other_disability_binding.dart';
import 'package:k_body_analysis/app/module/disability/views/developmental_disability_selection_view.dart';
import 'package:k_body_analysis/app/module/disability/views/disability_type_selection_view.dart';
import 'package:k_body_analysis/app/module/disability/views/disability_view.dart';
import 'package:k_body_analysis/app/module/disability/views/gmfcs_level_selection_view.dart';
import 'package:k_body_analysis/app/module/disability/views/other_disability_view.dart';
import 'package:k_body_analysis/app/module/loginpage/bindings/login_page_binding.dart';
import 'package:k_body_analysis/app/module/loginpage/views/login_page_view.dart';
import 'package:k_body_analysis/app/module/signup/bindings/signup_binding.dart';
import 'package:k_body_analysis/app/module/signup/views/signup_view.dart';
import 'package:k_body_analysis/app/module/start/views/start_view.dart';
//import 'package:k_body_analysis/app/module/dashboard/views/camera_view.dart';
import 'package:k_body_analysis/app/module/home/views/home_view.dart';
import 'package:k_body_analysis/app/module/intro/views/intro_view.dart';
import 'package:k_body_analysis/app/module/login/bindings/login_binding.dart';
import 'package:k_body_analysis/app/module/login/views/login_view.dart';
import 'package:k_body_analysis/app/module/login/bindings/login_binding.dart';
import 'package:k_body_analysis/app/module/login/views/login_view.dart';
//import 'package:k_body_analysis/app/module/result/views/result_view.dart';
//import 'package:k_body_analysis/app/module/setting/views/privacy_view.dart';
//import 'package:k_body_analysis/app/module/setting/views/terms_view.dart';
import 'package:k_body_analysis/app/module/start/bindings/start_binding.dart';
import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:get/get.dart';

//import '../app/module/home/bindings/home_binding.dart';
import '../app/module/intro/bindings/intro_binding.dart';

class AppPages {
  static const INTRO = Routes.INTRO;

  static final routes = [
    GetPage(
      name: Routes.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
//      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.START,
        page: () => StartView(),
        binding: StartBinding(),
    ),
    GetPage(
      name: Routes.DISABILITYTYPESELECTION,
      page: () => DisabilityTypeSelectionView(),
      binding: DisabilityTypeBinding(),
    ),
    GetPage(
      name: Routes.DISABILITY,
      page: () => DisabilityView(),
      binding: DisabilityBinding(),
    ),
    GetPage(
      name: Routes.OTHERDISABILITY,
      page: () => OtherDisabilityView(),
      binding: OtherDisabilityBinding(),
    ),
    GetPage(
      name: Routes.GMFCSLEVEL,
      page: () => GMFCSLevelSelectionView(),
      binding: GMFCSLevelBinding(),
    ),
    GetPage(
      name: Routes.DEVELOPMENTALDISABILITY,
      page: () => DevelopmentalDisabilitySelectionView(),
      binding: DevelopmentalDisabilityBinding(),
    ),
    GetPage(
      name: Routes.LOGINPAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
/*
    GetPage(
      name: Routes.CAMERA,
      page: () => CameraView(),
    ),
    GetPage(
      name: Routes.RESULT,
      page: () => ResultView(),
    ),
    GetPage(
        name: Routes.PRIVACY,
        page: () => PrivacyView()
    ),
    GetPage(
        name: Routes.TERMS,
        page: () => TermsView()
    ),

 */
  ];
}
