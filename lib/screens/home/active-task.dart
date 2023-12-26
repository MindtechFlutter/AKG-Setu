import 'package:akgsetu/controller/employee_active_task_controller.dart';
import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/constants.dart';
import '../../routes/app_pages.dart';
import '../../utils/Styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';
import '../common/navToProfile.dart';
import '../common/ticket-details.dart';

class ActiveTask extends StatefulWidget {
  const ActiveTask({super.key});

  @override
  State<ActiveTask> createState() => _ActiveTaskState();
}

class _ActiveTaskState extends State<ActiveTask> {
  ActiveTaskController activeTaskController = ActiveTaskController();
  getData() async {
    //await activeTaskController.activeTaskApiCall();
    //await activeTaskController.productGroupMaster();
    //await activeTaskController.productMaster();
    // await activeTaskController.problemMaster();
    // await activeTaskController.spareMaster();
    // await activeTaskController.EmployeeMaster();
    // await activeTaskController.VoucherEntry();
    await activeTaskController.VoucherDetail();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
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
                        onTap: () =>
                            Get.to(Dashboard(), transition: Transition.fadeIn),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      10.width,
                      Text(
                        "Active Task",
                        style: Styles.textFontRegular(
                            size: 20.0.sp,
                            weight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Spacer(),
                      NavToProfile(),
                    ],
                  )),
            ),
          ),
          Utils.addGap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Active task",
                      style: Styles.textFontRegular(
                          size: 14.0.sp,
                          weight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Container(
                      height: 2,
                      width: width / 4,
                      color: primaryColor,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Total Task : 10",
                  style: Styles.textFontRegular(
                      size: 14.0.sp,
                      weight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 20.sp),
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
                        border: InputBorder.none, hintText: "Search Item"),
                  ),
                ),
              ],
            ),
          ),
          Utils.addGap(20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.sp),
              // separatorBuilder: (context, index) => Divider(height: 15.h),
              itemCount: 5,
              itemBuilder: (context, index) => InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => showTicketDetails(
                    context,
                    ActiveTaskData(
                        callDate: "15-12-2023 (15-12-2023 11:52)",
                        callId: "151223/C0068",
                        callIssueName: "Jethabhai Dahyabhai Patel ",
                        callIssueNumber: "8980428968",
                        callPriority: "High",
                        districtName: "Sabarkantha",
                        errorDetails: null,
                        latitude: "23.5437203000",
                        longitude: "73.2619771000",
                        problemDetails: "NOT WORKING",
                        problemExtraDetails: null,
                        productGroupName: "Computer Hardware",
                        productName: "CPU Box(For Calllog Only)",
                        remarks: null,
                        societyCode: "1016",
                        societyName: "Madasana 1016",
                        talukaName: "Modasa")),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black53.withOpacity(0.1),
                            offset: Offset(0, 0),
                            spreadRadius: 2.sp,
                            blurRadius: 5.0.sp)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
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
                              // activeTaskController
                              //         .activeTaskList.value[index].callId ??
                              "",
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
                      Text(
                        "25 min away form your current location",
                        style: Styles.textFontRegular(
                            size: 10.0.sp,
                            weight: FontWeight.w400,
                            color: AppColors.green),
                      ),
                      Utils.addGap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => showDeclineDialog(context),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
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
                                    style: Styles.textFontRegular(
                                        size: 10.0.sp,
                                        weight: FontWeight.w400,
                                        color: AppColors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          10.width,
                          InkWell(
                              //17/11/2023 Vedant Changed Route
                              //onTap: () => Get.toNamed(Routes.acceptLocation),
                              onTap: () =>
                                  Get.toNamed(Routes.inventoryConsumed),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
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
                                      style: Styles.textFontRegular(
                                          size: 10.0.sp,
                                          weight: FontWeight.w400,
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                              )),
                        ],
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
            ),
          ),
        ],
      ),
    );
  }
}
