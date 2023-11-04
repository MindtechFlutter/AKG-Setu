import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage>{

  PageController? _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                 _menuBar(context),
                  
                  Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int i) {
                        setState(() {
                          activePageIndex = i;
                        });
                      },
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Column(children: [
                              Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.black53.withOpacity(0.1),
                    offset: Offset(0, 0),
                    spreadRadius: 2.sp,
                    blurRadius: 5.0.sp)
              ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                          ],),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Center(child: Text("Requested"),),
                        ),
                          ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Center(child: Text("To Issue "),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
       ] ));
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      width: width(context) * 0.9,
      height: 50.0,
      decoration:  BoxDecoration(
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
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 0) ? const BoxDecoration(
                    color: AppColors.maroon,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ) : null,
                  child: Text(
                    "In Stock",
                    style: (activePageIndex == 0) ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _onSecondButton,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 1) ? const BoxDecoration(
                    color: AppColors.maroon,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ) : null,
                  child: Text(
                    "To Issue",
                    style: (activePageIndex == 1) ? TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
              Expanded(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _onThirdButton,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 2) ? const BoxDecoration(
                    color: AppColors.maroon,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ) : null,
                  child: Text(
                    "Buy Now",
                    style: (activePageIndex == 2) ? TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  void _onFirstButton() {
    _pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSecondButton() {
    _pageController!.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
   void _onThirdButton() {
    _pageController!.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
                
   
       
  
}