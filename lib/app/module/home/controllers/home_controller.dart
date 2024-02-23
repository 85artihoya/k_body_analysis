import 'dart:async';

import 'package:k_body_analysis/app/data/model/bodyPosture_model.dart';
import 'package:k_body_analysis/app/data/repository/bodyPosture_repository.dart';
import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final box = GetStorage('notificationList');
  RxList<BodyPosture> bodyPostureList = <BodyPosture>[].obs;

  late PersistentTabController persistentTabcontroller;
  late Timer? timer;

  void onInit() async {
    persistentTabcontroller = PersistentTabController(initialIndex: 0);

    super.onInit();
  }
}
