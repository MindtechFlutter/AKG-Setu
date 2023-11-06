import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/CommanTextField.dart';
import '../../common/utils/app_constants.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  PageController? _pageController;
  int activePageIndex = 0;
  var isExpanded = false.obs;
  PageController? _dialogpageController;

  @override
  void dispose() {
    _pageController!.dispose();
    _dialogpageController!.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _dialogpageController = PageController();

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
                          "Inventory",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Spacer(),
                                                 NavToProfile(),

                      ],
                    )),
              ),
            ),
            Utils.addGap(10),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _menuBar(context),
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (int i) {
                          setState(() {
                            activePageIndex = i;
                          });
                        },
                        children: <Widget>[
                          Container(
                            width: width,
                            // constraints: const BoxConstraints.expand(),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(16.sp),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    width: width,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black53
                                                  .withOpacity(0.1),
                                              offset: Offset(0, 0),
                                              spreadRadius: 2.sp,
                                              blurRadius: 5.0.sp)
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: primaryColor,
                                        ),
                                        10.width,
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Search Item"),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    width: width,
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black53
                                                  .withOpacity(0.1),
                                              offset: Offset(0, 0),
                                              spreadRadius: 2.sp,
                                              blurRadius: 5.0.sp)
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Item -1",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Spacer(),
                                          Text("SKU-",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              )),
                                          Text(
                                            "#1234",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Utils.addGap(5),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Smit Parmar",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                              Text(
                                                "22-05-2023",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color:
                                              Colors.blue.withOpacity(0.3),
                                            ),
                                            // height: height / 19,

                                            // margin: EdgeInsets.symmetric(horizontal: 20),
                                            child: Row(
                                              children: [
                                                Text("Qty: ",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    )),
                                                Text("5",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ])),
                              ],
                            ),
                          ),
                          Container(
                            width: width,

                            // constraints: const BoxConstraints.expand(),
                            child: Obx(
                                    () {
                                  return Column(children: [
                                    Utils.addGap(20),
                                    GestureDetector(
                                      onTap: () {
                                        isExpanded.value = !isExpanded.value;
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: width,
                                          padding: EdgeInsets.all(12.sp),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors.black53
                                                        .withOpacity(0.1),
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 2.sp,
                                                    blurRadius: 5.0.sp)
                                              ],
                                              color: Colors.white,
                                              borderRadius: BorderRadius
                                                  .circular(15)),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text("From: ",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    )),

                                                Text("Pradip Kumar",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                    )),
                                                Spacer(),
                                                Text("22-05-2023",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black54,
                                                    )),
                                              ],
                                            ),
                                            Utils.addGap(5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text("5 Items ",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                    )),
                                                Spacer(),
                                                Text("Total Qty : 18",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                    )),

                                              ],
                                            ),
                                            Utils.addGap(10),
                                            Visibility(
                                              visible: isExpanded.value,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    height: height / 19,
                                                    width: width,
                                                    color: Colors.blue
                                                        .withOpacity(0.3),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text("Item name"),
                                                        Text("SKU No"),
                                                        Text("Qty"),
                                                      ],
                                                    ),
                                                  ),
                                                  Utils.addGap(2),
                                                  Container(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    height: height / 19,
                                                    width: width,
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text("Item-1"),
                                                        Text("#1234"),
                                                        Text("4"),
                                                      ],
                                                    ),
                                                  ),
                                                  Utils.addGap(2),
                                                  Container(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    height: height / 19,
                                                    width: width,
                                                    color: Colors.white,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text("Item-2"),
                                                        Text("#1234"),
                                                        Text("1"),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ])),
                                    )
                                  ]);
                                }
                            ),
                          ),
                          Container(
                            width: width,
                            //  constraints: const BoxConstraints.expand(),
                            child: Column(
                              children: [
                                Utils.addGap(20),
                                Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    width: width,
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black53
                                                  .withOpacity(0.1),
                                              offset: Offset(0, 0),
                                              spreadRadius: 2.sp,
                                              blurRadius: 5.0.sp)
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: 8.0,right: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Item -1",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text("SKU-",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    )),
                                                Text(
                                                  "#1234",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Utils.addGap(5),
                                          Row(
                                            children: [
                                              Text("Requested :",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  )),
                                              Text(
                                                "Pradip kumar",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "22-05-2023",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                          Utils.addGap(10),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                      context) =>
                                                          Dialog(
                                                            child:
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                                color: Colors.white,
                                                              ),
                                                              // height: height /2,
                                                              width: width * 0.8,
                                                                child: Padding(
                                                                  padding:  EdgeInsets.all(12.0.sp),
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Padding(
                                                                            padding:  EdgeInsets.all(16.0),
                                                                            child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                              GestureDetector(
                                                                                onTap:(){
                                                                                  Navigator.of(context).pop();
                                                                                }
                                                                                ,
                                                                                child: Icon(
                                                                                  Icons.cancel,
                                                                                  color: Colors.black54,
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                          ),
                                                                          Text(
                                                                            "Issued in",
                                                                            style: TextStyle(fontSize: 18, color: AppColors.black,
                                                                            ),),
                                                                            Container(
                                                                              color: Colors.blueAccent,
                                                                              height: 1,
                                                                              width: width/5,
                                                                              child: Container(),
                                                                            ),
                                                                          Utils.addGap(40),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("Pradip kumar",
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        color: Colors.black,
                                                                                      )),
                                                                                  Text(
                                                                                    "Item-1",
                                                                                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Container(
                                                                                padding: EdgeInsets.all(8.sp),
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  color: Colors.blue.withOpacity(0.3),
                                                                                ),
                                                                                // height: height / 19,

                                                                                // margin: EdgeInsets.symmetric(horizontal: 20),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text("Qty: ",
                                                                                        style: TextStyle(
                                                                                          fontSize: 14,
                                                                                          color: Colors.grey,
                                                                                        )),
                                                                                    Text("5",
                                                                                        style: TextStyle(
                                                                                          fontSize: 14,
                                                                                          color: Colors.black87,
                                                                                        )),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Utils.addGap(
                                                                              10),
                                                                          Container(
                                                                            color: Colors.black45,
                                                                            height: 1,
                                                                            width: width-40,
                                                                            child: Container(),
                                                                          ),
                                                                          Utils.addGap(20),
                                                                          Text(
                                                                            "Available - 10",
                                                                            style: TextStyle(fontSize: 16, color: AppColors.black,fontWeight: FontWeight.normal
                                                                            ),),
                                                                          Utils.addGap(
                                                                              20),
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              height: 40.sp,
                                                                              width: 40.sp,
                                                                              padding:EdgeInsets.all(8),
                                                                              decoration: BoxDecoration(
                                                                                color:AppColors.darkblue,
                                                                                borderRadius: BorderRadius.all(Radius.circular(10),
                                                                                )
                                                                              ),
                                                                              child: Icon(Icons.add,color: AppColors.white,
                                                                              size: 30, ),
                                                                            ),
                                                                            Utils.addHGap(10),
                                                                            Container(
                                                                              height: 40.sp,

                                                                              width: MediaQuery.of(context).size.width/4,
                                                                              decoration: BoxDecoration(
                                                                                  border: Border.all(
                                                                                    color: Colors.black,
                                                                                    width: 1.sp,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(10.sp)),
                                                                              child:Center(
                                                                                child: Text(
                                                                                  "1",
                                                                                 style: TextStyle(fontSize: 18, color: AppColors.black,fontWeight: FontWeight.normal
                                                                                  ),
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
                                                                              height: 40.sp,
                                                                              width: 40.sp,
                                                                              padding:EdgeInsets.all(8),
                                                                              decoration: BoxDecoration(
                                                                                  color:AppColors.darkblue,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10),
                                                                                  )
                                                                              ),
                                                                              child: Icon(Icons.remove,color: AppColors.white,
                                                                                size: 30, ),
                                                                            ),


                                                                          ],
                                                                          ),
                                                                          Utils.addGap(50),
                                                                          Container(
                                                                            width: width/3,
                                                                            height: 40.sp,
                                                                            padding:
                                                                            EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                color: AppColors.maroon),
                                                                            child: Center(
                                                                              child: Text(
                                                                                "Issue",
                                                                                style: TextStyle(
                                                                                  fontSize: 14,
                                                                                  color: AppColors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Utils.addGap(20),

                                                                        ],
                                                                      ),
                                                                ),
                                                                  ),
                                                                ));
                                                  },
                                                  child: Container(
                                                    width: width / 3,
                                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical:8),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: AppColors.green1),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.only(left:20.0,right: 20.0),
                                                          child: Text(
                                                            "Issue",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .white,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              Spacer(),
                                              Container(
                                                padding: EdgeInsets.all(8.sp),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  color:
                                                  Colors.blue.withOpacity(0.3),
                                                ),
                                                // height: height / 19,

                                                // margin: EdgeInsets.symmetric(horizontal: 20),
                                                child: Row(
                                                  children: [
                                                    Text("Qty: ",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey,
                                                        )),
                                                    Text("5",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black87,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          eccentricity: 0.9,
        ),
        backgroundColor: AppColors.pink,
        onPressed: () {

          int dialogActivePageIndex = 0;

          showDialog(
            context: context,
            builder: (BuildContext
            context) => Dialog(

                  child:

                  StatefulBuilder(builder: (context, DialogState) {

                    return GestureDetector(
                    onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                    
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            height: height /1.5,
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
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        onTap: (){

                                        },
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          alignment: Alignment.center,
                                          height: 40,
                                          decoration: (dialogActivePageIndex == 0)
                                              ? const BoxDecoration(
                                            color: AppColors.darkblue,
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                          )
                                              : null,
                                          child: Text(
                                            "Office",
                                            style: (dialogActivePageIndex == 0)
                                                ? TextStyle(color: Colors.white,fontWeight: FontWeight.normal)
                                                : TextStyle(color: Colors.black54,fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        onTap: _onSecondButton,
                                        child: Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,height: 40,
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          alignment: Alignment.center,
                                          decoration: (dialogActivePageIndex == 1)
                                              ? const BoxDecoration(
                                            color: AppColors.darkblue,
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                          )
                                              : null,
                                          child: Text(
                                            "Colleagues",
                                            style: (dialogActivePageIndex == 1)
                                                ? TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.normal)
                                                : TextStyle(
                                                color: Colors.black54, fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(dialogueBorderRadius)),
                                        onTap: _onThirdButton,
                                        child: Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          height: 40,
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          alignment: Alignment.center,
                                          decoration: (dialogActivePageIndex == 2)
                                              ? const BoxDecoration(
                                            color: AppColors.darkblue,
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                          )
                                              : null,
                                          child: Text(
                                            "Purchase",
                                            style: (dialogActivePageIndex == 2)
                                                ? TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.normal)
                                                : TextStyle(
                                                color: Colors.black54, fontWeight: FontWeight.normal),
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
                                        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 16),
                                        child: Container(
                                            padding:
                                            EdgeInsets.symmetric(horizontal: 10),
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
                                              BorderRadius.circular(5),
                                              border: Border.all(
                                                color: AppColors.black44, // Gray color for the border
                                                width: 1.0, // Border width
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
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: "Search"),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Utils.addHGap(10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Item -1",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black87,
                                                  )),
                                              Text("Available -5",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors.green1,
                                                  )),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 30.sp,
                                            width: 30.sp,
                                            padding:EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color:AppColors.darkblue,
                                                borderRadius: BorderRadius.all(Radius.circular(8),
                                                )
                                            ),
                                            child: Icon(Icons.add,color: AppColors.white,
                                              size: 10, ),
                                          ),
                                          Utils.addHGap(10),
                                          Container(
                                              height: 30.sp,
                                              width: 30.sp,
                                              padding:EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.sp,
                                                  ),
                                                  borderRadius: BorderRadius.circular(5.sp)),
                                              child:Center(
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(fontSize: 14, color: AppColors.black,fontWeight: FontWeight.normal
                                                  ),
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
                                            padding:EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color:AppColors.darkblue,
                                                borderRadius: BorderRadius.all(Radius.circular(8),
                                                )
                                            ),
                                            child: Icon(Icons.remove,color: AppColors.white,
                                              size: 10, ),
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
                                        mainAxisAlignment: MainAxisAlignment.start,
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
                                                  borderRadius: BorderRadius.circular(5.sp)),
                                              child:getTransparentTextFormField(
                                                    validator: (String? value) {},
                                                    isObscureText: false,
                                                    hintText: "Pravin Kumar",
                                                    inputType: TextInputType.text,
                                                    onChanged: (String value) {}),
                                              
                                            ),
                                          ),
                                          Utils.addHGap(10),
                                        ],
                                      ),
                                      // Utils.addGap(10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 16),
                                        child: Container(
                                            padding:
                                            EdgeInsets.symmetric(horizontal: 10),
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
                                                BorderRadius.circular(5),
                                              border: Border.all(
                                                color: AppColors.black44, // Gray color for the border
                                                width: 1.0, // Border width
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
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: "Search"),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Utils.addHGap(10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Item -1",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black87,
                                                  )),
                                              Text("Available -5",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors.green1,
                                                  )),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 30.sp,
                                            width: 30.sp,
                                            padding:EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color:AppColors.darkblue,
                                                borderRadius: BorderRadius.all(Radius.circular(8),
                                                )
                                            ),
                                            child: Icon(Icons.add,color: AppColors.white,
                                              size: 10, ),
                                          ),
                                          Utils.addHGap(10),
                                          Container(
                                              height: 30.sp,
                                              width: 30.sp,
                                              padding:EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.sp,
                                                  ),
                                                  borderRadius: BorderRadius.circular(5.sp)),
                                              child:Center(
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(fontSize: 14, color: AppColors.black,fontWeight: FontWeight.normal
                                                  ),
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
                                            padding:EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color:AppColors.darkblue,
                                                borderRadius: BorderRadius.all(Radius.circular(8),
                                                )
                                            ),
                                            child: Icon(Icons.remove,color: AppColors.white,
                                              size: 10, ),
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
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                      borderRadius: BorderRadius.circular(5.sp)),
                                                  child: getTransparentTextFormField(
                                                        validator: (String? value) {},
                                                        isObscureText: false,
                                                        hintText: "",
                                                        inputType: TextInputType.text,
                                                        onChanged: (String value) {}),
                                                  
                                                ),
                                              ),
                                              Utils.addHGap(10),

                                            ],
                                          ),
                                          Utils.addGap(10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                      borderRadius: BorderRadius.circular(5.sp)),
                                                  child:  getTransparentTextFormField(
                                                        validator: (String? value) {},
                                                        isObscureText: false,
                                                        hintText: "",
                                                        inputType: TextInputType.text,
                                                        onChanged: (String value) {}),
                                                  ),
                                              
                                              ),
                                              Utils.addHGap(10),

                                            ],
                                          ),

                                          Utils.addGap(10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                      borderRadius: BorderRadius.circular(5.sp)),
                                                  child:  getTransparentTextFormField(
                                                        validator: (String? value) {},
                                                        isObscureText: false,
                                                        hintText: "",
                                                        inputType: TextInputType.text,
                                                        onChanged: (String value) {}),
                                                
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
                                                      borderRadius: BorderRadius.circular(5.sp)),
                                                  child: getTransparentTextFormField(
                                                        validator: (String? value) {},
                                                        isObscureText: false,
                                                        hintText: "",
                                                        inputType: TextInputType.text,
                                                        onChanged: (String value) {}),
                                                  ),
                                                ),
                                            
                                              Utils.addHGap(10),
                                            ],
                                          ),
                                          Utils.addGap(10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                      borderRadius: BorderRadius.circular(5.sp)),
                                                  child: getTransparentTextFormField(
                                                        validator: (String? value) {},
                                                        isObscureText: false,
                                                        hintText: "",
                                                        inputType: TextInputType.text,
                                                        onChanged: (String value) {}),
                                                  
                                                ),
                                              ),
                                              Utils.addHGap(10),

                                            ],
                                          ),

                                        ])
                                ),

                              ])),
                              Utils.addGap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding:
                                      EdgeInsets.all(10),
                                      width: width/3,
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
                                      },
                                      child: Container(
                                        padding:
                                        EdgeInsets.all(10),
                                        width: width/3,

                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
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
                        }
                      )));
        },
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      width: width(context) * 0.9,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0XFFE0E0E0),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onFirstButton,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 0)
                    ? const BoxDecoration(
                  color: AppColors.maroon,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                )
                    : null,
                child: Text(
                  "In Stock",
                  style: (activePageIndex == 0)
                      ? TextStyle(color: Colors.white)
                      : TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onSecondButton,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 1)
                    ? const BoxDecoration(
                  color: AppColors.maroon,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                )
                    : null,
                child: Text(
                  "To Issue",
                  style: (activePageIndex == 1)
                      ? TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                      : TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onThirdButton,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: (activePageIndex == 2)
                    ? const BoxDecoration(
                  color: AppColors.maroon,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                )
                    : null,
                child: Text(
                  "Buy Now",
                  style: (activePageIndex == 2)
                      ? TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)
                      : TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onFirstButton() {
    /* _pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);*/
  }

  void _onSecondButton() {
    /*  _pageController!.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);*/
  }

  void _onThirdButton() {
    /*_pageController!.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);*/
  }
}
