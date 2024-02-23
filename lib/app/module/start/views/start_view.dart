import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/start/controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 56),
            Text(
              '포즈업',
              style: TextStyle(
                fontFamily: 'spoqa',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),  // 텍스트와 텍스트 사이의 간격 조정
            Text("K운동발달연구원-자세측정분석서비스",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            SizedBox(height: 56),  // 텍스트와 이미지 사이의 간격 조정
            Expanded(
              child: Image.asset(
                'assets/images/login_page.png',
                fit: BoxFit.contain,
              ),
            ),
            //SizedBox(height: 24), // 이미지와 버튼 사이의 간격 조정
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 56.0), // 버튼과 하단 화면 사이의 간격 조정
              child: ElevatedButton(
                onPressed: controller.finishStart,
                child: Text('시작하기'),
                style: ElevatedButton.styleFrom(
                  primary: BUTTON_YELLOW,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 56),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
