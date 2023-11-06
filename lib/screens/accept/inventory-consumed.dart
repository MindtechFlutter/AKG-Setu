import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/controller/inventory-consumed_controller.dart';
import '../../common/rounded_button.dart';
import '../../common/routes/app_pages.dart';
import '../../common/utils/color_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';

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
            Icon(
              icon,
              color: val.value ? Colors.white : color,
            ),
            10.width,
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: val.value ? Colors.white : Colors.black,
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
                            Get.to(Dashboard(), transition: Transition.fadeIn);
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
            Container(
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
            Utils.addGap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: RoundedButton(
                buttonText: 'Request New Inventory',
                width: width,
                onpressed: () {
                  // Get.toNamed(Routes.otpVerify);
                },
              ),
            ),
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
}
