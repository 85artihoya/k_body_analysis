import 'dart:io';

import 'package:k_body_analysis/app/data/model/bodyPosture_model.dart';
import 'package:k_body_analysis/app/data/provider/bodyPosture_provider.dart';

class BodyPostureRepository {
  final BodyPostureApiClient apiClient = BodyPostureApiClient();
  Future<BodyPosture?> predict(
      {File? front_image, File? side_image, File? back_image}) async {
    Map<String, dynamic>? json = await apiClient.predict(
        front_image: front_image,
        side_image: side_image,
        back_image: back_image);
    if (json == null) {
      return null;
    } else {
      return BodyPosture.fromJson(json);
    }
  }
}
