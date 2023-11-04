import 'package:akgsetu/common/CommanTextField.dart';
import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:akgsetu/constants.dart';
import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';

import '../../common/rounded_button.dart';
import '../../common/utils/Styles.dart';
import '../../common/utils/utility.dart';
import '../routes/app_pages.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);

    var height = Utils.getScreenHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
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
                          AppConstants.otpVerification,
                          style: /*TextStyle(
                              color: Colors.brown,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600),*/
                          Styles.textFontRegular(
                              size: 24.0.sp,
                              weight: FontWeight.w600,
                              color: Colors.brown),
                        ),
                      ],
                    ),
                  ),
                  Utils.addGap(20),
                  Text(
                    AppConstants.enterOtpSent,
                    style: Styles.textFontRegular(
                        size: 14.0.sp,
                        weight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Utils.addGap(10),
                  Text(
                    "+91 9998989898",
                    style: Styles.textFontRegular(
                        size: 12.0.sp,
                        weight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Utils.addGap(40),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                  Utils.addGap(20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Didn't receive OTP? ",
                            style: Styles.textFontRegular(size: 12.sp,
                                weight: FontWeight.w400,
                                color: AppColors.black)
                        ),
                        TextSpan(
                          text: "Resend",
                          style: Styles.textFontRegular(size: 12.sp,
                              weight: FontWeight.w400,
                              color: AppColors.pink),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            print("Resend OTP clicked");
                            },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0.sp),
                    child: RoundedButton(
                      buttonText: 'Verfiy & Continue',
                      width: width / 1.5,
                      onpressed: () {
                        Get.to(Dashboard(), transition: Transition.fadeIn);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20, color: AppColors.gray1C, fontWeight: FontWeight.w500),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gray1C, width: 1.sp),
      borderRadius: BorderRadius.circular(5.sp),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w500),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gray1C, width: 1.sp),
      borderRadius: BorderRadius.circular(5.sp),
    ),
  );

  final submittedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w500),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gray1C, width: 1.sp),
      borderRadius: BorderRadius.circular(5.sp),
    ),
  );
}
