import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants.dart';
import '../../utils/Styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';



showTicketDetails(BuildContext context) {
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
        height: height(context) * 0.42,
        width: width(context) * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Utils.addGap(10),
            Column(
              children: [
                Text(
                  "Ticket Details",
                  style: TextStyle(fontSize: 19),
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
                    "Ticket No - #03s5468",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  Spacer(),
                  Text("22-05-2023"),
                ],
              ),
            ),
            Utils.addGap(5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Problem Details",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            Utils.addGap(5),
            Expanded(
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo "),
            ),
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
