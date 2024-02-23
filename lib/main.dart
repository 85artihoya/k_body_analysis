import 'package:k_body_analysis/app/module/login/controllers/login_controller.dart';
import 'package:k_body_analysis/routes/app_pages.dart';
import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 바인딩 초기화
  await GetStorage.init('Gunoemon'); // GetStorage 초기화 (로컬 데이터 저장소)
  await initializeDateFormatting('ko_KR', null); // 날짜 형식 초기화 (한국 로케일 사용)

  // Flutter 앱 실행
  runApp(GetMaterialApp(
    locale: Get.deviceLocale, // 현재 디바이스 로케일 설정
    fallbackLocale: const Locale('en', 'US'), // 언어 설정에 대한 기본 로케일 설정 (영어, 미국)
    debugShowCheckedModeBanner: false, // 디버그 배너 표시 여부
    initialRoute: Routes.INTRO, // 초기 라우트 설정
    theme: ThemeData.light(), // 테마 설정 (기본 라이트 테마 사용)
    defaultTransition: Transition.fade, // 화면 전환 애니메이션 설정 (페이드 인/아웃)
    getPages: AppPages.routes, // GetX 패키지를 사용한 페이지 라우팅 설정
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController()); // LoginController를 의존성 주입 시스템에 등록합니다.
    return GetMaterialApp(
      // ...
    );
  }
}