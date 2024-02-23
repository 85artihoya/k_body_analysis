import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_body_analysis/app/module/disability/controllers/gmfcs_level_controller.dart';
import 'package:k_body_analysis/app/module/home/views/home_view.dart';

class GMFCSLevelSelectionView extends GetView<GMFCSLevelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('뇌병변 레벨 선택')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 2,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.selectGMFCSLevel(index + 1),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: controller.gmfcsLevel.value == index + 1
                      ? Colors.blue
                      : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridTile(
                header: Center(
                  child: Text(
                    'GMFCS - ${index + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.gmfcsLevel.value == index + 1
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                ),
                child: Image.asset(
                  'assets/gmfcs_level${index + 1}.png', // 각 레벨에 맞는 이미지를 assets 폴더에 추가해야 함
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () => Get.to(() => HomeView()),
          child: Text('저장'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ),
    );
  }
}
