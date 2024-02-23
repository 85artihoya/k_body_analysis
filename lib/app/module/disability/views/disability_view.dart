import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/disability_controller.dart';
import 'package:k_body_analysis/app/module/disability/views/disability_type_selection_view.dart';
import 'package:k_body_analysis/app/module/home/views/home_view.dart';

class DisabilityView extends GetView<DisabilityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('세부 정보 입력')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '장애인 여부를 선택해주세요.',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => controller.setDisability(true),
              child: Text('장애'),
              style: ElevatedButton.styleFrom(
                primary: controller.hasDisability.value ? Colors.blue : Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => controller.setDisability(false),
              child: Text('비장애'),
              style: ElevatedButton.styleFrom(
                primary: controller.hasDisability.value ? Colors.grey : Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (controller.hasDisability.value) {
                  Get.to(() => DisabilityTypeSelectionView());
                } else {
                  Get.to(() => HomeView());
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
