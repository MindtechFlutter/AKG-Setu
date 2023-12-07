import 'package:akgsetu/common/rounded_button.dart';
import 'package:akgsetu/network/model/problem_model.dart';
import 'package:akgsetu/screens/holiday/apply-holiday.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/CommanTextField.dart';

import '../../common/constants.dart';
import '../../routes/app_pages.dart';
import '../../utils/Styles.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';
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
  String selectedValueone = '';
  String selectedValuetwo = '';
  List<ProblemData> problemList = [
    ProblemData(
        error: "1.)SMPS  2.)Power Cable 3.)Ram 4.)Mother Board 5.)Harddisk",
        id: 23,
        problem: "CPU Problem",
        solution: ""),
    ProblemData(
        error: "1.)SMPS  2.)Power Cable 3.)Ram 4.)Mother Board 5.)Harddisk",
        id: 23,
        problem: "Motherboard Problem",
        solution: ""),
    ProblemData(
        error: "1.)SMPS  2.)Power Cable 3.)Ram 4.)Mother Board 5.)Harddisk",
        id: 23,
        problem: "Pata nahi Problem",
        solution: ""),
  ];

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
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Service employee Id No.",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(15),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Service employee Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Society Code",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Society Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Employee Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Employee Number",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Service Place",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Service Call",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "From Place",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Kilometers",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Chairman Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Secretary Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Taluka",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "District",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Issue",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           SizedBox(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Solutions",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 90.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 maxlines: null,
                  //                 minlines: 2,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Service Status",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Problem Part Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Machine Name",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Module/Serial Number",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Problem Details",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 maxlines: null,
                  //                 minlines: 2,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Solution Details",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 maxlines: null,
                  //                 minlines: 2,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Remark",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 90.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 maxlines: null,
                  //                 minlines: 2,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // // Row(
                  // //   mainAxisAlignment: MainAxisAlignment.start,
                  // //   children: [
                  // //
                  // //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // //       children: [Text("Defective Part Return to society"),
                  // //       Row(mainAxisAlignment: MainAxisAlignment.start,
                  // //         children: [
                  // //           // Radio(
                  // //           //   value: 'returned',
                  // //           //   groupValue: _partStatus,
                  // //           //   onChanged: (value) {
                  // //           //     setState(() {
                  // //           //       _partStatus = value!;
                  // //           //     });
                  // //           //   },
                  // //           //   activeColor: Colors.green,
                  // //           // ),
                  // //           // Text('yes'),
                  // //           // Radio(
                  // //           //   value: 'not_returned',
                  // //           //   groupValue: _partStatus,
                  // //           //   onChanged: (value) {
                  // //           //     setState(() {
                  // //           //       _partStatus = value!;
                  // //           //     });
                  // //           //   },
                  // //           //   activeColor: Colors.red,
                  // //           // ),
                  // //           // Text('no'),
                  // //         ],
                  // //       ),
                  // //     ],),
                  // //
                  // //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // //       children: [Text("Amount Recieved"),
                  // //         Row(mainAxisAlignment: MainAxisAlignment.start,
                  // //           children: [
                  // //             // Radio(
                  // //             //   value: 'returned',
                  // //             //   groupValue: _partStatus,
                  // //             //   onChanged: (value) {
                  // //             //     setState(() {
                  // //             //       _partStatus = value!;
                  // //             //     });
                  // //             //   },
                  // //             //   activeColor: Colors.green,
                  // //             // ),
                  // //             // Text('yes'),
                  // //             // Radio(
                  // //             //   value: 'not_returned',
                  // //             //   groupValue: _partStatus,
                  // //             //   onChanged: (value) {
                  // //             //     setState(() {
                  // //             //       _partStatus = value!;
                  // //             //     });
                  // //             //   },
                  // //             //   activeColor: Colors.red,
                  // //             // ),
                  // //             // Text('no'),
                  // //           ],
                  // //         ),
                  // //       ],),
                  // //   ],
                  // // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             textAlign: TextAlign.start,
                  //             "Defective Part Return to society",
                  //             style: TextStyle(
                  //                 fontSize: 10.sp,
                  //                 color: Colors.black87,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Radio(
                  //                 value: 'returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.green,
                  //               ),
                  //               Text('Yes'),
                  //               Radio(
                  //                 value: 'not_returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.red,
                  //               ),
                  //               Text('No'),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(2),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             textAlign: TextAlign.start,
                  //             "Amount Recived",
                  //             style: TextStyle(
                  //                 fontSize: 10.sp,
                  //                 color: Colors.black87,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Radio(
                  //                 value: 'returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.green,
                  //               ),
                  //               Text('Yes'),
                  //               Radio(
                  //                 value: 'not_returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.red,
                  //               ),
                  //               Text('No'),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             textAlign: TextAlign.start,
                  //             "Deduction Letter",
                  //             style: TextStyle(
                  //                 fontSize: 10.sp,
                  //                 color: Colors.black87,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Radio(
                  //                 value: 'returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.green,
                  //               ),
                  //               Text('Yes'),
                  //               Radio(
                  //                 value: 'not_returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.red,
                  //               ),
                  //               Text('No'),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(2),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Modal Signal",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             textAlign: TextAlign.start,
                  //             "Online Status",
                  //             style: TextStyle(
                  //                 fontSize: 10.sp,
                  //                 color: Colors.black87,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Radio(
                  //                 value: 'returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.green,
                  //               ),
                  //               Text('Yes'),
                  //               Radio(
                  //                 value: 'not_returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.red,
                  //               ),
                  //               Text('No'),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(2),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Online Weight",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Online Fat",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.text,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(12),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             textAlign: TextAlign.start,
                  //             "Electricity Issue",
                  //             style: TextStyle(
                  //                 fontSize: 10.sp,
                  //                 color: Colors.black87,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Radio(
                  //                 value: 'returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.green,
                  //               ),
                  //               Text('Yes'),
                  //               Radio(
                  //                 value: 'not_returned',
                  //                 groupValue: _partStatus,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     _partStatus = value!;
                  //                   });
                  //                 },
                  //                 activeColor: Colors.red,
                  //               ),
                  //               Text('No'),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Item details of society taken by engineer",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Over all action taken on society items",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Changed products/Stand by product given to society",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           Container(
                  //             height: 50.sp,
                  //             width: MediaQuery.of(context).size.width,
                  //             decoration: BoxDecoration(
                  //                 color: AppColors.white,
                  //                 border: Border.all(
                  //                   color: AppColors.grayA5,
                  //                   width: 1.sp,
                  //                 ),
                  //                 borderRadius: BorderRadius.circular(10.sp)),
                  //             child: getTransparentTextFormField(
                  //                 validator: (String? value) {},
                  //                 isObscureText: false,
                  //                 hintText: "",
                  //                 inputType: TextInputType.multiline,
                  //                 onChanged: (String value) {}),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Utils.addGap(15),
                  // Utils.addGap(15),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Problem Details",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           SizedBox(
                  //             height: 10.sp,
                  //           ),
                  //           Container(
                  //               height: 50.sp,
                  //               width: MediaQuery.of(context).size.width,
                  //               decoration: BoxDecoration(
                  //                   color: AppColors.white,
                  //                   border: Border.all(
                  //                     color: AppColors.grayA5,
                  //                     width: 1.sp,
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(10.sp)),
                  //               child: Padding(
                  //                 padding: EdgeInsets.only(left: 5),
                  //                 child: DropdownSearch<ProblemData>(
                  //                   popupProps:
                  //                       PopupProps.menu(showSearchBox: true),
                  //                   items: problemList,
                  //                   dropdownDecoratorProps:
                  //                       DropDownDecoratorProps(
                  //                     dropdownSearchDecoration: InputDecoration(
                  //                         border: InputBorder.none),
                  //                   ),
                  //                   onChanged: (value) {
                  //                     setState(() {
                  //                       // selectedValueone = value!;
                  //                     });
                  //                   },
                  //                   // selectedItem: selectedValueone,
                  //                 ),
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //     Expanded(
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Problem Details",
                  //             style: Styles.textFontRegular(
                  //                 size: 12.sp,
                  //                 color: Colors.black87,
                  //                 weight: FontWeight.w400),
                  //           ),
                  //           SizedBox(
                  //             height: 10.sp,
                  //           ),
                  //           Container(
                  //               height: 50.sp,
                  //               decoration: BoxDecoration(
                  //                   color: AppColors.white,
                  //                   border: Border.all(
                  //                     color: AppColors.grayA5,
                  //                     width: 1.sp,
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(10.sp)),
                  //               child: DropdownSearch<String>(
                  //                 popupProps: PopupProps.menu(
                  //                   showSearchBox: true,
                  //                 ),
                  //                 items: [
                  //                   "Apple",
                  //                   "Banana",
                  //                   "Orange",
                  //                   "Mango",
                  //                   "Grapefruit",
                  //                   "Apple",
                  //                   "Banana",
                  //                   "Orange",
                  //                   "Mango",
                  //                   "Grapefruit"
                  //                 ],
                  //                 dropdownDecoratorProps:
                  //                     DropDownDecoratorProps(
                  //                   dropdownSearchDecoration: InputDecoration(
                  //                       // labelText: "Menu mode",
                  //                       // hintText: "Type to Search",
                  //                       border: InputBorder.none),
                  //                 ),
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     selectedValuetwo = value!;
                  //                   });
                  //                 },
                  //                 selectedItem: selectedValuetwo,
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //     Utils.addHGap(8),
                  //   ],
                  // ),

                  Utils.addGap(15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Problem Details",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10.sp,
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
                              "Solution Details",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10.sp,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Inventory Used (Serial Number if available)",
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
                              "Received Status (Pending by default)",
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Unit Rate",
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
                              "GST",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Amount",
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
                              "Return Stock Details",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Return Stock Reason",
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
                              "Return Stock Quantity",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Return Stock Serial Number",
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
                              "Representative Name & Mobile Number",
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amount Received",
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
                              "Deduction Letter",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Online Status",
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
                              "Electricity Issue",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remarks",
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
                              "Call Status",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Attachment Type",
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
                              "Attachment(Max 1 MB for each)",
                              style: Styles.textFontRegular(
                                  size: 12.sp,
                                  color: Colors.black87,
                                  weight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () async {
                                String? imagePath =
                                    await Utils.pickImageOrPDF();

                                if (imagePath != null) {
                                  print('Selected file path: $imagePath');
                                  // Use the imagePath variable to access the selected file
                                } else {
                                  print('No file selected');
                                }
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: height / 8,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      border: Border.all(
                                          color: Colors.grey.shade700,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.upload,
                                        color: Colors.grey.shade800,
                                      ),
                                      5.height,
                                      Text(
                                        "Drag and Drop file",
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 17),
                                      ),
                                    ],
                                  )),
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
