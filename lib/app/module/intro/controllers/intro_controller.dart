import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroController extends GetxController {
  final box = GetStorage('Gunoemon');

  void onInit() async {
    super.onInit();
  }

  Future<String> initialize(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.START);
    return "DONE";
  }
}
