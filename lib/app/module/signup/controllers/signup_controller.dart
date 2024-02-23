import 'package:get/get.dart';
import 'package:k_body_analysis/routes/app_routes.dart';

class SignUpController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var gender = '남성'.obs;

  get box => null; // 기본값을 '남자'로 설정합니다
//  RxList<bool> selectedGenders = [true, false].obs;

  void SignUpButton() {
    box.write('SignUp Button Click completed', true);
    Get.offAllNamed(Routes.DISABILITY);
  }


  void setGender(int index) {
    gender.value = index == 0 ? '남성' : '여성';
  }

  void validateForm(String _) {
    // 폼의 유효성을 검사하고, 유효한 경우 회원가입 버튼을 활성화하는 등의 UI 업데이트를 합니다.
    if (name
        .trim()
        .isNotEmpty &&
        email
            .trim()
            .isNotEmpty &&
        password
            .trim()
            .isNotEmpty &&
        confirmPassword
            .trim()
            .isNotEmpty &&
        password.value == confirmPassword.value) {
      // 폼이 유효할 때의 처리 로직
      // 예: 회원가입 버튼 활성화
    } else {
      // 폼이 유효하지 않을 때의 처리 로직
      // 예: 회원가입 버튼 비활성화
    }
  }

// Membership registration function
  void signUp(String name, String gender, String email, String password) {
    // input validation logic
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please enter all fields.');
      return;
    }
    if (password != confirmPassword.value) {
      Get.snackbar('Error', 'Password does not match.');
      return;
    }
    // Add code to send a membership registration request to the server
    // Example: After successful membership registration, navigate to home
    // Get.offAllNamed('/home');
  }

  @override
  void onInit() {
    super.onInit();
    // RxString 변수들에 대한 리스너 설정
    ever(name, validateForm);
    ever(email, validateForm);
    ever(password, validateForm);
    ever(confirmPassword, validateForm);
  }
}