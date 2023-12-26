import 'dart:convert';
import 'dart:io';

import 'package:akgsetu/routes/app_pages.dart';
import 'package:akgsetu/utils/utility.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../common/service_locator.dart';
import '../network/api/getx_repository.dart';
import '../network/model/login_model.dart';
import '../utils/app_constants.dart';
import '../utils/storage_service.dart';
import 'base_controller.dart';

class LoginController extends BaseController {
  String deviceType = "";
  var isObscure = false.obs;
  final StorageService storageService = StorageService();
  final repo = getIt.get<GetxRepository>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var otpValue = "".obs;

  validate(BuildContext context) async {
    Get.focusScope?.unfocus();

    if (emailController.text.isEmpty) {
      Utils.showToast(AppConstants.errorEmail);
    } else if (!Utils.isEmail(emailController.text)) {
      Utils.showToast(AppConstants.validEmail);
    } else if (passwordController.text.isEmpty) {
      Utils.showToast(AppConstants.errorPassword);
    } else {
      await getDeviceInfo();
      loginApiCall();
    }
  }

  Future loginApiCall() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var platform = await storageService.getString(AppConstants.platform);
    var version = await storageService.getString(AppConstants.version);
    var sdk = await storageService.getString(AppConstants.sdk);
    var brandName = await storageService.getString(AppConstants.brandName);
    var deviceName = await storageService.getString(AppConstants.deviceName);
    var deviceId = await storageService.getString(AppConstants.deviceId);
    var appversion = await storageService.getString(AppConstants.appVersion);
    var params = {
      "email": emailController.text.toString(), // "sampark@akashganga.in",
      "password": passwordController.text.toString(), //"sampark@123"
      "platform": platform,
      "version": version,
      "sdk": sdk,
      "brandName": brandName,
      "deviceName": deviceName,
      "deviceId": deviceId,
      "appversion": appversion,
    };
    isLoading.value = true;
    await repo.login(params, token).then((value) async {
      LoginModel model = value;
      if (model.data?.employeeId != null && model.data?.employeeId != "") {
        // storageService.setString(key, value);
        isLoading.value = false;

        //model.tojson() gives you a map; & jsonencode creates a json string from the map and now we are saving the json string into the sharedpreference;

        var jsonString = jsonEncode(model.toJson());
        storageService.setString(AppConstants.loginPref, jsonString);
        //Storing Employee Id for further use
        var employeeId = model.data?.employeeId;
        storageService.setString(AppConstants.employeeIdK, employeeId);
        Get.offAllNamed(Routes.home);
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, loginApiCall());
    });
  }

  Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String platform = "";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      platform = "android";
      final version = androidInfo.version.release;
      final sdkInt = androidInfo.version.sdkInt;
      final sdk = sdkInt.toString();
      var brandName = androidInfo.brand;
      var device = androidInfo.device;
      var id = androidInfo.id;
      var appVersion = packageInfo.version;

      storageService.setString(AppConstants.platform, platform);
      storageService.setString(AppConstants.version, version);
      storageService.setString(AppConstants.sdk, sdk);
      storageService.setString(AppConstants.brandName, brandName);
      storageService.setString(AppConstants.deviceName, device);
      storageService.setString(AppConstants.deviceId, id);
      storageService.setString(AppConstants.appVersion, appVersion);

      print("Platform is $platform");

      print('Running on Version $version');

      print('Running on Sdk$sdk');

      print('Running on Brand$brandName');

      print('Running on Device$device');

      print('Running on Device Id $id');

      print("Running on appVersion$appVersion");
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      platform = "ios";
      final version = iosInfo.systemVersion;
      var brandName = iosInfo.model;
      var device = iosInfo.name;
      var id = iosInfo.localizedModel;
      var appVersion = packageInfo.version;

      storageService.setString(AppConstants.platform, platform);
      storageService.setString(AppConstants.version, version);
      storageService.setString(AppConstants.brandName, brandName);
      storageService.setString(AppConstants.deviceName, device);
      storageService.setString(AppConstants.deviceId, id);
      storageService.setString(AppConstants.appVersion, appVersion);

      print("Platform is $platform");
      print('Running on Version $version');
      print('Running on Brand$brandName');
      print('Running on Device$device');
      print('Running on Device Id $id');
      print("Running on appVersion$appVersion");
    }
  }
}
