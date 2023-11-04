import 'package:akgsetu/common/CommanTextField.dart';
import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:akgsetu/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/rounded_button.dart';
import '../../common/utils/Styles.dart';
import '../../common/utils/utility.dart';
import '../routes/app_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);

    var height = Utils.getScreenHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: false, reverse: false),
            child: Container(
                height: height * 0.32,
                color: primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/images/login.png'),
                      height: height * 0.25,
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        height: 32.sp,
                        width: 2.5.sp,
                        color: Colors.brown,
                      ),
                      Utils.addHGap(3),
                      Text(
                        "Login",
                        style: /*TextStyle(
                            color: Colors.brown,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600),*/
                            Styles.textFontRegular(
                                size: 26.0.sp,
                                weight: FontWeight.w600,
                                color: Colors.brown),
                      ),
                    ],
                  ),
                ),
                Utils.addGap(20),
                Text(
                  AppConstants.enterPhnNo,
                  style: /*TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),*/
                      Styles.textFontRegular(
                          size: 14.0.sp,
                          weight: FontWeight.w500,
                          color: Colors.black),
                ),
                Utils.addGap(10),
                Text(
                  AppConstants.sendVerificationCode,
                  style: /*TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),*/
                      Styles.textFontRegular(
                          size: 12.0.sp,
                          weight: FontWeight.w400,
                          color: Colors.black),
                ),
                Utils.addGap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.mobileno,
                      style: Styles.textFontRegular(
                          size: 12.0.sp,
                          weight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                Utils.addGap(5),
                Container(
                  height: 50.sp,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.sp,
                      ),
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "+91",
                          style: Styles.textFontRegular(
                              size: 16.0, weight: FontWeight.w500),
                        ),
                      ),
                      Utils.addHGap(10),
                      Container(
                        height: 32.sp,
                        width: 1.sp,
                        color: AppColors.black44,
                      ),
                      Utils.addHGap(10),
                      Expanded(
                        child: getTransparentTextFormField(
                            validator: (String? value) {},
                            isObscureText: false,
                            hintText: AppConstants.enterPhnNo,
                            inputType: TextInputType.phone,
                            onChanged: (String value) {}),
                      )
                    ],
                  ),
                ),
                Utils.addHGap(60),
                Padding(
                  padding:  EdgeInsets.only(top:40.0.sp),
                  child: RoundedButton(
                    buttonText: 'Get OTP',
                    width: width/2,
                    onpressed: () {
                      Get.toNamed(Routes.otpVerify);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
