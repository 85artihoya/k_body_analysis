import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/app/module/intro/controllers/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/intro/controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: FutureBuilder<String>(
          future: controller.initialize(context),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
            } else if (snapshot.hasError) {
            } else {}

            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('포즈업',
                          style: TextStyle(
                              fontFamily: 'spoqa',
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white)),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          child: Text("K운동발달연구원",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'spoqa',
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        SizedBox(height: 50),
                        Align(
                          child: Text("Ver 1.1.0",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'spoqa',
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
