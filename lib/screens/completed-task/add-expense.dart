import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/rounded_button.dart';
import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  bool isFood = true;
  bool isTravel = false;
  bool isOthers = false;
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
                        "Completed Task",
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
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
              vertical: 10.sp,
            ),
            child: Text(
              "Select your Expense and add releted attachment",
            ),
          ),
          Utils.addGap(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Checkbox(
                  value: isFood,
                  onChanged: (val) {
                    setState(() {
                      isFood = true;
                      isTravel = false;
                      isOthers = false;
                    });
                  },
                ),
                Text(
                  "Food",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                Spacer(),
                Checkbox(
                    value: isTravel,
                    onChanged: (val) {
                      setState(() {
                        isFood = false;
                        isTravel = true;
                        isOthers = false;
                      });
                    }),
                Text(
                  "Travel",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                Spacer(),
                Checkbox(
                    value: isOthers,
                    onChanged: (val) {
                      setState(() {
                        isFood = false;
                        isTravel = false;
                        isOthers = true;
                      });
                    }),
                Text(
                  "Other",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                Spacer()
              ],
            ),
          ),
          Utils.addGap(10),
          Padding(
            padding: EdgeInsets.only(right: 25.sp, bottom: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Rs",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),
                10.width,
                Container(
                  height: 35.sp,
                  width: 80.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Comments",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
          ),
          Utils.addGap(5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            height: 100,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Utils.addGap(20),
          AcceptButton(
            buttonText: "Choose file(s)",
            width: width / 2,
            onpressed: () {},
          ),
          Utils.addGap(20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width / 2.9),
            height: height / 7,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 3.sp),
                    child: Icon(
                      Icons.close,
                      color: AppColors.maroon,
                    ),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.image,
                  color: primaryColor,
                  size: height / 18,
                ),
                Text(
                  "File name",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                Utils.addGap(2),
              ],
            ),
          ),
          Utils.addGap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 5.5),
            child: RoundedButton(
              buttonText: 'Submit',
              width: width,
              onpressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
