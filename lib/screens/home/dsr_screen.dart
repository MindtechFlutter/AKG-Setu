import 'package:akgsetu/common/rounded_button.dart';
import 'package:akgsetu/common/routes/app_pages.dart';
import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/screens/holiday/apply-holiday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/CommanTextField.dart';
import '../../common/utils/Styles.dart';
import '../../common/utils/color_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';
import '../common/ticket-details.dart';

class DsrScreen extends StatefulWidget {
  const DsrScreen({super.key});

  @override
  State<DsrScreen> createState() => _DsrScreenState();
}

class _DsrScreenState extends State<DsrScreen> {
  int selectedOption = 1;
  String _partStatus = 'returned';

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
                          AppConstants.dsr,
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
              padding: EdgeInsets.all(15.0.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Call Id-",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text("#03s5468",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      Spacer(),
                      Text(
                        "22-05-2023 12 : 30 pm",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Utils.addGap(5),
                  Text(
                    "102, Shivam Complex,Nana Bazaar,Vallabh Vidyanagar,Anand,Gujarat \n388120",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                  Utils.addGap(5),
                  Container(
                    height: 1.sp,
                    color: Colors.black87,
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service employee Id No.",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service employee Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Society Code",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Society Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Employee Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Employee Number",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Place",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Call",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From Place",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kilometers",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chairman Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Secretary Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Taluka",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "District",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Issue",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Solutions",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 90.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  maxlines: null,
                                  minlines: 2,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Status",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Problem Part Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Machine Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Module/Serial Number",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Problem Details",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  maxlines: null,
                                  minlines: 2,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Solution Details",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  maxlines: null,
                                  minlines: 2,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remark",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 90.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  maxlines: null,
                                  minlines: 2,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //
                  //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [Text("Defective Part Return to society"),
                  //       Row(mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           // Radio(
                  //           //   value: 'returned',
                  //           //   groupValue: _partStatus,
                  //           //   onChanged: (value) {
                  //           //     setState(() {
                  //           //       _partStatus = value!;
                  //           //     });
                  //           //   },
                  //           //   activeColor: Colors.green,
                  //           // ),
                  //           // Text('yes'),
                  //           // Radio(
                  //           //   value: 'not_returned',
                  //           //   groupValue: _partStatus,
                  //           //   onChanged: (value) {
                  //           //     setState(() {
                  //           //       _partStatus = value!;
                  //           //     });
                  //           //   },
                  //           //   activeColor: Colors.red,
                  //           // ),
                  //           // Text('no'),
                  //         ],
                  //       ),
                  //     ],),
                  //
                  //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [Text("Amount Recieved"),
                  //         Row(mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             // Radio(
                  //             //   value: 'returned',
                  //             //   groupValue: _partStatus,
                  //             //   onChanged: (value) {
                  //             //     setState(() {
                  //             //       _partStatus = value!;
                  //             //     });
                  //             //   },
                  //             //   activeColor: Colors.green,
                  //             // ),
                  //             // Text('yes'),
                  //             // Radio(
                  //             //   value: 'not_returned',
                  //             //   groupValue: _partStatus,
                  //             //   onChanged: (value) {
                  //             //     setState(() {
                  //             //       _partStatus = value!;
                  //             //     });
                  //             //   },
                  //             //   activeColor: Colors.red,
                  //             // ),
                  //             // Text('no'),
                  //           ],
                  //         ),
                  //       ],),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Defective Part Return to society",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 'returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'not_returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.red,
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Amount Recived",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 'returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'not_returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.red,
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Deduction Letter",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 'returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'not_returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.red,
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Modal Signal",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Online Status",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 'returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'not_returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.red,
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Online Weight",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Online Fat",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Electricity Issue",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 'returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'not_returned',
                                  groupValue: _partStatus,
                                  onChanged: (value) {
                                    setState(() {
                                      _partStatus = value!;
                                    });
                                  },
                                  activeColor: Colors.red,
                                ),
                                Text('No'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item details of society taken by engineer",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Over all action taken on society items",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Changed products/Stand by product given to society",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.multiline,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Engineer Name",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                      Utils.addHGap(8),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Society representative Name",
                              maxLines: 1,
                              overflow:
                              TextOverflow.ellipsis,
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.grayA5,
                                    width: 1.sp,
                                  ),
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: getTransparentTextFormField(
                                  validator: (String? value) {},
                                  isObscureText: false,
                                  hintText: "",
                                  inputType: TextInputType.text,
                                  onChanged: (String value) {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Utils.addGap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedButton(
                        buttonText: 'Submit & Save',
                        width: width / 2,
                        onpressed: () {
                          Get.offAllNamed(Routes.home);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
