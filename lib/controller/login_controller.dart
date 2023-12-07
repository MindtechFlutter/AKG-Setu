import 'dart:convert';

import 'package:akgsetu/routes/app_pages.dart';
import 'package:akgsetu/utils/utility.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

  validate(BuildContext context) {
    Get.focusScope?.unfocus();

    if (emailController.text.isEmpty) {
      Utils.showToast(AppConstants.errorEmail);
    } else if (!Utils.isEmail(emailController.text)) {
      Utils.showToast(AppConstants.validEmail);
    } else if (passwordController.text.isEmpty) {
      Utils.showToast(AppConstants.errorPassword);
    } else {
      loginApiCall();
    }
  }

  Future loginApiCall() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var params = {
      "email": emailController.text.toString(), // "sampark@akashganga.in",
      "password": passwordController.text.toString(), //"sampark@123"
    };
    isLoading.value = true;
    await repo.login(params, token).then((value) async {
      LoginModel model = value;
      if (model.data?.employeeId != null && model.data?.employeeId != "") {
        isLoading.value = false;

        //model.tojson() gives you a map; & jsonencode creates a json string from the map and now we are saving the json string into the sharedpreference;

        var jsonString = jsonEncode(model.toJson());
        storageService.setString(AppConstants.loginPref, jsonString);
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
}
