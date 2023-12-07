
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../common/constants.dart';
import '../../utils/Styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';
import '../common/navToProfile.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
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
      barrierDismissible: true,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
      borderRadius: borderRadius,
    );
    setState(() {});
  }

  showAttendanceDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: height(context) * 0.6,
          width: width(context) * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.cancel,
                              color: Colors.black54,
                            ),
                          ),
                        ]),
                  ),
                  Text(
                    "Attendance",
                    style: TextStyle(fontSize: 19),
                  ),
                  Container(
                    height: 2,
                    width: width(context) * 0.35,
                    color: primaryColor,
                  ),
                ],
              ),
              Utils.addGap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1 July 2023",
                    style: TextStyle(fontSize: 19, color: AppColors.maroon),
                  ),
                  Text(
                    " To ",
                    style: TextStyle(fontSize: 19),
                  ),
                  Text(
                    "1 July 2023",
                    style: TextStyle(fontSize: 19, color: AppColors.maroon),
                  ),
                ],
              ),
              Utils.addGap(10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: primaryColor.withOpacity(0.4),
                height: height(context) * 0.06,
                width: width(context),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  30.width,
                  Expanded(child: Text("In Time - 11:00 AM")),
                  Expanded(
                      child: Text(
                    "Out Time - 11:00 PM",
                  )),
                ]),
              ),
              Utils.addGap(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: primaryColor.withOpacity(0.4),
                height: height(context) * 0.06,
                width: width(context),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  30.width,
                  Expanded(child: Text("In Time - 11:00 AM")),
                  Expanded(
                      child: Text(
                    "Out Time - 11:00 PM",
                  )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
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
                      10.width,
                      Text(
                        "Attendance",
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: height / 2,
                child: SfDateRangePicker(
                  showNavigationArrow: true,
                  todayHighlightColor: primaryColor,
                  maxDate: DateTime.now(),
                  selectionColor: AppColors.maroon,
                  selectionTextStyle: TextStyle(color: Colors.white),
                  view: DateRangePickerView.month,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                      // specialDates: [
                      //   DateTime.now().subtract(Duration(days: 2)),
                      //   DateTime.now().subtract(Duration(days: 3))
                      // ],
                      ),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    weekendTextStyle: TextStyle(
                        color: AppColors.maroon.withOpacity(0.2),
                        fontWeight: FontWeight.bold),
                    specialDatesDecoration: BoxDecoration(
                        color: AppColors.maroon,
                        border: Border.all(color: Colors.white, width: 1),
                        shape: BoxShape.circle),
                    specialDatesTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.maroon)),
                    child: Center(
                      child: Text(
                        "24 Aug 2023",
                        style: TextStyle(
                            color: AppColors.maroon,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                10.width,
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor.withOpacity(0.3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: AppColors.maroon,
                            ),
                            width: width,
                            child: Center(
                              child: Text(
                                "In Time",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "10 : 10 AM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                ),
                10.width,
                Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor.withOpacity(0.3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: AppColors.maroon,
                            ),
                            width: width,
                            child: Center(
                              child: Text(
                                "Out Time",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "12 : 10 AM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Utils.addGap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("From Date"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => _showDatePicker(context, toDate),
                    child: Container(
                        height: 45.sp,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            10.width,
                            Expanded(
                              child: Text(""),
                            ),
                            Icon(
                              FontAwesomeIcons.calendar,
                              color: primaryColor,
                            ),
                            10.width
                          ],
                        )),
                  ),
                ),
                15.width,
                Expanded(
                  child: InkWell(
                    onTap: () => showAttendanceDetails(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Check",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
