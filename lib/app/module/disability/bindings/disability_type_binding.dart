import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/disability_type_controller.dart';

class DisabilityTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisabilityTypeController>(() => DisabilityTypeController());
  }
}
