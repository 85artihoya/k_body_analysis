// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:flutter/material.dart';

class AppUrl {
  // static const String baseURL = "http://10.0.2.2:8000/";
  static const String baseURL =
      "http://ec2-52-78-133-182.ap-northeast-2.compute.amazonaws.com/";
  static const String bodyPosturePredict = baseURL + "api/bodyPosture/predict/";
}

// ignore: constant_identifier_names
const String APP_NAME = 'KBODY';
// color for apps
// ignore: constant_identifier_names
const Color PRIMARY_COLOR = Color(0xFF4755ff);
const Color MENU_COLOR = Color(0xFFe6e9ee);

// const Color BACKGROUND = const Color(0xFF171f24);
const Color BACKGROUND = Color(0xfff6f6f6);
Color CONTAINER_BACKGROUND = Color(0xfffcfcfc);
// Color BACKGROUND = Color(0xFF4BB2F9).withOpacity(0.10);

const Color BLACK21 = Color(0xFF212121);
const Color BLACK33 = Color(0xFF333333);
const Color BUTTON_TEXT_BLACK = Color(0xFF1D1D1D);
const Color BUTTON_GREY = Color(0xFFD8D8D8);
const Color BUTTON_YELLOW = Color(0xFFFFC147);
const Color INPUT_EX_TEXT = Color(0xffbfbfbf);

const Color BLACK55 = Color(0xFF555555);
const Color BLACK77 = Color(0xFF777777);
const Color BLACK99 = Color(0xFF999999);

const Color CHARCOAL = Color(0xFF515151);
const Color BLACK_GREY = Color(0xff777777);
const Color SOFT_GREY = Color(0xFFaaaaaa);
const Color SOFT_BLUE = Color(0xff01aed6);
const Color SOFT_RED = Color(0xffff6961);

const int STATUS_OK = 200;
const int STATUS_BAD_REQUEST = 400;
const int STATUS_NOT_AUTHORIZED = 403;
const int STATUS_NOT_FOUND = 404;
const int STATUS_INTERNAL_ERROR = 500;

const String ERROR_OCCURED = 'Error occured, please try again later';

const String LOCAL_IMAGES_URL = 'assets/images/';
String DOWNLOAD_ASSET_URL = '';

const Map<int, String> numberToDay = {
  1: "월",
  2: "화",
  3: "수",
  4: "목",
  5: "금",
  6: "토",
  7: "일",
};

const Map<String, int> dayToNumber = {
  "월": 1,
  "화": 2,
  "수": 3,
  "목": 4,
  "금": 5,
  "토": 6,
  "일": 7,
};

List<Color> pointColors = [
  Colors.red,
  Colors.red,
  Colors.red,
  Colors.orange,
  Colors.orange,
  Colors.yellow,
  Colors.yellow,
  Colors.green,
  Colors.green,
  PRIMARY_COLOR,
  PRIMARY_COLOR,
];

List<Color> colors = [
  Color(0xffcbc9e1),
  Color(0xffdacad3),
  Color(0xffd6cada),
  Color(0xffd2cada),
  Color(0xffcaccda),
  Color(0xffcad5da),
  Color(0xffcadad5),
  Color(0xffcadad0),
  Color(0xffd1daca),
  Color(0xffd7daca),
  Color(0xffdad7ca),
  Color(0xffdad2ca),
  Color(0xffdacbca),
  Color(0xff343435),
  Color(0xfff1f1f1),
];
