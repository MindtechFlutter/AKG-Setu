import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants.dart';
import '../../utils/Styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';

showTicketDetails(BuildContext context, ActiveTaskData activeTaskData) {
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Utils.addGap(10),
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ticket Details",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Container(
                  height: 2,
                  width: width(context) * 0.35,
                  color: primaryColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(
                    "Ticket No - ${activeTaskData.callId}",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  // Spacer(),
                  // Text("22-05-2023"),
                ],
              ),
            ),
            Utils.addGap(10),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date - ", style: Styles.textFontRegular(size: 14)),
                  Flexible(
                    child: Text(
                      "${activeTaskData.callDate}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CallIssueName - ",
                      style: Styles.textFontRegular(size: 14)),
                  Flexible(
                    child: Text(
                      "${activeTaskData.callIssueName}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CallIssueNumber - ",
                      style: Styles.textFontRegular(size: 14)),
                  Flexible(
                    child: Text(
                      "${activeTaskData.callIssueNumber}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CallPriority - ",
                      style: Styles.textFontRegular(size: 14)),
                  Flexible(
                    child: Text(
                      "${activeTaskData.callPriority}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text("DistrictName - ",
                      style: Styles.textFontRegular(size: 14)),
                  Flexible(
                    child: Text(
                      "${activeTaskData.districtName}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "ErrorDetails - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.errorDetails}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "Latitude - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.latitude}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "Longitude - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.longitude}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "ProblemDetails - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.problemDetails}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "ProblemExtraDetails - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.problemExtraDetails}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "ProductGroupName - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.productGroupName}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "ProductName - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.productName}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "Remarks - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.remarks}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "SocietyCode - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.societyCode}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "SocietyName - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.societyName}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(5),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                children: [
                  Text(
                    "TalukaName - ",
                    style: Styles.textFontRegular(size: 14),
                  ),
                  Flexible(
                    child: Text(
                      "${activeTaskData.talukaName}",
                      softWrap: true,
                      maxLines: 100,
                      style: Styles.textFontRegular(
                          size: 12, weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Utils.addGap(15),
          ],
        ),
      ),
    ),
  );
}

showDeclineDialog(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height(context) * 0.6,
        width: width(context) * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Decline Reason",
                  style: Styles.textFontRegular(
                      size: 14.0.sp,
                      weight: FontWeight.w500,
                      color: Colors.black),
                ),
                Container(
                  height: 2,
                  width: width(context) * 0.35,
                  color: primaryColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(
                    "Ticket No - ",
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
            Text(
              "102, Shivam Complex,Nana Bazaar,Vallabh Vidyanagar,Anand,Gujarat 388120",
              style: Styles.textFontRegular(
                  size: 10.0.sp,
                  weight: FontWeight.w400,
                  color: Colors.black54),
            ),
            Utils.addGap(7),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reason",
                style: Styles.textFontRegular(
                    size: 10.0.sp,
                    weight: FontWeight.w400,
                    color: AppColors.maroon),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Radio<int>(
                      activeColor: AppColors.maroon,
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {}),
                ),
                Text(
                  "Reason - 1",
                  style: Styles.textFontRegular(
                      size: 10.0.sp,
                      weight: FontWeight.w400,
                      color: Colors.black54),
                ),
              ],
            ),
            Utils.addGap(5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Comments",
                style: Styles.textFontRegular(
                    size: 12.0.sp,
                    weight: FontWeight.w400,
                    color: AppColors.black),
              ),
            ),
            Utils.addGap(5),
            Container(
              height: 100,
              width: width(context),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54)),
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  width: width(context) * 0.4,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.maroon),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: Styles.textFontRegular(
                          size: 10.0.sp,
                          weight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
