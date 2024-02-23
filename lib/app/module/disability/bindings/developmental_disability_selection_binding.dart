import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/developmental_disability_controller.dart';

class DevelopmentalDisabilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DevelopmentalDisabilityController>(() => DevelopmentalDisabilityController());
  }
}
