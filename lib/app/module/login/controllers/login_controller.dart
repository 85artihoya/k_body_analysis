import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:k_body_analysis/routes/app_routes.dart';

class LoginController extends GetxController {
  final box = GetStorage('Gunoemon');

  void finishLoginButton() {
    box.write('Login Button Click completed', true);
    Get.offAllNamed(Routes.LOGINPAGE);
  }

  void finishSignUpButton() {
    box.write('SignUp Button Click completed', true);
    Get.offAllNamed(Routes.SIGNUP);
  }
}
