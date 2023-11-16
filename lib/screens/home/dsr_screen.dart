import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/screens/holiday/apply-holiday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/CommanTextField.dart';
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
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Call Id-",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Text("#03s5468",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      Spacer(),
                      Text(
                        "22-05-2023 12 : 30 pm",
                        style: TextStyle(
                            fontSize: 14,
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
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
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
                      Utils.addHGap(5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service employee Name",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              height: 50.sp,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
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
                ],
              ),
            ),
          ]),
    );
  }
}
