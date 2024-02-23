import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/home/views/home_view.dart';

class OtherDisabilityController extends GetxController {
  RxString diagnosis = ''.obs;

  void saveDiagnosis(String value) {
    diagnosis.value = value;
    // 서버로 진단명을 전송하거나 저장하는 로직을 구현합니다.

    // 저장이 완료된 후 HomeView로 이동
    Get.offAll(() => HomeView());
  }
}
