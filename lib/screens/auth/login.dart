import 'package:akgsetu/common/CommanTextField.dart';
import 'package:akgsetu/controller/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../common/constants.dart';
import '../../common/rounded_button.dart';
import '../../utils/Styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/utility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);

    var height = Utils.getScreenHeight(context);

    return Obx(() {
      return ModalProgressHUD(
        inAsyncCall: loginController.isLoading.value,
        progressIndicator: Utils.loader(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 15.sp),
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
                          // Utils.addGap(20),
                          // Text(
                          //   AppConstants.enterPhnNo,
                          //   style: /*TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 14.sp,
                          //       fontWeight: FontWeight.w500),*/
                          //       Styles.textFontRegular(
                          //           size: 14.0.sp,
                          //           weight: FontWeight.w500,
                          //           color: Colors.black),
                          // ),
                          Utils.addGap(15),
                          Text(
                            AppConstants.enterCredentials,
                            style: /*TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),*/
                                Styles.textFontRegular(
                                    size: 14.0.sp,
                                    weight: FontWeight.w400,
                                    color: Colors.black),
                          ),
                          Utils.addGap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.email,
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
                                Utils.addHGap(10),
                                Expanded(
                                  child: getTransparentTextFormField(
                                      validator: (String? value) {},
                                      controller:
                                          loginController.emailController,
                                      isObscureText: false,
                                      hintText: AppConstants.enterEmailId,
                                      inputType: TextInputType.emailAddress,
                                      onChanged: (String value) {}),
                                )
                              ],
                            ),
                          ),
                          Utils.addGap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppConstants.password,
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
                                Utils.addHGap(10),
                                Expanded(
                                  child:
                                      getTransparentTextFormFieldWithoutMultiLine(
                                          passwordButton: IconButton(
                                              onPressed: () {
                                                loginController
                                                        .isObscure.value =
                                                    !loginController
                                                        .isObscure.value;
                                              },
                                              icon: Icon(loginController
                                                      .isObscure.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility)),
                                          validator: (String? value) {},
                                          controller: loginController
                                              .passwordController,
                                          isObscureText:
                                              loginController.isObscure.value,
                                          hintText: AppConstants.enterPassword,
                                          inputType: TextInputType.text,
                                          onChanged: (String value) {}),
                                )
                              ],
                            ),
                          ),
                          Utils.addHGap(60),
                          Padding(
                            padding: EdgeInsets.only(top: 40.0.sp),
                            child: RoundedButton(
                              buttonText: 'Login',
                              width: width / 2,
                              onpressed: () async {
                                await loginController.validate(context);
                                // Get.toNamed(Routes.home);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
