import 'package:carousel_slider/carousel_controller.dart';
import 'package:k_body_analysis/app/data/model/bodyPosture_model.dart';
import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ResultController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString selected = "FRONT".obs;
  CarouselController frontCarouselController = CarouselController();
  CarouselController sideCarouselController = CarouselController();
  CarouselController backCarouselController = CarouselController();
  RxInt frontCarouselIndex = 0.obs;
  RxInt sideCarouselIndex = 0.obs;
  RxInt backCarouselIndex = 0.obs;

  void onInit() async {
    super.onInit();
  }
}
