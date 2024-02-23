import 'package:get/get.dart';

class DevelopmentalDisabilityController extends GetxController {
  var selectedDisability = ''.obs;

  void selectDisability(String disability) {
    selectedDisability.value = disability;
    // 여기에 선택된 장애 유형을 저장하거나 처리하는 로직을 추가합니다.
  }
}
