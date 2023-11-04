import 'package:akgsetu/screens/common/navToProfile.dart';
import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/rounded_button.dart';
import '../../common/utils/color_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';

class ApplyHoliday extends StatefulWidget {
  const ApplyHoliday({super.key});

  @override
  State<ApplyHoliday> createState() => _ApplyHolidayState();
}

class _ApplyHolidayState extends State<ApplyHoliday> {
  DateTime? fromDate;
  DateTime? toDate;

  _showDatePicker(ctx, DateTime? date) async {
    date = await showRoundedDatePicker(
      styleDatePicker: MaterialRoundedDatePickerStyle(
          textStyleYearButton:
              const TextStyle(color: Colors.white, fontSize: 16),
          textStyleDayButton: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600)),
      theme: ThemeData(
        cardColor: primaryColor,
        primaryColor: primaryColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: createMaterialColor(primaryColor))
            .copyWith(background: primaryColor),
      ),
      context: context,
      height: height(context) * 0.4,
      barrierDismissible: false,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
      borderRadius: borderRadius,
    );
    setState(() {});
  }

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
                        "Apply Holiday",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Spacer(),
                      NavToProfile(),
                    ],
                  )),
            ),
          ),
          Utils.addGap(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("From Date"),
                    InkWell(
                      onTap: () => _showDatePicker(context, fromDate),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 45.sp,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(""),
                              ),
                              Icon(
                                FontAwesomeIcons.calendar,
                                color: primaryColor,
                              )
                            ],
                          )),
                    ),
                  ],
                )),
                10.width,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To Date"),
                    InkWell(
                        onTap: () => _showDatePicker(context, toDate),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 45.sp,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(""),
                                ),
                                Icon(
                                  FontAwesomeIcons.calendar,
                                  color: primaryColor,
                                )
                              ],
                            ))),
                  ],
                ))
              ],
            ),
          ),
          Utils.addGap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Apply for reason"),
          ),
          Utils.addGap(3),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 100.sp,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
              )),
          Utils.addGap(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0.sp),
            child: RoundedButton(
              buttonText: 'Apply',
              width: width / 2,
              onpressed: () {
                Get.to(Dashboard(), transition: Transition.fadeIn);
              },
            ),
          )
        ],
      ),
    );
  }
}
