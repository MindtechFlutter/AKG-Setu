import 'package:akgsetu/screens/holiday/apply-holiday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/utils/color_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';
import '../common/ticket-details.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  bool isAll = true;
  bool isApproved = false;
  bool isPending = false;
  bool isRejected = false;

  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          eccentricity: 0.9,
        ),
        backgroundColor: AppColors.pink,
        onPressed: () => Get.to(ApplyHoliday(), transition: Transition.fadeIn),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
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
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      10.width,
                      Text(
                        "Holiday List",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Spacer(),
                      NavToProfile(),
                    ],
                  )),
            ),
          ),
          Utils.addGap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                chipTab(
                  "All",
                  isAll,
                  () => setState(
                    () {
                      isApproved = false;
                      isAll = true;
                      isPending = false;
                      isRejected = false;
                    },
                  ),
                ),
                5.width,
                chipTab(
                  "Approved",
                  isApproved,
                  () => setState(
                    () {
                      isApproved = true;
                      isAll = false;
                      isPending = false;
                      isRejected = false;
                    },
                  ),
                ),
                5.width,
                chipTab(
                  "Pending",
                  isPending,
                  () => setState(
                    () {
                      isApproved = false;
                      isAll = false;
                      isPending = true;
                      isRejected = false;
                    },
                  ),
                ),
                5.width,
                chipTab(
                  "Rejected",
                  isRejected,
                  () => setState(
                    () {
                      isApproved = false;
                      isAll = false;
                      isPending = false;
                      isRejected = true;
                    },
                  ),
                ),
              ],
            ),
          ),
          Utils.addGap(30),
          ticket(Colors.green, true, false, false),
          Utils.addGap(10),
          ticket(Colors.amber, false, true, false),
          Utils.addGap(10),
          ticket(Colors.red, false, false, true),
        ],
      ),
    );
  }

  ticket(
      MaterialColor color, bool isApproved, bool isPending, bool isRejected) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => showTicketDetails(context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "22-05-2023 to 22-05-2023",
                    style: TextStyle(color: Colors.grey),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reason",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummsdf sd......",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            Utils.addGap(9),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                  color: color.shade100,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Center(
                child: Text(
                  isApproved
                      ? "Approved"
                      : isPending
                          ? "Pending"
                          : "Rejected",
                  style: TextStyle(color: color.shade800),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  chipTab(String text, bool boolVar, Function()? onTap) {
    return Expanded(
        child: InkWell(
            onTap: onTap,
            child: Container(
              height: 35.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: boolVar ? AppColors.maroon : Colors.grey.shade400),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: boolVar ? Colors.white : Colors.grey.shade700,
                      fontSize: 17),
                ),
              ),
            )));
  }
}
