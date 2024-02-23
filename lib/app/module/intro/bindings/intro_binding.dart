//import 'package:k_body_analysis/app/data/repository/bodyPosture_repository.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/app/module/intro/controllers/intro_controller.dart';
import 'package:get/get.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());

    Get.put(HomeController(), permanent: true);
  }
}
