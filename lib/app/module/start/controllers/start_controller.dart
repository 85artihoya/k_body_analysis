import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StartController extends GetxController {
  final box = GetStorage('Gunoemon');

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onDespose() {
    super.dispose();
  }

  void finishStart() {
    box.write('isStartingDone', true);
    Get.offAllNamed(Routes.LOGIN);
  }
}
