import 'package:akgsetu/common/utils/Styles.dart';
import 'package:akgsetu/screens/completed-task/add-expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/utils/color_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';
import '../common/ticket-details.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
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
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      10.width,
                      Text(
                        "Completed Task",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Spacer(),
                      NavToProfile(),
                    ],
                  )),
            ),
          ),
          Utils.addGap(10),
          Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.black53.withOpacity(0.1),
                    offset: Offset(0, 0),
                    spreadRadius: 2.sp,
                    blurRadius: 5.0.sp)
              ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: primaryColor,
                  ),
                  10.width,
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Location"),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Total - 10",
              style: Styles.textFontRegular(
                  size: 14.0.sp, weight: FontWeight.w500, color: Colors.black),
            ),
          ),
          Utils.addGap(10),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => showTicketDetails(context),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
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
                          "Ticket No -",
                          style: Styles.textFontRegular(
                              size: 12.0.sp,
                              weight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        Text(
                          " #03s5468",
                          style: Styles.textFontRegular(
                              size: 12.0.sp,
                              weight: FontWeight.w400,
                              color: Colors.brown),
                        ),
                        Spacer(),
                        Text(
                          "22-05-2023",
                          style: Styles.textFontRegular(
                              size: 10.0.sp,
                              weight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  Utils.addGap(5),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "102, Shivam Complex,Nana Bazaar,Vallabh Vidyanagar,Anand,Gujarat 388120",
                      style: Styles.textFontRegular(
                          size: 10.0.sp,
                          weight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ),
                  Utils.addGap(7),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Completed",
                          style: Styles.textFontRegular(
                              size: 12.0.sp,
                              weight: FontWeight.w400,
                              color: AppColors.green),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => Get.to(AddExpense(),
                              transition: Transition.fadeIn),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.maroon),
                              child: Text(
                                "Add Expense",
                                style: Styles.textFontRegular(
                                    size: 12.0.sp,
                                    weight: FontWeight.w400,
                                    color: AppColors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Utils.addGap(9),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Center(
                      child: Text(
                        "Problem statement....",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
