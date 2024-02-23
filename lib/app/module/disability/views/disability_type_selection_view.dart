import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/disability_type_controller.dart';
import 'package:k_body_analysis/app/module/disability/views/gmfcs_level_selection_view.dart';
import 'package:k_body_analysis/app/module/disability/views/developmental_disability_selection_view.dart';
import 'package:k_body_analysis/app/module/disability/views/other_disability_view.dart';

class DisabilityTypeSelectionView extends GetView<DisabilityTypeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('장애 유형 선택')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '장애 유형을 선택해주세요.',
              textAlign: TextAlign.center,
            ),
          ),
          ...['뇌병변', '발달장애', '기타'].map((type) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => controller.selectDisabilityType(type),
              child: Text(type),
              style: ElevatedButton.styleFrom(
                primary: controller.disabilityType.value == type ? Colors.blue : Colors.grey,
              ),
            ),
          )).toList(), // .toList() 추가
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                switch (controller.disabilityType.value) {
                  case '뇌병변':
                    Get.to(() => GMFCSLevelSelectionView());
                    break;
                  case '발달장애':
                    Get.to(() => DevelopmentalDisabilitySelectionView());
                    break;
                  case '기타':
                    Get.to(() => OtherDisabilityView());
                    break;
                }
              },
              child: Text('다음'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
