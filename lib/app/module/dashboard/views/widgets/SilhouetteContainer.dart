import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/dashboard/controllers/dashboard_controller.dart';
import 'package:k_body_analysis/app/module/result/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SilhouetteContainer extends StatelessWidget {
  SilhouetteContainer(
      {required this.title, required this.onPressed, required this.controller});

  final String title;
  final VoidCallback onPressed;
  final ResultController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: controller.selected.value == title
                  ? PRIMARY_COLOR
                  : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    controller.selected.value == title
                        ? LOCAL_IMAGES_URL +
                        "silhouetteWhite_" +
                        title +
                        ".png"
                        : LOCAL_IMAGES_URL +
                        "silhouetteRed_" +
                        title +
                        ".png",
                    height: 80,
                  ),
                  SizedBox(height: 15),
                  Text("${title}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.selected.value == title
                              ? Colors.white
                              : Colors.black))
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
