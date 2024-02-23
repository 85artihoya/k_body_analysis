import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/other_disability_controller.dart';

class OtherDisabilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherDisabilityController>(() => OtherDisabilityController());
  }
}
