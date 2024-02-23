import 'package:get/get.dart';

class DisabilityTypeController extends GetxController {
  var disabilityType = ''.obs;

  void selectDisabilityType(String type) {
    disabilityType.value = type;
    // 여기서 추가적인 로직을 구현할 수 있습니다.
    // 예를 들어 사용자의 선택을 서버로 전송하거나,
    // 다음 화면으로 네비게이션하는 로직 등입니다.
  }
}
