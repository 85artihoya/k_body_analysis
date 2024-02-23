// views/login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
            SizedBox(height: 16), // Adjust the spacing between text
            Text(
              "K운동발달연구원 - 자세측정분석서비스",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 56), // Adjust the space between text and image
            Expanded(
              child: Image.asset(
                'assets/images/login_page.png',
                fit: BoxFit.contain,
              ),
            ),
            //SizedBox(height: 24), // Adjust the space between image and button
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // 버튼과 하단 화면 사이의 간격 조정
              child: ElevatedButton(
                onPressed: controller.finishLoginButton,
                child: Text('로그인'),
                style: ElevatedButton.styleFrom(
                  primary: BUTTON_GREY,
                  onPrimary: BUTTON_TEXT_BLACK,
                  minimumSize: Size(double.infinity, 56),
                ),
              ),
            ),
            SizedBox(height: 16), // Adjust the space between text and image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // 버튼과 하단 화면 사이의 간격 조정
              child: ElevatedButton(
                onPressed: controller.finishSignUpButton,
                child: Text('가입하기'),
                style: ElevatedButton.styleFrom(
                  primary: BUTTON_YELLOW,
                  onPrimary: BUTTON_TEXT_BLACK,
                  minimumSize: Size(double.infinity, 56),
                ),
              ),
            ),
            SizedBox(height: 56), // Adjust the space between text and image
          ],
        ),
      ),
    );
  }
}

