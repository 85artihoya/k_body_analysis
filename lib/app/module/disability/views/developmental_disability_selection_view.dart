import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/developmental_disability_controller.dart';
import 'package:k_body_analysis/app/module/disability/views/disability_type_selection_view.dart';
import 'package:k_body_analysis/app/module/home/views/home_view.dart';

class DevelopmentalDisabilitySelectionView extends GetView<DevelopmentalDisabilityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('발달장애 유형 선택')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '장애 유형을 선택해 주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => controller.selectDisability('지적 장애'),
              child: Text('지적 장애'),
              style: ElevatedButton.styleFrom(
                primary: controller.selectedDisability.value == '지적 장애' ? Colors.blue : Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => controller.selectDisability('자폐 장애'),
              child: Text('자폐 장애'),
              style: ElevatedButton.styleFrom(
                primary: controller.selectedDisability.value == '자폐 장애' ? Colors.blue : Colors.grey,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Get.to(() => HomeView()),
              child: Text('저장'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
