import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/disability_controller.dart';

class DisabilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisabilityController>(() => DisabilityController());
  }
}
