import 'package:get/get.dart';

class GMFCSLevelController extends GetxController {
  RxInt gmfcsLevel = 0.obs;

  void selectGMFCSLevel(int level) {
    gmfcsLevel.value = level;
    // 선택한 레벨에 대한 추가 로직을 여기에 구현합니다.
  }
}
