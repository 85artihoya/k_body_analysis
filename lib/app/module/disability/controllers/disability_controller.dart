import 'package:get/get.dart';

class DisabilityController extends GetxController {
  var hasDisability = false.obs; // 장애 여부 상태 관리

  void setDisability(bool value) {
    hasDisability.value = value;
    // 여기서 추가적인 로직을 구현할 수 있습니다.
    // 예를 들어 서버로 사용자의 선택을 전송하거나,
    // 선택에 따라 다음 화면으로 네비게이션하는 로직 등입니다.
  }
}
