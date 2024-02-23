import 'dart:io';

import 'package:k_body_analysis/app/config/constant.dart';
//import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class BodyPostureApiClient {
  Future<Map<String, dynamic>?> predict(
      {File? front_image, File? side_image, File? back_image}) async {
    var map = {
      'front_image': front_image,
      'side_image': side_image,
      'back_image': back_image
    };
    map.removeWhere((key, value) => key == null || value == null);
    Map<String, dynamic> multi_map = {};
    for (var item in map.entries) {
      multi_map[item.key] = await MultipartFile.fromFile(item.value!.path,
          filename: 'submit.jpg');
    }
    ;
    var form = FormData.fromMap(multi_map);
    final response = await Dio().post(
      AppUrl.bodyPosturePredict,
      data: form,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print(response.data);

      return null;
    }
  }
}
