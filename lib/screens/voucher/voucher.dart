import 'package:akgsetu/controller/vouchers_controller.dart';
import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/constants.dart';
import '../../utils/Styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';
import '../common/navToProfile.dart';
import '../common/ticket-details.dart';
import '../completed-task/add-expense.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  VouchersController vouchersController = VouchersController();
  bool isAll = true;
  bool isApproved = false;
  bool isPending = false;
  bool isRejected = false;

  getData() async {
    await vouchersController.voucherDetail();
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
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      10.width,
                      Text(
                        "Vouchers",
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                chipTab(
                  "All",
                  isAll,
                  () => setState(
                    () {
                      isApproved = false;
                      isAll = true;
                      isPending = false;
                      isRejected = false;
                    },
                  ),
                ),
                5.width,
                chipTab(
                  "Approved",
                  isApproved,
                  () => setState(
                    () {
                      isApproved = true;
                      isAll = false;
                      isPending = false;
                      isRejected = false;
                    },
                  ),
                ),
                5.width,
                chipTab(
                  "Pending",
                  isPending,
                  () => setState(
                    () {
                      isApproved = false;
                      isAll = false;
                      isPending = true;
                      isRejected = false;
                    },
                  ),
                ),
                5.width,
                chipTab(
                  "Rejected",
                  isRejected,
                  () => setState(
                    () {
                      isApproved = false;
                      isAll = false;
                      isPending = false;
                      isRejected = true;
                    },
                  ),
                ),
              ],
            ),
          ),
          Utils.addGap(30),
          Expanded(
            child: Obx(
              () => ModalProgressHUD(
                inAsyncCall: vouchersController.isLoading.value,
                child: ListView.builder(
                  padding: EdgeInsets.all(0.sp),
                  // separatorBuilder: (context, index) => Divider(height: 15.h),
                  itemCount: vouchersController.voucherDetailList.length,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      width: MediaQuery.of(context).size.width,
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
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Food Voucher",
                                  style: Styles.textFontRegular(
                                      size: 14.0.sp,
                                      weight: FontWeight.w500,
                                      color: AppColors.black),
                                ),
                                Spacer(),
                                Text(
                                  vouchersController.voucherDetailList[index]
                                          .voucherDate ??
                                      "",
                                  style: Styles.textFontRegular(
                                      size: 12.0.sp,
                                      weight: FontWeight.w400,
                                      color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                          Utils.addGap(10),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Ticket No - ${vouchersController.voucherDetailList[index].callIdNumber ?? ""}",
                                  style: Styles.textFontRegular(
                                      size: 12.0.sp,
                                      weight: FontWeight.w400,
                                      color: AppColors.grayA5),
                                ),
                                Spacer(),
                                Text(
                                  "INR ${vouchersController.voucherDetailList[index].amount ?? ""}",
                                  style: Styles.textFontRegular(
                                      size: 12.0.sp,
                                      weight: FontWeight.w400,
                                      color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                          Utils.addGap(2),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.paperclip,
                                  color: primaryColor,
                                  size: 15,
                                ),
                                Text(
                                  "  Attachment",
                                  style: Styles.textFontRegular(
                                      size: 12.0.sp,
                                      weight: FontWeight.w400,
                                      color: primaryColor),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.trash,
                                    size: 16,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    Utils.getDeleteDialog(
                                        context,
                                        ()=>
                                        vouchersController.voucherDelete(
                                            vouchersController
                                                    .voucherDetailList[index]
                                                    .id ??
                                                1));
                                    print(vouchersController
                                        .voucherDetailList[index].id);
                                  },
                                ),
                                Text(
                                  "Delete",
                                  style: Styles.textFontRegular(
                                      size: 11.0.sp,
                                      weight: FontWeight.w400,
                                      color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ),
                          Utils.addGap(9),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                                color: vouchersController
                                            .voucherDetailList[index]
                                            .approvalStatus ==
                                        "Pending"
                                    ? Colors.green.shade100
                                    : Colors.red.shade100,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            child: Center(
                              child: Text(
                                  vouchersController.voucherDetailList[index]
                                              .approvalStatus ==
                                          "Pending"
                                      ? "Pending"
                                      : "",
                                  style: vouchersController
                                              .voucherDetailList[index]
                                              .approvalStatus ==
                                          "Pending"
                                      ? TextStyle(color: Colors.green.shade800)
                                      : TextStyle(color: Colors.red.shade800)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          eccentricity: 0.9,
        ),
        backgroundColor: AppColors.pink,
        onPressed: () => Get.to(AddExpense(), transition: Transition.fadeIn),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  chipTab(String text, bool boolVar, Function()? onTap) {
    return Expanded(
        child: InkWell(
            onTap: onTap,
            child: Container(
              height: 35.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: boolVar ? AppColors.maroon : Colors.grey.shade400),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: boolVar ? Colors.white : Colors.grey.shade700,
                      fontSize: 17),
                ),
              ),
            )));
  }
}
