import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/config/util.dart';
import 'package:k_body_analysis/app/module/dashboard/controllers/dashboard_controller.dart';
import 'package:k_body_analysis/app/module/dashboard/views/widgets/SilhouetteContainer.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/app/module/result/controllers/result_controller.dart';
import 'package:k_body_analysis/library/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class DashBoardView extends GetView<DashBoardController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dashBoardController = Get.find<DashBoardController>();
    final resultController = Get.find<ResultController>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          actions: [],
          title: Center(child: Text("포즈업", style: TextStyle(fontSize: 15))),
        ),
        body: Obx(
              () => SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BODY MEASUREMENT",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      if (controller.selected.value == "") ...[
                        Image.asset(LOCAL_IMAGES_URL + 'silhouette(FRONT).png',
                            height: 200)
                      ] else ...[
                        Image.asset(
                            LOCAL_IMAGES_URL +
                                'silhouette(${controller.selected.value}).png',
                            height: 200)
                      ],
                      SizedBox(height: 20),
                      Row(
                        children: [
                          if (controller.frontImagePath.value == "") ...[
                            SilhouetteContainer(
                              onPressed: () {
                                if (controller.selected.value == "FRONT") {
                                  controller.selected.value = "";
                                } else {
                                  controller.selected.value = "FRONT";
                                }
                              },
                              title: "FRONT",
                              controller: resultController,
                            ),
                          ] else ...[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          LOCAL_IMAGES_URL +
                                              "silhouetteWhite_" +
                                              "FRONT" +
                                              ".png",
                                          height: 80,
                                        ),
                                        SizedBox(height: 15),
                                        Text("FRONT",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                          if (controller.sideImagePath.value == "") ...[
                            SilhouetteContainer(
                              onPressed: () {
                                if (controller.selected.value == "SIDE") {
                                  controller.selected.value = "";
                                } else {
                                  controller.selected.value = "SIDE";
                                }
                              },
                              title: "SIDE",
                              controller: resultController,
                            )
                          ] else ...[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          LOCAL_IMAGES_URL +
                                              "silhouetteWhite_" +
                                              "SIDE" +
                                              ".png",
                                          height: 80,
                                        ),
                                        SizedBox(height: 15),
                                        Text("SIDE",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                          if (controller.backImagePath.value == "") ...[
                            SilhouetteContainer(
                              onPressed: () {
                                if (controller.selected.value == "BACK") {
                                  controller.selected.value = "";
                                } else {
                                  controller.selected.value = "BACK";
                                }
                              },
                              title: "BACK",
                              controller: resultController,
                            ),
                          ] else ...[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          LOCAL_IMAGES_URL +
                                              "silhouetteWhite_" +
                                              "BACK" +
                                              ".png",
                                          height: 80,
                                        ),
                                        SizedBox(height: 15),
                                        Text("BACK",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (controller.selected.value == "") {
                                showMessage("신체 측면을 선택해주세요");
                              } else {
                                controller.askPermissionCamera();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                      border: Border.all(width: 0.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                        child: Text("촬영하기",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (controller.selected.value == "") {
                                showMessage("신체 측면을 선택해주세요");
                              } else {
                                controller.askPermissionGallery();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                      border: Border.all(width: 0.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                        child: Text("사진선택",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  )),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(height: 30),
                      if (controller.frontImagePath.value == "" &&
                          controller.sideImagePath.value == "" &&
                          controller.backImagePath.value == "") ...[
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                showMessage("이미지를 촬영하거나 선택해 주세요");
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: const Text(
                                  '시작하기',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              )),
                        ),
                      ] else ...[
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.bodyPosture();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: PRIMARY_COLOR,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: controller.isLoading.value
                                      ? SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                      : Text(
                                    '시작하기',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ))),
                        ),
                      ]
                    ],
                  ),
                ),
              )),
        ));
  }
}
