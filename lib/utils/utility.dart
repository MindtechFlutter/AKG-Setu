import 'dart:convert';
import 'dart:io';

import 'package:akgsetu/common/constants.dart';
import 'package:akgsetu/network/model/login_model.dart';
import 'package:akgsetu/utils/storage_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../routes/app_pages.dart';
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

  static showSnackBar(error, onRetry) {
    Get.snackbar(
      'Error',
      error,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM, // Adjust the position as needed
      mainButton: TextButton(
        onPressed: () {
          onRetry();
          Get.back(); // Close the snackbar
        },
        child: Text(
          'Retry',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
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
            AppColors.blue,
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

  // static Widget loadNetworkImage({url, mWidth, fit, mHeight}) {
  //   return CachedNetworkImage(
  //     imageUrl: url,
  //     width: mWidth,
  //     height: mHeight,
  //     imageBuilder: (context, imageProvider) => Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: imageProvider,
  //           fit: fit,
  //         ),
  //       ),
  //     ),
  //     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
  //     errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
  //   );
  // }

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

  static Future<LoginModel> getLoginData() async {
    var value = await StorageService.to.getString(AppConstants.loginPref);

    if (value != "") {
      var data = jsonDecode(value);
      LoginModel validateModel = LoginModel.fromJson(data);
      return validateModel;
    } else {
      return LoginModel();
    }
  }

  static Future<bool> isLoggedIn() async {
    var isloggedInPref =
        await StorageService.to.getString(AppConstants.loginPref);
    print(isloggedInPref);
    bool isLogin =
        isloggedInPref == "" || isloggedInPref == null ? false : true;
    return isLogin;
  }

  static void getLogoutDialog(context) {
    Platform.isAndroid
        ? Get.dialog(
            AlertDialog(
              title: Text('Are you sure you want to logout?'),
              actions: [
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    child: Text(AppConstants.yes),
                    onPressed: () {
                      Navigator.of(Get.overlayContext!, rootNavigator: true)
                          .pop(AppConstants.logout); //  Get.back();
                      StorageService().clearData();
                      Get.offNamedUntil(Routes.splash, (route) => false);
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    child: Text(AppConstants.no),
                    onPressed: () {
                      Navigator.of(Get.overlayContext!, rootNavigator: true)
                          .pop(AppConstants.logout);
                    },
                  ),
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
                        .pop(AppConstants.logout);
                  },
                )
              ],
            ),
            barrierDismissible: false,
          );
  }

  static void getDeleteDialog(context, function) {
    Platform.isAndroid
        ? Get.dialog(
            AlertDialog(
              title: const Text('Are you sure you want to delete this voucher'),
              actions: [
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    child: const Text(AppConstants.yes),
                    onPressed: () {
                      Navigator.of(Get.overlayContext!, rootNavigator: true)
                          .pop();
                      function();
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    child: const Text(AppConstants.no),
                    onPressed: () {
                      Navigator.of(Get.overlayContext!, rootNavigator: true)
                          .pop();
                    },
                  ),
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
                        .pop(AppConstants.logout);
                  },
                )
              ],
            ),
            barrierDismissible: false,
          );
  }

  static void checkImageDialog(context) {
    Platform.isAndroid
        ? Get.dialog(
            const AlertDialog(
              title: Text('Upload Bill Image Before Proceeding'),
            ),
            barrierDismissible: false,
          )
        : Get.dialog(
            const CupertinoAlertDialog(
              title: Text('Upload Bill Image Before Proceeding'),
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

  static Future<String?> pickImageOrPDF() async {
    if (Platform.isAndroid) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      if ((info.version.sdkInt ?? 0) >= 33) {
        return await _pickFile();
      } else {
        final permissionStatus = await Permission.storage.request();
        if (permissionStatus.isDenied) {
          // Here just ask for the permission for the first time
          await Permission.storage.request();

          // I noticed that sometimes popup won't show after user press deny
          // so I do the check once again but now go straight to appSettings
          if (permissionStatus.isDenied) {
            await openAppSettings();
          }
        } else if (permissionStatus.isPermanentlyDenied) {
          // Here open app settings for user to manually enable permission in case
          // where permission was permanently denied
          await openAppSettings();
        } else {
          return await _pickFile();
        }
      }
    } else {
      final permissionStatus = await Permission.storage.request();
      if (permissionStatus.isDenied) {
        // Here just ask for the permission for the first time
        await Permission.storage.request();

        // I noticed that sometimes popup won't show after user press deny
        // so I do the check once again but now go straight to appSettings
        if (permissionStatus.isDenied) {
          await openAppSettings();
        }
      } else if (permissionStatus.isPermanentlyDenied) {
        // Here open app settings for user to manually enable permission in case
        // where permission was permanently denied
        await openAppSettings();
      } else {
        return await _pickFile();
      }
    }
  }

  static Future<String?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      return file.path;
    } else {
      return null;
    }
  }

  //*******************Methods to get device info*****************************

  // version get method
  static Future<String> getVersion() async {
    String version = "";
    if (Platform.isAndroid) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        version = androidInfo.version.release;
        return version;
      } catch (e) {
        return version;
      }
    } else if (Platform.isIOS) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        version = iosDeviceInfo.systemVersion;
        return version;
      } catch (e) {
        return version;
      }
    }
    return version;
  }

  //Android sdk get method
  static Future<String> getAndroidSdk() async {
    String sdk = "";
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      sdk = sdkInt.toString();
      return sdk;
    } catch (e) {
      return sdk;
    }
  }

  //BrandName get method
  static Future<String> getBrandName() async {
    String brandName = "";
    if (Platform.isAndroid) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        brandName = androidInfo.brand;
        return brandName;
      } catch (e) {
        return brandName;
      }
    } else if (Platform.isIOS) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        brandName = iosDeviceInfo.model;
        return brandName;
      } catch (e) {
        return brandName;
      }
    }
    return brandName;
  }

  //DeviceName get method
  static Future<String> getDevice() async {
    String device = "";
    if (Platform.isAndroid) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.device;
        return device;
      } catch (e) {
        return device;
      }
    } else if (Platform.isIOS) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        device = iosDeviceInfo.name;
        return device;
      } catch (e) {
        return device;
      }
    }
    return device;
  }

  //Device Id get method
  static Future<String> getDeviceId() async {
    String id = "";
    if (Platform.isAndroid) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        id = androidInfo.id;
        return id;
      } catch (e) {
        return id;
      }
    } else if (Platform.isIOS) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        id = iosDeviceInfo.systemVersion;
        return id;
      } catch (e) {
        return id;
      }
    }
    return id;
  }

  //App version get method
  static Future<String> getAppVersion() async {
    String appVersion = "";
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
      return appVersion;
    } catch (e) {
      return appVersion;
    }
  }

  //Platform get method
  static Future<String> getPlatform() async {
    String platform = "";
    if (Platform.isAndroid) {
      platform = "android";
      return platform;
    } else if (Platform.isIOS) {
      platform = "ios";
      return platform;
    }
    return platform;
  }
}
