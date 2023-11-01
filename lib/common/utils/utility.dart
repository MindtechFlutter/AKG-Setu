import 'dart:convert';
import 'dart:io';

import 'package:akgsetu/common/utils/storage_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../screens/routes/app_pages.dart';
import 'app_constants.dart';
import 'color_constants.dart';
import 'dimensions.dart';

class Utils {
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (kDebugMode) {
        print('Internet mode : mobile');
      }
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (kDebugMode) {
        print('Internet mode : wifi');
      }
      return true;
    }
    return false;
  }

  static void showSnackBar(error, context, onRetry) {
    final snackBar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(error),
      duration: const Duration(hours: 1),
      action: SnackBarAction(
        label: 'Retry',
        onPressed: () {
          onRetry();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String getDeviceType() {
    //1 for iOS, 2 for Android
    if (Platform.isIOS) {
      // import 'dart:io'
      return "1";
    } else {
      return "2";
    }
  }

  static loader(context) {
    return Center(
      child: Container(
        height: 60.0,
        width: 60.0,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(30)),
        child: const CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColors.appRed,
          ),
        ),
      ),
    );
  }

  static bool isEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static Widget? hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return null;
  }

  static showToast(message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15.0);



  static String convertiEnDateEtHeure(n) {
    String date = DateFormat('yyyy-MM-dd').format(n);

    return date;
  }

  void snackBar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget buildProgressIndicator() {
    return Container(
      height: Dimensions.screenHeight,
      color: AppColors.black.withOpacity(0.4),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.blue,
          valueColor: new AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      ),
    );
  }

  static Widget loadNetworkImage({url, mWidth, fit, mHeight}) {
    return CachedNetworkImage(
      imageUrl: url,
      width: mWidth,
      height: mHeight,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
    );
  }

  static addSmallGap10() {
    return SizedBox(
      height: 10.sp,
    );
  }

  static addSmallGap5() {
    return SizedBox(
      height: 5,
    );
  }

  static addGap15() {
    return SizedBox(
      height: 15.sp,
    );
  }

  static addMediumGap() {
    return SizedBox(
      height: 20.sp,
    );
  }

  static addGap(int size) {
    return SizedBox(
      height: size.sp,
    );
  }

  static addHGap(int size) {
    return SizedBox(
      width: size.sp,
    );
  }

  static checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static addLargeGap() {
    return SizedBox(
      height: 30.sp,
    );
  }

/*  static Future<ValidateModel> getLoginData() async {
    var value = await StorageService.to.getString(AppConstants.loginPref);

    if (value != "") {
      var data = jsonDecode(value);
      ValidateModel validateModel = ValidateModel.fromJson(data);
      return validateModel;
    } else {
      return ValidateModel();
    }
  }*/

/*
  static Future<bool> isLoggedIn() async {
    var isloggedInPref =
        await StorageService.to.getString(AppConstants.loginPref);
    print(isloggedInPref);
    bool isLogin =
        isloggedInPref == "" || isloggedInPref == null ? false : true;
    return isLogin;
  }
*/

  static void getLogoutDialog(context) {
    Platform.isAndroid
        ? Get.dialog(
            AlertDialog(
              title: Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  child: Text(AppConstants.yes),
                  onPressed: () {
                    Navigator.of(Get.overlayContext!, rootNavigator: true)
                        .pop(AppConstants.logout);                    //  Get.back();
                    StorageService().clearData();
                    Get.offNamedUntil(Routes.splash, (route) => false);
                  },
                ),
                TextButton(
                  child: Text(AppConstants.no),
                  onPressed: () {
                    Navigator.of(Get.overlayContext!, rootNavigator: true)
                        .pop(AppConstants.logout);                  },
                ),
              ],
            ),
            barrierDismissible: false,
          )
        : Get.dialog(
            CupertinoAlertDialog(
              title: Text('Are you sure you want to logout?'),
              actions: [
                CupertinoDialogAction(
                  child: Text(AppConstants.yes),
                  onPressed: () {
                    Navigator.of(Get.overlayContext!, rootNavigator: true)
                        .pop(AppConstants.logout);
                    StorageService().clearData();
                    Get.offNamedUntil(Routes.splash, (route) => false);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(AppConstants.no),
                  onPressed: () {
                    Navigator.of(Get.overlayContext!, rootNavigator: true)
                        .pop(AppConstants.logout);                  },
                )
              ],
            ),
            barrierDismissible: false,
          );
  }

/*
  static void getSessionExpiredDialog() {
    Platform.isAndroid
        ? Get.dialog(
            AlertDialog(
              title: Text(AppConstants.sessionExpired),
              actions: [
                TextButton(
                  child: Text(AppConstants.ok),
                  onPressed: () {
                    Get.back();
                    StorageService().clearAllData();
                    Get.offNamedUntil(Routes.auth, (route) => false);
                  },
                ),
              ],
            ),
            barrierDismissible: false,
          )
        : Get.dialog(
            CupertinoAlertDialog(
              title: Text(AppConstants.sessionExpired),
              actions: [
                CupertinoDialogAction(
                  child: Text(AppConstants.ok),
                  onPressed: () {
                    Get.back();
                    StorageService().clearAllData();
                    Get.offNamedUntil(Routes.auth, (route) => false);
                  },
                )
              ],
            ),
            barrierDismissible: false,
          );
  }
*/

  static svgFile({fileName, height, width, color}) => SvgPicture.asset(
        fileName,
        height: height,
        width: width,
        color: color,
      );

  static svgFileWithoutColor({fileName, height, width}) => SvgPicture.asset(
        fileName,
        height: height,
        width: width,
      );
}
