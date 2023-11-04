import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../profile/profile.dart';

class NavToProfile extends StatefulWidget {
  const NavToProfile({super.key});

  @override
  State<NavToProfile> createState() => _NavToProfileState();
}

class _NavToProfileState extends State<NavToProfile> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Get.to(ProfilePage(),
                            transition: Transition.fadeIn),
                        child: 
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            margin: EdgeInsets.only(bottom: 16.sp),
                            padding: EdgeInsets.all(6.sp),
                            child: Center(
                              child: Icon(
                                Icons.person_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ));
  }
}