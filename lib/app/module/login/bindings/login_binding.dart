// bindings/login_binding.dart
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}