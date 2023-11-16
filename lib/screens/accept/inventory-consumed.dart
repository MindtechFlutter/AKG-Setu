import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/CommanTextField.dart';
import '../../common/controller/inventory-consumed_controller.dart';
import '../../common/rounded_button.dart';
import '../../common/routes/app_pages.dart';
import '../../common/utils/color_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';
import '../home/dsr_screen.dart';

class InventoryConsumed extends StatefulWidget {
  InventoryConsumed({super.key});

  @override
  State<InventoryConsumed> createState() => _InventoryConsumedState();
}

class _InventoryConsumedState extends State<InventoryConsumed> {
  final InventoryConsumedController inventoryCont =
      Get.put((InventoryConsumedController()));

  Widget statusContainer(RxBool val, IconData icon, String text, Color color) {
    return InkWell(
      onTap: () => {
        inventoryCont.isComplete.value = false,
        inventoryCont.isPartial.value = false,
        inventoryCont.isPending.value = false,
        val.value = !val.value,
      },
      child: Container(
        height: height(context) * 0.06,
        width: width(context) * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: val.value ? color : color.withOpacity(0.3),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  icon,
                  color: val.value ? Colors.white : color,
                ),
              ),
            ),
            6.width,
            Expanded(
              flex: 6,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: val.value ? Colors.white : Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showServiceStatus() {
    showDialog(
        context: context,
        builder: (context) {
          return Obx(() => Dialog(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: height(context) * 0.49,
                width: width(context) * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "Service Status",
                          style: TextStyle(fontSize: 19),
                        ),
                        Container(
                          height: 2,
                          width: width(context) * 0.35,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    Utils.addGap(15),
                    Text(
                      "Select and update your status",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    Utils.addGap(15),
                    statusContainer(inventoryCont.isComplete,
                        FontAwesomeIcons.circleCheck, "Complete", Colors.green),
                    Utils.addGap(10),
                    statusContainer(inventoryCont.isPending,
                        FontAwesomeIcons.ggCircle, "Pending", Colors.redAccent),
                    Utils.addGap(10),
                    statusContainer(
                        inventoryCont.isPartial,
                        FontAwesomeIcons.exclamation,
                        "Partially Done",
                        Colors.amber.shade800),
                    Padding(
                        padding: EdgeInsets.only(top: 35.sp),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.to(DsrScreen(), transition: Transition.fadeIn);
                          },
                          child: Container(
                            width: width(context) * 0.4,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.maroon),
                            child: Center(
                              child: Text(
                                "Save & update",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              )));
        });
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
                          "Inventory Consumed",
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
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Ticket No - #03s5468",
                    style: TextStyle(fontSize: 19, color: Colors.black87),
                  ),
                  Spacer(),
                  Text("22-05-2023"),
                ],
              ),
            ),
            Utils.addGap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Inventory Consumed",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            Utils.addGap(5),
            GestureDetector(
              onTap: (){
                int dialogActivePageIndex = 0;
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                        child: StatefulBuilder(builder: (context, DialogState) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                height: height / 1.5,
                                /*  height: height /1.5,
                        width: width * 0.8,*/
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.0),
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
                                    "Inventory Request",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.blueAccent,
                                    height: 1,
                                    width: width / 2.7,
                                    child: Container(),
                                  ),
                                  Utils.addGap(40),
                                  Container(
                                    width: width * 0.9,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFE0E0E0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: InkWell(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                            onTap: _onFirstButtonDialog,
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                              alignment: Alignment.center,
                                              height: 40,
                                              decoration: (dialogActivePageIndex == 0)
                                                  ? const BoxDecoration(
                                                color: AppColors.darkblue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                              )
                                                  : null,
                                              child: Text(
                                                "Office",
                                                style: (dialogActivePageIndex == 0)
                                                    ? TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal)
                                                    : TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                            onTap: _onSecondButtonDialog,
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 40,
                                              padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                              alignment: Alignment.center,
                                              decoration: (dialogActivePageIndex == 1)
                                                  ? const BoxDecoration(
                                                color: AppColors.darkblue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                              )
                                                  : null,
                                              child: Text(
                                                "Colleagues",
                                                style: (dialogActivePageIndex == 1)
                                                    ? TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal)
                                                    : TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    dialogueBorderRadius)),
                                            onTap: _onThirdButtonDialog,
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width,
                                              height: 40,
                                              padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                              alignment: Alignment.center,
                                              decoration: (dialogActivePageIndex == 2)
                                                  ? const BoxDecoration(
                                                color: AppColors.darkblue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                              )
                                                  : null,
                                              child: Text(
                                                "Purchase",
                                                style: (dialogActivePageIndex == 2)
                                                    ? TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal)
                                                    : TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: PageView(
                                          controller: _dialogpageController,
                                          onPageChanged: (int i) {
                                            DialogState(() {
                                              dialogActivePageIndex = i;
                                            });
                                          },
                                          children: <Widget>[
                                            Container(
                                              width: width,
                                              // constraints: const BoxConstraints.expand(),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 4, vertical: 16),
                                                    child: Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                        width: width,
                                                        decoration: BoxDecoration(
                                                          /*  boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors.black53
                                                          .withOpacity(0.1),
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2.sp,
                                                      blurRadius: 5.0.sp)
                                                ],*/
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          border: Border.all(
                                                            color: AppColors.black44,
                                                            // Gray color for the border
                                                            width:
                                                            1.0, // Border width
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.search,
                                                              color: primaryColor,
                                                            ),
                                                            10.width,
                                                            Expanded(
                                                              child: TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    hintText:
                                                                    "Search"),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Utils.addHGap(10),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Item -1",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.black87,
                                                              )),
                                                          Text("Available -5",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                AppColors.green1,
                                                              )),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        height: 30.sp,
                                                        width: 30.sp,
                                                        padding: EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                            color: AppColors.darkblue,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(8),
                                                            )),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                      Container(
                                                          height: 30.sp,
                                                          width: 30.sp,
                                                          padding: EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child: Center(
                                                            child: Text(
                                                              "1",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                  AppColors.black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                            ),
                                                          )

                                                        /*getTransparentTextFormField(
                                                                                    validator: (String? value) {},
                                                                                    isObscureText: false,
                                                                                    hintText: "",
                                                                                    inputType: TextInputType.number,
                                                                                    onChanged: (String value) {}),*/
                                                      ),
                                                      Utils.addHGap(10),
                                                      Container(
                                                        height: 30.sp,
                                                        width: 30.sp,
                                                        padding: EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                            color: AppColors.darkblue,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(8),
                                                            )),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: width,
                                              child: Column(
                                                children: [
                                                  Utils.addGap(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text("From: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          )),
                                                      Utils.addHGap(10),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40.sp,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child:
                                                          getTransparentTextFormField(
                                                              validator: (String?
                                                              value) {},
                                                              isObscureText:
                                                              false,
                                                              hintText:
                                                              "Pravin Kumar",
                                                              inputType:
                                                              TextInputType
                                                                  .text,
                                                              onChanged: (String
                                                              value) {}),
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                    ],
                                                  ),
                                                  // Utils.addGap(10),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 4, vertical: 16),
                                                    child: Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                        width: width,
                                                        decoration: BoxDecoration(
                                                          /*  boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors.black53
                                                          .withOpacity(0.1),
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2.sp,
                                                      blurRadius: 5.0.sp)
                                                ],*/
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          border: Border.all(
                                                            color: AppColors.black44,
                                                            // Gray color for the border
                                                            width:
                                                            1.0, // Border width
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.search,
                                                              color: primaryColor,
                                                            ),
                                                            10.width,
                                                            Expanded(
                                                              child: TextFormField(
                                                                decoration:
                                                                InputDecoration(
                                                                    border:
                                                                    InputBorder
                                                                        .none,
                                                                    hintText:
                                                                    "Search"),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Utils.addHGap(10),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Item -1",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.black87,
                                                              )),
                                                          Text("Available -5",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                AppColors.green1,
                                                              )),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        height: 30.sp,
                                                        width: 30.sp,
                                                        padding: EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                            color: AppColors.darkblue,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(8),
                                                            )),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                      Container(
                                                          height: 30.sp,
                                                          width: 30.sp,
                                                          padding: EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child: Center(
                                                            child: Text(
                                                              "1",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                  AppColors.black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                            ),
                                                          )

                                                        /*getTransparentTextFormField(
                                                                                    validator: (String? value) {},
                                                                                    isObscureText: false,
                                                                                    hintText: "",
                                                                                    inputType: TextInputType.number,
                                                                                    onChanged: (String value) {}),*/
                                                      ),
                                                      Utils.addHGap(10),
                                                      Container(
                                                        height: 30.sp,
                                                        width: 30.sp,
                                                        padding: EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                            color: AppColors.darkblue,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(8),
                                                            )),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                width: width,
                                                child: Column(children: [
                                                  Utils.addGap(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text("From: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          )),
                                                      Utils.addHGap(10),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40.sp,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child:
                                                          getTransparentTextFormField(
                                                              validator: (String?
                                                              value) {},
                                                              isObscureText:
                                                              false,
                                                              hintText: "",
                                                              inputType:
                                                              TextInputType
                                                                  .text,
                                                              onChanged: (String
                                                              value) {}),
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                    ],
                                                  ),
                                                  Utils.addGap(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text("Items: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          )),
                                                      Utils.addHGap(10),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40.sp,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child:
                                                          getTransparentTextFormField(
                                                              validator: (String?
                                                              value) {},
                                                              isObscureText:
                                                              false,
                                                              hintText: "",
                                                              inputType:
                                                              TextInputType
                                                                  .text,
                                                              onChanged: (String
                                                              value) {}),
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                    ],
                                                  ),
                                                  Utils.addGap(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text("Qty: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          )),
                                                      Utils.addHGap(5),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40.sp,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child:
                                                          getTransparentTextFormField(
                                                              validator: (String?
                                                              value) {},
                                                              isObscureText:
                                                              false,
                                                              hintText: "",
                                                              inputType:
                                                              TextInputType
                                                                  .text,
                                                              onChanged: (String
                                                              value) {}),
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                      Text("Amount: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          )),
                                                      Utils.addHGap(5),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40.sp,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child:
                                                          getTransparentTextFormField(
                                                              validator: (String?
                                                              value) {},
                                                              isObscureText:
                                                              false,
                                                              hintText: "",
                                                              inputType:
                                                              TextInputType
                                                                  .text,
                                                              onChanged: (String
                                                              value) {}),
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                    ],
                                                  ),
                                                  Utils.addGap(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text("Approved by: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          )),
                                                      Utils.addHGap(10),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40.sp,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: Colors.black,
                                                                width: 1.sp,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.sp)),
                                                          child:
                                                          getTransparentTextFormField(
                                                              validator: (String?
                                                              value) {},
                                                              isObscureText:
                                                              false,
                                                              hintText: "",
                                                              inputType:
                                                              TextInputType
                                                                  .text,
                                                              onChanged: (String
                                                              value) {}),
                                                        ),
                                                      ),
                                                      Utils.addHGap(10),
                                                    ],
                                                  ),
                                                ])),
                                          ])),
                                  Utils.addGap(10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width: width / 3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.maroon),
                                          child: Center(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      10.width,
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            width: width / 3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: AppColors.green1),
                                            child: Center(
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Utils.addGap(20),
                                ])),
                          );
                        })));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Inventory 1",
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 17),
                ),
              ),
            ),
            Utils.addGap(10),
         /*   Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: RoundedButton(
                buttonText: 'Request New Inventory',
                width: width,
                onpressed: () {

                },
              ),
            ),*/
            Utils.addGap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Attach your files",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            Container(
                height: height / 8,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(color: Colors.grey.shade700, width: 1),
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
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 17),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: height / 19,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.blue.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("File Name"),
                  Text("File Size"),
                  Text("Action"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0.sp),
              child: AcceptButton(
                buttonText: 'Checkout',
                width: width / 1.7,
                onpressed: () {
                  showServiceStatus();
                },
              ),
            )
          ],
        ));
  }
  PageController? _dialogpageController;
  @override
  void dispose() {
    _dialogpageController!.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _dialogpageController = PageController();
  }

  void _onFirstButtonDialog() {
    _dialogpageController?.jumpToPage(0);
    /*_pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);*/
  }

  void _onSecondButtonDialog() {
    _dialogpageController?.jumpToPage(1);
/*
      _pageController!.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
*/
  }

  void _onThirdButtonDialog() {
    _dialogpageController?.jumpToPage(2);
    /* _pageController!.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);*/
  }
}
