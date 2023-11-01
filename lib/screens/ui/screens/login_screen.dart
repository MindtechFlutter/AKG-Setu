/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../common/utils/utility.dart';
import '../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final LoginController loginScreenController = Get.put((LoginController()));

  @override
  Widget build(BuildContext context) {

    bool obscureText = true;
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);

    return Obx(() {
      return ModalProgressHUD(
          color: Colors.black.withOpacity(0.6),
          dismissible: false,
          progressIndicator: Utils.loader(context),
          inAsyncCall: loginScreenController.isLoading.value,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.appRed,
                      size: 28,
                    )),
                title: Text(
                  AppConstants.login,
                  style: Styles.textFontRegular(
                      color: AppColors.appRed,
                      weight: FontWeight.w400,
                      size: 16.0),
                  textAlign: TextAlign.center,
                )),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppIcons.common_bg),
                    fit: BoxFit.cover,
                  ),
                ), // for setting bg image
                height: height - 120.sp,
                width: width,
                child: Form(
                  key: loginScreenController.formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Utils.addGap(25),
                        getTextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return AppConstants.errorEmail;
                            }
                            if (!Utils.isEmail(value)) {
                              return AppConstants.validEmail;
                            }
                            return null;
                          },
                          controller: loginScreenController.phoneController,
                          isObscureText: false,
                          onChanged: (String value) {},
                          hintText: "Enter Email",
                          labelText: "Email",
                          passwordButton: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              AppIcons.email,
                              height: 10.sp,
                              width: 10.sp,
                            ),
                          ),
                        ),
                        Utils.addGap(10),
                        getTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppConstants.errorFName;
                            }
                            return null;
                          },
                          isObscureText: true,
                          passwordButton: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.appRed,
                            ),
                            onPressed: () {
                              print(obscureText);
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          controller: loginScreenController.nameController,
                          onChanged: (String value) {},
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        Utils.addGap(10),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: RoundedButton(
                              buttonText: AppConstants.save.toUpperCase(),
                              height: 44,
                              width: width,
                              onpressed: () {
*/
/*
                                loginScreenController.validate(context);
*//*

                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
*/
