import 'package:carousel_slider/carousel_slider.dart';
import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/app/module/result/controllers/result_controller.dart';
import 'package:k_body_analysis/app/module/result/views/widgets/SilhouetteContainer.dart';
import 'package:k_body_analysis/app/module/result/views/widgets/grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ResultView extends GetView<ResultController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        actions: [],
        title: Center(child: Text("포즈업", style: TextStyle(fontSize: 15))),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() => ListView(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text("BODY MEASUREMENT RESULT",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SilhouetteContainer(
                      onPressed: () {
                        controller.selected.value = "FRONT";
                      },
                      title: "FRONT",
                      controller: controller,
                    ),
                    SilhouetteContainer(
                      onPressed: () {
                        controller.selected.value = "SIDE";
                      },
                      title: "SIDE",
                      controller: controller,
                    ),
                    SilhouetteContainer(
                      onPressed: () {
                        controller.selected.value = "BACK";
                      },
                      title: "BACK",
                      controller: controller,
                    ),
                  ],
                ),
                SizedBox(height: 60),
                if (controller.selected.value == "FRONT")
                  if (homeController.bodyPostureList.length > 0 &&
                      homeController.bodyPostureList.last.front_image !=
                          null) ...[
                    controller.frontCarouselIndex.value == 0
                        ? GestureDetector(
                      onHorizontalDragEnd: (dragEndDetails) {
                        if (dragEndDetails.primaryVelocity! < 0) {
                          controller.frontCarouselIndex.value = 1;
                        } else if (dragEndDetails.primaryVelocity! >
                            0) {
                          // Page backwards
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            homeController
                                .bodyPostureList.last.front_image!,
                            height: 400,
                          ),
                          Container(
                              width: double.infinity,
                              height: 400,
                              child: drawGridLines()),
                          Container(
                            height: 400,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("귀",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_ear_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_ear_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("얼굴",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_head_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_head_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("어깨",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_shoulder_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_shoulder_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("골반",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_pelvis_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_pelvis_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("팔꿈치(오)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_elbow_r_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_elbow_r_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("팔꿈치(왼)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_ear_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_elbow_l_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("무릎(오)",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_knee_r_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_knee_r_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("무릎(왼)",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .front_knee_l_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.front_knee_l_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                        : GestureDetector(
                      onHorizontalDragEnd: (dragEndDetails) {
                        if (dragEndDetails.primaryVelocity! < 0) {
                        } else if (dragEndDetails.primaryVelocity! >
                            0) {
                          controller.frontCarouselIndex.value = 0;
                          // Page backwards
                        }
                      },
                      child: Column(
                        children: [
                          Text("FRONT 기준점 및 각도 참고 예시",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Image.asset(
                            LOCAL_IMAGES_URL + 'guideline/front.jpg',
                            height: 350,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.frontCarouselIndex.value = 0;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.frontCarouselIndex.value == 0
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.frontCarouselIndex.value = 1;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.frontCarouselIndex.value == 1
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Image.asset(
                      LOCAL_IMAGES_URL + 'silhouette(FRONT).png',
                      height: 300,
                    ),
                  ],
                if (controller.selected.value == "SIDE")
                  if (homeController.bodyPostureList.length > 0 &&
                      homeController.bodyPostureList.last.side_image !=
                          null) ...[
                    if (controller.sideCarouselIndex.value == 0)
                      GestureDetector(
                        onHorizontalDragEnd: (dragEndDetails) {
                          if (dragEndDetails.primaryVelocity! < 0) {
                            controller.sideCarouselIndex.value = 1;
                          } else if (dragEndDetails.primaryVelocity! > 0) {
                            // Page backwards
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              homeController
                                  .bodyPostureList.last.side_image!,
                              height: 400,
                            ),
                            Container(
                                width: double.infinity,
                                height: 400,
                                child: drawGridLines()),
                            Container(
                              height: 400,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (homeController.bodyPostureList.last
                                      .is_side_right ==
                                      true) ...[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 65,
                                            height: 65,
                                            decoration: BoxDecoration(
                                                color: PRIMARY_COLOR,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    200)),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text("팔꿈치(오)",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors
                                                              .white)),
                                                  SizedBox(height: 2),
                                                  Text(
                                                      homeController
                                                          .bodyPostureList
                                                          .last
                                                          .side_elbow_r_degree !=
                                                          null
                                                          ? "${homeController.bodyPostureList.last.side_elbow_r_degree} 도"
                                                          : "없음",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                          Colors.white))
                                                ],
                                              ),
                                            )),
                                        Container(
                                            width: 65,
                                            height: 65,
                                            decoration: BoxDecoration(
                                                color: PRIMARY_COLOR,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    200)),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text("무릎(오)",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .white)),
                                                  SizedBox(height: 2),
                                                  Text(
                                                      homeController
                                                          .bodyPostureList
                                                          .last
                                                          .side_knee_r_degree !=
                                                          null
                                                          ? "${homeController.bodyPostureList.last.side_knee_r_degree} 도"
                                                          : "없음",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                          Colors.white))
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ] else ...[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 65,
                                            height: 65,
                                            decoration: BoxDecoration(
                                                color: PRIMARY_COLOR,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    200)),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text("팔꿈치(왼)",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors
                                                              .white)),
                                                  SizedBox(height: 2),
                                                  Text(
                                                      homeController
                                                          .bodyPostureList
                                                          .last
                                                          .side_elbow_l_degree !=
                                                          null
                                                          ? "${homeController.bodyPostureList.last.side_elbow_l_degree} 도"
                                                          : "없음",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                          Colors.white))
                                                ],
                                              ),
                                            )),
                                        Container(
                                            width: 65,
                                            height: 65,
                                            decoration: BoxDecoration(
                                                color: PRIMARY_COLOR,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    200)),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text("무릎(왼)",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .white)),
                                                  SizedBox(height: 2),
                                                  Text(
                                                      homeController
                                                          .bodyPostureList
                                                          .last
                                                          .side_knee_l_degree !=
                                                          null
                                                          ? "${homeController.bodyPostureList.last.side_knee_l_degree} 도"
                                                          : "없음",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                          Colors.white))
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ]
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    if (controller.sideCarouselIndex.value == 1)
                      GestureDetector(
                        onHorizontalDragEnd: (dragEndDetails) {
                          if (dragEndDetails.primaryVelocity! < 0) {
                            controller.sideCarouselIndex.value = 2;
                          } else if (dragEndDetails.primaryVelocity! > 0) {
                            controller.sideCarouselIndex.value = 0;
                            // Page backwards
                          }
                        },
                        child: Column(
                          children: [
                            Text("SIDE 기준점 및 각도 참고 예시",
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Image.asset(
                              LOCAL_IMAGES_URL +
                                  'guideline/side(right).jpg',
                              height: 350,
                            ),
                          ],
                        ),
                      ),
                    if (controller.sideCarouselIndex.value == 2)
                      GestureDetector(
                        onHorizontalDragEnd: (dragEndDetails) {
                          if (dragEndDetails.primaryVelocity! < 0) {
                          } else if (dragEndDetails.primaryVelocity! > 0) {
                            controller.sideCarouselIndex.value = 1;
                            // Page backwards
                          }
                        },
                        child: Column(
                          children: [
                            Text("SIDE 기준점 및 각도 참고 예시",
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Image.asset(
                              LOCAL_IMAGES_URL + 'guideline/side(left).jpg',
                              height: 350,
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.sideCarouselIndex.value = 0;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.sideCarouselIndex.value == 0
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.sideCarouselIndex.value = 1;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.sideCarouselIndex.value == 1
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.sideCarouselIndex.value = 2;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.sideCarouselIndex.value == 2
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Image.asset(
                      LOCAL_IMAGES_URL + 'silhouette(SIDE).png',
                      height: 300,
                    )
                  ],
                if (controller.selected.value == "BACK")
                  if (homeController.bodyPostureList.length > 0 &&
                      homeController.bodyPostureList.last.back_image !=
                          null) ...[
                    controller.backCarouselIndex.value == 0
                        ? GestureDetector(
                      onHorizontalDragEnd: (dragEndDetails) {
                        if (dragEndDetails.primaryVelocity! < 0) {
                          controller.backCarouselIndex.value = 1;
                        } else if (dragEndDetails.primaryVelocity! >
                            0) {
                          // Page backwards
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            homeController
                                .bodyPostureList.last.back_image!,
                            height: 400,
                          ),
                          Container(
                              width: double.infinity,
                              height: 400,
                              child: drawGridLines()),
                          Container(
                            height: 400,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("귀",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_ear_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_ear_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("얼굴",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_head_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_head_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("어깨",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_shoulder_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_shoulder_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("골반",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_pelvis_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_pelvis_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("팔꿈치(왼)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_ear_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_elbow_l_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("팔꿈치(오)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_elbow_r_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_elbow_r_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("무릎(왼)",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_knee_l_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_knee_l_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                    Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                            BorderRadius.circular(
                                                200)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("무릎(오)",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors
                                                          .white)),
                                              SizedBox(height: 2),
                                              Text(
                                                  homeController
                                                      .bodyPostureList
                                                      .last
                                                      .back_knee_r_degree !=
                                                      null
                                                      ? "${homeController.bodyPostureList.last.back_knee_r_degree} 도"
                                                      : "없음",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .white))
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                        : GestureDetector(
                      onHorizontalDragEnd: (dragEndDetails) {
                        if (dragEndDetails.primaryVelocity! < 0) {
                        } else if (dragEndDetails.primaryVelocity! >
                            0) {
                          controller.backCarouselIndex.value = 0;
                          // Page backwards
                        }
                      },
                      child: Column(
                        children: [
                          Text("BACK 기준점 및 각도 참고 예시",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Image.asset(
                            LOCAL_IMAGES_URL + 'guideline/back.jpg',
                            height: 350,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.backCarouselIndex.value = 0;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.backCarouselIndex.value == 0
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.backCarouselIndex.value = 1;
                            },
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                controller.backCarouselIndex.value == 1
                                    ? PRIMARY_COLOR
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Image.asset(
                      LOCAL_IMAGES_URL + 'silhouette(BACK).png',
                      height: 300,
                    )
                  ]
              ],
            )),
          ),
        ),
      ),
    );
  }
}
