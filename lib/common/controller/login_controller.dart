/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../network/model/login_model.dart';
import 'base_controller.dart';

class LoginController extends BaseController {
  String deviceType = "";
  final StorageService storageService = StorageService();
  final repo = getIt.get<GetxRepository>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  OtpFieldController otpFieldController = OtpFieldController();
  var formKey = GlobalKey<FormState>();
  var otpValue = "".obs;
  var isdialogBtnLoading = false.obs;
  var isOtpBtnLoading = false.obs;

*/
/*  void validate(BuildContext context) {
    final isValid = formKey.currentState?.validate();
    Get.focusScope?.unfocus();
    if (isValid != null) {
      if (isValid) {
        loginAPI(context);
      }
    }
  }

  Future loginAPI(context) async {
    var token = await storageService.getString(AppConstants.tokenPr);
    isdialogBtnLoading.value = true;
    print(token);
    deviceType = Utils.getDeviceType();
    var params = {
      AppConstants.phoneK: "971" + phoneController.text,
      AppConstants.nameK: nameController.text,
    };

    await repo.loginApi(params, token).then((value) async {
      if (value != null) {
        var data = jsonDecode(value);
        LoginModel model = LoginModel.fromJson(data);
        if (model.success == 1) {
          isdialogBtnLoading.value = false;
          Get.back();
          // Utils.showToast(model.data?.otpCode ?? "");
          showEnterOtpBottomSheet(context, model.data?.otpCode ?? "");
        }
      }
    }, onError: (e) {
      isdialogBtnLoading.value = false;
      Utils.showSnackBar(e.toString(), context, () {
        loginAPI(context);
      });
    });
  }

  Future validateAPI(context) async {
    var token = await storageService.getString(AppConstants.tokenPr);
    isOtpBtnLoading.value = true;
    print(token);
    deviceType = Utils.getDeviceType();
    var params = {
      AppConstants.phoneK: phoneController.text,
      AppConstants.nameK: nameController.text,
    };

    await repo.otpValidation(params, token).then((value) async {
      if (value != null) {
        var data = jsonDecode(value);
        ValidateModel model = ValidateModel.fromJson(data);
        if (model.success == 1) {
          isOtpBtnLoading.value = false;
          storageService.setString(AppConstants.loginPref, value);
          Get.back();
        }
      }
    }, onError: (e) {
      isOtpBtnLoading.value = false;
      Utils.showSnackBar(e.toString(), context, () {
        validateAPI(context);
      });
    });
  }

  showEnterOtpBottomSheet(context, otp) {
    return Get.bottomSheet(Material(
        color: Colors.transparent,
        child: Wrap(clipBehavior: Clip.none, children: [
          Obx(() {
            return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                *//*
*/
/*margin: EdgeInsets.symmetric(horizontal: 20),*//*
*/
/*
                child: Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.addGap(20),
                      Text(
                        AppConstants.enterOTP,
                        style: Styles.textFontRegular(
                            color: AppColors.appRed,
                            weight: FontWeight.w400,
                            size: 16.0.sp),
                        textAlign: TextAlign.center,
                      ),
                      Utils.addGap(25),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 30.sp,
                        controller: otpFieldController,
                        style: TextStyle(fontSize: 14.sp, color: AppColors.red),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        keyboardType: TextInputType.number,
                        onCompleted: (pin) {
                          otpValue.value = pin;
                        },
                        onChanged: (pin) {
                          otpValue.value = pin;
                        },
                      ),
                      Utils.addGap(25),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: RoundedButtonWIthLoading(
                            buttonText: AppConstants.login.toUpperCase(),
                            height: 44,
                            isLoading: isOtpBtnLoading.value,
                            width: MediaQuery.of(context).size.width,
                            onPressed: () {
                              if (otpValue.value.length != 6) {
                                Utils.showToast(AppConstants.validOtp);
                              } else if (otpValue.value != otp) {
                                Utils.showToast(AppConstants.otpDoesntMatch);
                              } else {
                                validateAPI(context);
                              }
                            }),
                      ),
                    ],
                  ),
                ));
          })
        ])));
  }*//*

}
*/
