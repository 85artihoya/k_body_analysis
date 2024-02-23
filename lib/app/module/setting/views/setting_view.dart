import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/app/module/setting/controllers/setting_controller.dart';
import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        actions: [],
        title: Center(child: Text("포즈업", style: TextStyle(fontSize: 15))),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: MENU_COLOR,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Text("약관 및 정책"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.TERMS);
            },
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("이용약관"), Icon(Icons.arrow_forward)],
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PRIVACY);
            },
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("개인정보처리방침"), Icon(Icons.arrow_forward)],
                  ),
                )),
          ),
          Container(
            width: double.infinity,
            color: MENU_COLOR,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Text("회사소개"),
            ),
          ),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("회사명(상호)",
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    Text('K운동발달연구원(주)')
                  ],
                ),
              )),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("대표",
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    Text('김성경')
                  ],
                ),
              )),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("주소",
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    Text('경북 포항시 북구 법원로 97번길 24-9')
                  ],
                ),
              )),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("홈페이지",
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    Text('K운동발달연구원.com')
                  ],
                ),
              )),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("문의전화",
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    Text('T. 054-246-8897 / M. 010-4530-8897')
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
