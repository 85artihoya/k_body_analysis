import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/loginpage/controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}