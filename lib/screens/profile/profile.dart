import 'package:akgsetu/common/rounded_button.dart';
import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../common/constants.dart';
import '../../utils/Styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';
import '../common/navToProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: false, reverse: false),
            child: Container(
              height: height / 6,
              color: primaryColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => Dashboard(),
                            transition: Transition.fadeIn),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      10.width,
                      Text(
                        "My Profile",
                        style: Styles.textFontRegular(
                            size: 20.0.sp,
                            weight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Spacer(),
                    ],
                  )),
            ),
          ),
          Utils.addGap(10),
          Container(
            height: 150.sp,
            width: 150.sp,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                ),
                color: primaryColor.withOpacity(0.4)),
            child: Center(
              child: Icon(
                FontAwesomeIcons.user,
                color: primaryColor,
                size: 50,
              ),
            ),
          ),
          Utils.addGap(15),
          Center(
            child: Text(
              "Parshuram Kalvikatte",
              style: Styles.textFontRegular(
                  size: 16.0.sp, weight: FontWeight.w500, color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              "Field Staff Engineer",
              style: Styles.textFontRegular(
                  size: 14.0.sp,
                  weight: FontWeight.w500,
                  color: AppColors.grayA5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Emp Code - ",
                style: Styles.textFontRegular(
                    size: 14.0.sp,
                    weight: FontWeight.w500,
                    color: AppColors.grayA5),
              ),
              Text(
                "00xx",
                style: Styles.textFontRegular(
                    size: 14.0.sp,
                    weight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          Utils.addGap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Utils.addGap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mobile Number - ",
                style: Styles.textFontRegular(
                    size: 14.0.sp,
                    weight: FontWeight.w500,
                    color: AppColors.grayA5),
              ),
              Text(
                "+91 9999999999",
                style: Styles.textFontRegular(
                    size: 14.0.sp,
                    weight: FontWeight.w500,
                    color: AppColors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Email Id - ",
                style: Styles.textFontRegular(
                    size: 14.0.sp,
                    weight: FontWeight.w500,
                    color: AppColors.grayA5),
              ),
              Text(
                "smitmindtech@gmail.com",
                style: Styles.textFontRegular(
                    size: 14.0.sp,
                    weight: FontWeight.w500,
                    color: AppColors.black),
              ),
            ],
          ),
          Utils.addGap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.0.sp),
                child: RoundedButton(
                  buttonText: 'Logout',
                  width: width / 2,
                  onpressed: () async {
                    Utils.getLogoutDialog(context);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
