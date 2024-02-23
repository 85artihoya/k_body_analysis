import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/gmfcs_level_controller.dart';

class GMFCSLevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GMFCSLevelController>(() => GMFCSLevelController());
  }
}
