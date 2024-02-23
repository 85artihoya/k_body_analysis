import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SettingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final box = GetStorage('Gunoemon');

  void onInit() async {
    super.onInit();
  }
}
