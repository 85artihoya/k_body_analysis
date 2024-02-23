import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:k_body_analysis/routes/app_routes.dart';

class LoginPageController extends GetxController {
  // TextEditingController 직접 생성
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage('Gunoemon');
  var isEmailFilled = false.obs;
  var isPasswordFilled = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isInputValid = false.obs; // 입력값 유효성 검사 결과를 저장하는 변수

  @override
  void onInit() {
    super.onInit();
    // 리스너 추가
    emailController.addListener(checkInputValidity);
    passwordController.addListener(checkInputValidity);
  }

  @override
  void onClose() {
    // 컨트롤러 해제
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void loginpage() async {
    email.value = emailController.text;
    password.value = passwordController.text;

    if (email.value.isNotEmpty && password.value.isNotEmpty) {
      // 로그인 로직 구현
      finishLogin(); // 로그인 성공 후 홈 화면으로 이동
    } else {
      Get.snackbar('입력 오류', '이메일과 비밀번호를 모두 입력해주세요.');
    }
  }

  void finishLogin() {
    box.write('로그인이 완료되었습니다.', true);
    Get.offAllNamed(Routes.HOME); // 홈 화면으로 이동
  }

  void checkInputValidity() {
    isEmailFilled.value = emailController.text.isNotEmpty;
    isPasswordFilled.value = passwordController.text.isNotEmpty;
    isInputValid.value = isEmailFilled.value && isPasswordFilled.value;
    update(); // GetX 상태 업데이트
  }
}
