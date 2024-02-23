// bindings/start_binding.dart

import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/start/controllers/start_controller.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(() => StartController());
  }
}
