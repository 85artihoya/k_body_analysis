import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/loginpage/controllers/login_page_controller.dart';
import 'package:k_body_analysis/app/config/constant.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    // LoginPageController의 인스턴스를 가져옵니다.
    final controller = Get.find<LoginPageController>();
    return Scaffold(
      backgroundColor: PRIMARY_COLOR, // PRIMARY_COLOR는 상수로 정의된 색상입니다.
      body: SafeArea(
        child: SingleChildScrollView( // 스크롤 가능하도록 SingleChildScrollView 추가.
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
              SizedBox(height: 40),
              _buildTextField(
                hint: '이메일을 입력하세요',
                textEditingController: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIconData: Icons.email,
              ),
              SizedBox(height: 8),
              _buildTextField(
                hint: '비밀번호를 입력하세요',
                textEditingController: controller.passwordController,
                obscureText: true,
                prefixIconData: Icons.lock,
              ),
              SizedBox(height: 24),
              Obx(() =>
                  ElevatedButton(
                    onPressed: controller.isInputValid.value ? controller.loginpage : null,
                    child: Text('로그인'),
                    style: ElevatedButton.styleFrom(
                      primary: controller.isInputValid.value ? BUTTON_YELLOW : BUTTON_GREY, // BUTTON_YELLOW, BUTTON_GREY는 상수로 정의된 색상입니다.
                      onPrimary: BUTTON_TEXT_BLACK, // BUTTON_TEXT_BLACK은 상수로 정의된 색상입니다.
                      minimumSize: Size(double.infinity, 56),
                    ),
                  )),
              SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController textEditingController,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIconData,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: CONTAINER_BACKGROUND, // CONTAINER_BACKGROUND는 상수로 정의된 색상입니다.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(prefixIconData, color: PRIMARY_COLOR), // PRIMARY_COLOR는 상수로 정의된 색상입니다.
          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        style: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Spoqa',
        ),
        onChanged: (value) => controller.checkInputValidity(), // 입력이 변경될 때마다 유효성 검사 실행
      ),
    );
  }
}
