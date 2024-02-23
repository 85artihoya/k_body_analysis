import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/login/views/login_view.dart';
import 'package:k_body_analysis/app/module/signup/controllers/signup_controller.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController(); // 생년월일 컨트롤러
  final TextEditingController confirmPasswordController = TextEditingController(); // 비밀번호 확인 컨트롤러
  //final TextEditingController _searchController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode birthDateFocusNode = FocusNode();

  bool isNameCompleted = false;
  bool isEmailCompleted = false;
  bool isPasswordCompleted = false;
  bool isConfirmPasswordCompleted = false;
  // 비밀번호 일치 여부를 확인하는 변수
  bool isPasswordMatch = true;
  // 입력 완료 상태를 확인하는 함수
  bool _isAllInputCompleted() {
    return
      isNameCompleted &&
          _selectedGender.any((isSelected) => isSelected) &&
          isEmailCompleted &&
          birthDateController.text.isNotEmpty &&
          isPasswordCompleted &&
          isConfirmPasswordCompleted;
  }

  // 버튼의 스타일을 결정하는 함수
  ButtonStyle _getButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: _isAllInputCompleted() ? PRIMARY_COLOR : BUTTON_GREY, // 입력 완료시 PRIMARY_COLOR 아니면 BUTTON_GREY
      onPrimary: _isAllInputCompleted() ? Colors.white : Colors.black, // 입력 완료시 BUTTON_TEXT_COLOR 아니면 기본 검정색
      minimumSize: Size(double.infinity, 56), // 버튼의 최소 크기
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // 버튼의 모서리 둥글기
    );
  }

  // 버튼의 활성화 여부를 결정하는 함수
  VoidCallback? _getButtonAction() {
    return _isAllInputCompleted() ? controller.SignUpButton : null;
  }

  void _checkPasswordMatch(String value) {
    setState(() {
      isPasswordMatch = passwordController.text == value;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: PRIMARY_COLOR,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.light(primary: PRIMARY_COLOR).copyWith(
                secondary: PRIMARY_COLOR),
          ),
          child: child!,
        );
      },
    );
    if (selected != null) {
      setState(() {
        birthDateController.text = DateFormat('yyyy-MM-dd').format(selected);
      });
    }
  }

    // 성별 선택 상태를 저장할 리스트
    List<bool> _selectedGender = [true, false];
    List<String> _addresses = [];
    String _selectedDate = '';


    @override
    void initState() {
      super.initState();
      emailFocusNode.addListener(() {
        if (!emailFocusNode.hasFocus) {
          setState(() {
            isEmailCompleted = emailController.text.isNotEmpty;
          });
        }
      });
      passwordFocusNode.addListener(() {
        if (!passwordFocusNode.hasFocus) {
          setState(() {
            isPasswordCompleted = passwordController.text.isNotEmpty;
          });
        }
      });
      nameFocusNode.addListener(() {
        if (!nameFocusNode.hasFocus) {
          setState(() {
            isNameCompleted = nameController.text.isNotEmpty;
          });
        }
      });
      confirmPasswordFocusNode.addListener(() {
        if (!confirmPasswordFocusNode.hasFocus) {
          setState(() {
            isConfirmPasswordCompleted = confirmPasswordController.text.isNotEmpty;
          });
        }
      });
    }

    @override
    void dispose() {
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      birthDateController.dispose(); // 컨트롤러 해제
      confirmPasswordController.dispose();
      nameFocusNode.dispose();
      emailFocusNode.dispose();
      passwordFocusNode.dispose();
      confirmPasswordFocusNode.dispose();
      super.dispose();
    }


    @override
    Widget build(BuildContext context) {
      return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                    '회원가입',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                centerTitle: true,
                automaticallyImplyLeading: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                      //Get.back(); // 현재 네비게이션 스택에서 마지막 라우트를 제거하여 이전 화면으로 돌아간다
                    },
                ),
                backgroundColor: PRIMARY_COLOR,
              ),
              body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 8), // App Bar와 이름 입력란 사이의 간격
                        TextField(
                            controller: nameController,
                            focusNode: nameFocusNode,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: nameFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                                ),
                                // 앞쪽 아이콘
                                prefixIconColor:
                                MaterialStateColor.resolveWith((
                                    Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return PRIMARY_COLOR;
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return Colors.red;
                                  }
                                  return Colors.grey;
                                }),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    nameController.clear();
                                    setState(() {
                                      isNameCompleted = false;
                                    });
                                  },
                                ),
                                suffixIconColor:
                                MaterialStateColor.resolveWith((
                                    Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return PRIMARY_COLOR;
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return Colors.red;
                                  }
                                  return Colors.transparent;
                                }),
                                fillColor: Colors.white,
                                // 채우기 색
                                filled: true,
                                // 채우기 유무 default = false
                                hintText: '이름을 입력하세요',
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: nameFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                                    )),
                                // 활성화 테두리
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: BUTTON_GREY)),
                                // 비 활성화 테두리
                                border: InputBorder.none,
                                labelText: '이름',
                                floatingLabelStyle: TextStyle(
                                  color: nameFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                                ),
                            )
                        ),
                        //Text('성별'),
                        SizedBox(height: 16), // 이름과 성별 사이의 간격
                        ToggleButtons(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 76),
                              child: Text('남성'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 76),
                              child: Text('여성'),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0; buttonIndex <
                                  _selectedGender.length; buttonIndex++) {
                                _selectedGender[buttonIndex] =
                                    buttonIndex == index;
                              }
                            });
                            controller.setGender(index); // 성별 설정 로직
                          },
                          isSelected: _selectedGender,
                          color: BUTTON_TEXT_BLACK,
                          // 비활성화된 버튼의 글자 색상
                          selectedColor: Colors.white,
                          // 활성화된 버튼의 글자 색상
                          fillColor: PRIMARY_COLOR,
                          // 활성화된 버튼의 배경 색상
                          borderColor: Colors.grey,
                          // 테두리 색상
                          selectedBorderColor: PRIMARY_COLOR,
                          // 선택된 버튼의 테두리 색상
                          borderRadius: BorderRadius.circular(8), // 버튼의 모서리 라운딩
                          //borderWidth: 2.0, // 테두리 두께
                        ),

                        SizedBox(height: 16), // 성별과 이메일 사이의 간격
                        TextField(
                            controller: emailController,
                            focusNode: emailFocusNode,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: emailFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                                ),
                                // 앞쪽 아이콘
                                prefixIconColor:
                                MaterialStateColor.resolveWith((
                                    Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return PRIMARY_COLOR;
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return Colors.red;
                                  }
                                  return Colors.grey;
                                }),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    emailController.clear();
                                    setState(() {
                                      isEmailCompleted = false;
                                    });
                                  },
                                ),
                                suffixIconColor:
                                MaterialStateColor.resolveWith((
                                    Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused)) {
                                    return PRIMARY_COLOR;
                                  }
                                  if (states.contains(MaterialState.error)) {
                                    return Colors.red;
                                  }
                                  return Colors.transparent;
                                }),
                                fillColor: Colors.white,
                                // 채우기 색
                                filled: true,
                                // 채우기 유무 default = false
                                hintText: '이메일 주소를 입력하세요',
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: emailFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                                    )),
                                // 활성화 테두리
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: BUTTON_GREY)),
                                // 비 활성화 테두리
                                border: InputBorder.none,
                                labelText: '이메일',
                                floatingLabelStyle: MaterialStateTextStyle
                                    .resolveWith(
                                        (Set<MaterialState> states) {
                                      final Color color = states.contains(
                                          MaterialState.error)
                                          ? Theme
                                          .of(context)
                                          .colorScheme
                                          .error
                                          : PRIMARY_COLOR;
                                      return TextStyle(
                                          color: color, letterSpacing: 1.3);
                                    }
                                )
                            )
                        ),
                        SizedBox(height: 16), // 이메일과 생년월일 사이 간격
                        TextField(
                          controller: birthDateController,
                          focusNode: birthDateFocusNode,
                          decoration: InputDecoration(
                            labelText: '생년월일',
                            labelStyle: TextStyle(
                              color: birthDateFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: birthDateFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                            ),
                            //suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: birthDateFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: birthDateFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: PRIMARY_COLOR,
                              ),
                            ),
                          ),
                          readOnly: true,
                          onTap: () => _selectDate(context),
                        ),
                        SizedBox(height: 16), // 생년월일과 패스워드 사이 간격

                        TextField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_rounded,
                              color: passwordController.text.isNotEmpty || passwordFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey, // 입력 여부에 따라 아이콘 색상 적용
                            ),
                            // 앞쪽 아이콘
                            prefixIconColor:
                            MaterialStateColor.resolveWith((
                                Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return PRIMARY_COLOR;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return Colors.grey;
                            }),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                passwordController.clear();
                                setState(() {
                                  isPasswordCompleted = false;
                                });
                              },
                            ),
                            suffixIconColor:
                            MaterialStateColor.resolveWith((
                                Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return PRIMARY_COLOR;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return Colors.transparent;
                            }),
                            fillColor: Colors.white,
                            // 채우기 색
                            filled: true,
                            // 채우기 유무 default = false
                            hintText: '비밀번호를 입력해주세요',
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: PRIMARY_COLOR)),
                            // 활성화 테두리
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: BUTTON_GREY)),
                            // 비 활성화 테두리
                            border: InputBorder.none,
                            labelText: '비밀번호',
                            floatingLabelStyle: MaterialStateTextStyle
                                .resolveWith(
                                  (Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme.of(context).colorScheme.error : PRIMARY_COLOR;
                                return TextStyle(
                                    color: Colors.grey, letterSpacing: 1.3);
                              },
                            ),
                          ),
                          obscureText: true, // 비밀번호 가림 처리
                        ),
                        SizedBox(height: 16), // 비밀번호와 비밀번호 확인 사이의 간격
                        TextField(
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordFocusNode,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_rounded,
                              color: confirmPasswordController.text.isNotEmpty || confirmPasswordFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey, // 입력 여부에 따라 아이콘 색상 적용
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.close,
                              color: isPasswordMatch ? Colors.transparent : Colors.red),
                              onPressed: () {
                                confirmPasswordController.clear();
                                _checkPasswordMatch('');
                              },
                            ),
                            labelText: '비밀번호 확인',
                            hintText: '비밀번호를 입력해주세요',
                            labelStyle: TextStyle(
                              color: confirmPasswordFocusNode.hasFocus ? PRIMARY_COLOR : Colors.grey, // 포커스 상태에 따라 색상 적용
                            ),
                            border: OutlineInputBorder(),
                            // 비밀번호가 일치하면 기본 색상, 일치하지 않으면 빨간색 경계선
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: isPasswordMatch ? BUTTON_GREY : Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: isPasswordMatch ? PRIMARY_COLOR : Colors.red),
                            ),
                          ),
                          obscureText: true, // 비밀번호 가림 처리
                          onChanged: _checkPasswordMatch, // 비밀번호 확인 입력 필드가 변경될 때 마다 검사
                        ),
                        SizedBox(height: 24), // Adjust the space between text and image
                        ElevatedButton(
                          style: _getButtonStyle(), //  버튼 스타일
                          onPressed: _getButtonAction(),  //  버튼 액션
                          child: Text('가입하기'),
                        ),
                      ])
              )
          )
      );
    }
  }