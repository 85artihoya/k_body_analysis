import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/other_disability_controller.dart';

class OtherDisabilityView extends GetView<OtherDisabilityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기타 장애')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                // 사용자가 텍스트를 입력할 때마다 컨트롤러의 상태를 업데이트합니다.
                controller.diagnosis.value = value;
              },
              decoration: InputDecoration(
                labelText: '장애 진단명',
                hintText: '장애 진단명을 입력하세요',
              ),
            ),
            SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: controller.diagnosis.value.trim().isNotEmpty
                  ? () => controller.saveDiagnosis(controller.diagnosis.value)
                  : null, // 진단명이 입력되지 않으면 버튼 비활성화
              child: Text('저장'),
            )),
          ],
        ),
      ),
    );
  }
}
