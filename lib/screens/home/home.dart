import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:akgsetu/common/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../common/utils/Styles.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      Image(
                        image: AssetImage('assets/images/akg-logo2.png'),
                        height: 30.sp,
                      ),
                      Spacer(),
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
                      )
                    ],
                  )),
            ),
          ),
          Utils.addGap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.addHGap(10),
              Expanded(
                  flex: 1,
                  child:
                      cards(AppConstants.activeTask, AppIcons.activeTask, "2")),
              Utils.addHGap(10),
              Expanded(
                  flex: 1,
                  child: cards(AppConstants.visitsCompleted,
                      AppIcons.visitsCompleted, "5")),
              Utils.addHGap(10),
              Expanded(
                  flex: 1,
                  child:
                      cards(AppConstants.inventory, AppIcons.inventory, "7")),
              Utils.addHGap(10),
            ],
          ),
          Utils.addGap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.addHGap(10),
              Expanded(
                  flex: 1,
                  child: cards(AppConstants.vouchers, AppIcons.vouchers, "2")),
              Utils.addHGap(10),
              Expanded(
                  flex: 1,
                  child: cards(AppConstants.holidays, AppIcons.holiday, "5")),
              Utils.addHGap(10),
              Expanded(
                  flex: 1, child: cards(AppConstants.WIP, AppIcons.wip, "5")),
              Utils.addHGap(10),
            ],
          ),
          Utils.addGap(20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Active task",
                style: TextStyle(fontSize: 19),
              ),
            ),
          ),
          Utils.addGap(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: height / 5,
            width: width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: AppColors.black53.withOpacity(0.1),
                  offset: Offset(0, 0),
                  spreadRadius: 2.sp,
                  blurRadius: 5.0.sp)
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Text(
                        "Ticket No - #03s5468",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      Spacer(),
                      Text("22-05-2023"),
                    ],
                  ),
                ),
                Utils.addGap(5),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "102, Shivam Complex,Nana Bazaar,Vallabh Vidyanagar,Anand,Gujarat 388120",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
                Utils.addGap(7),
                Text(
                  "25 min away form your current location",
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
                Utils.addGap(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.maroon),
                      child: Row(
                        children: [
                          Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                          5.width,
                          Text(
                            "Decline",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    10.width,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.green1),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: AppColors.white,
                          ),
                          5.width,
                          Text(
                            "Accept",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cards(String text, String icon, String count) {
    return Container(
      height: 100.sp,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.black44.withOpacity(0.10),
              offset: Offset(0, 0),
              spreadRadius: 4.sp,
              blurRadius: 4.0.sp)
        ],
        borderRadius: BorderRadius.circular(20.sp),
      ),
      padding: EdgeInsets.all(8.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 26.sp,
            width: 26.sp,
          ),
          Utils.addGap(5),
          Text(
            text,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Styles.textFontRegular(
                size: 12.sp, weight: FontWeight.w500, color: AppColors.black44),
          ),
          Utils.addGap(5),
          Text(
            count,
            style: Styles.textFontRegular(
                size: 15.sp, weight: FontWeight.w600, color: AppColors.black),
          ),
          Utils.addGap(5),
        ],
      ),
    );
  }
}
