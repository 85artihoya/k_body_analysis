import 'dart:io';

import 'package:camera/camera.dart';
import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/data/model/bodyPosture_model.dart';
import 'package:k_body_analysis/app/data/repository/bodyPosture_repository.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/library/utils/utils.dart';
import 'package:k_body_analysis/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../result/controllers/result_controller.dart';

class DashBoardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BodyPostureRepository bodyPostureRepository = BodyPostureRepository();
  final homeController = Get.find<HomeController>();
  //final resultController = Get.find<ResultController>();

  RxBool isCameraInitialized = false.obs;
  RxBool isLoading = false.obs;
  RxString selected = "".obs;
  CameraController? cameraController;
  int cameraIndex = 0;

  Rx<String> frontImagePath = "".obs;
  Rx<String> sideImagePath = "".obs;
  Rx<String> backImagePath = "".obs;

  RxBool isHorizontal = false.obs;
  void onInit() async {
    super.onInit();
    initCamera();
  }

  Future<void> _initCamera() async {}

  void initCamera() async {
    final cameras = await availableCameras();
    cameraController =
        CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    cameraController!.initialize().then((value) {
      isCameraInitialized.value = true;
      accelerometerEvents.listen(
            (AccelerometerEvent event) {
          print("x - ${event.x} y - ${event.y} z - ${event.z}");

          if (event.x < 0.5 &&
              event.x > -0.5 &&
              event.z < 0.5 &&
              event.z > -0.5) {
            isHorizontal.value = true;
          } else {
            isHorizontal.value = false;
          }
        },
      );
    });
  }

  Future requestPermission(Permission permission) async {
    final result = await permission.request();
    return result;
  }

  void askPermissionCamera() {
    requestPermission(Permission.camera).then((status) {
      if (status != PermissionStatus.granted) {
        if (Platform.isIOS) {
          openAppSettings();
        } else {
          if (status == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          }
        }
      } else {
        Get.toNamed(Routes.CAMERA);
      }
    });
  }

  void saveImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    }
    var image = File(photo!.path);
    CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        compressQuality: 100,
        maxWidth: 1200,
        maxHeight: 1200,
        cropStyle: CropStyle.rectangle,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: PRIMARY_COLOR,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            cropGridColumnCount: 9,
            cropGridRowCount: 16,
          ),
        ]);

    if (cropped == null) {
      return;
    }
    image = File(cropped.path);

    if (selected.value == "FRONT") {
      frontImagePath.value = image.path;
    } else if (selected.value == "SIDE") {
      sideImagePath.value = image.path;
    } else if (selected.value == "BACK") {
      backImagePath.value = image.path;
    }
    ;
  }

  void askPermissionGallery() {
    requestPermission(Permission.camera).then((status) {
      if (status != PermissionStatus.granted) {
        if (Platform.isIOS) {
          openAppSettings();
        } else {
          if (status == PermissionStatus.permanentlyDenied) {
            openAppSettings();
          }
        }
      } else {
        saveImage();
      }
    });
  }

  Future<BodyPosture?> createbodyPosture(
      File? front_image, File? side_image, File? back_image) async {
    BodyPosture? bodyPosture = await bodyPostureRepository.predict(
      front_image: front_image,
      side_image: side_image,
      back_image: back_image,
    );
    return bodyPosture;
  }

  void bodyPosture() async {
    isLoading.value = true;
    File? front_image;
    File? side_image;
    File? back_image;

    if (frontImagePath.value != "") {
      front_image = File(frontImagePath.value);
    }
    if (sideImagePath.value != "") {
      side_image = File(sideImagePath.value);
    }
    if (backImagePath.value != "") {
      back_image = File(backImagePath.value);
    }
    BodyPosture? bodyPosture =
    await createbodyPosture(front_image, side_image, back_image);
    if (bodyPosture == null) {
      isLoading.value = false;
      showMessage("사진 속에 사람이 존재하지 않습니다");
    } else {
      if (frontImagePath.value != "") {
        File(frontImagePath.value).delete();
        frontImagePath.value = "";
      }
      if (sideImagePath.value != "") {
        File(sideImagePath.value).delete();
        sideImagePath.value = "";
      }
      if (backImagePath.value != "") {
        File(backImagePath.value).delete();
        backImagePath.value = "";
      }
      selected.value = "";

      showMessage("측정이 완료 되었습니다");
      homeController.bodyPostureList.add(bodyPosture);

      isLoading.value = false;
      homeController.persistentTabcontroller.jumpToTab(1);
    }
  }

  void takePicture() async {
    final XFile file = await cameraController!.takePicture();
    var image = File(file!.path);
    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressQuality: 100,
      maxWidth: 1200,
      maxHeight: 1200,
      cropStyle: CropStyle.rectangle,
      compressFormat: ImageCompressFormat.jpg,
    );

    if (cropped == null) {
      return;
    }
    image = File(cropped.path);

    if (selected.value == "FRONT") {
      frontImagePath.value = image.path;
    } else if (selected.value == "SIDE") {
      sideImagePath.value = image.path;
    } else if (selected.value == "BACK") {
      backImagePath.value = image.path;
    }
    ;
    Get.back();
  }
}
