import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/signup/controllers/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}