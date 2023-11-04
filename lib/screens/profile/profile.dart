import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/utils/utility.dart';
import '../../constants.dart';
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
                        style: TextStyle(color: Colors.white, fontSize: 24),
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
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              "Field Staff Engineer",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Emp Code - ",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),
              Text(
                "00xx",
                style: TextStyle(color: Colors.black, fontSize: 18),
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
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),
              Text(
                "+91 9999999999",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Email Id - ",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),
              Text(
                "smitmindtech@gmail.com",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
