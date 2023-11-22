import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/CommanTextField.dart';
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
  String? selectedValue;
  DateTime? fromDate;
bool enabled=true;
  _showDatePicker(ctx, DateTime? date) async {
    date = await showRoundedDatePicker(
      styleDatePicker: MaterialRoundedDatePickerStyle(
          textStyleYearButton:
          const TextStyle(color: Colors.white, fontSize: 16),
          textStyleDayButton: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600)),
      theme: ThemeData(
        cardColor: primaryColor,
        primaryColor: primaryColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: createMaterialColor(primaryColor))
            .copyWith(background: primaryColor),
      ),
      context: context,
      height: height(context) * 0.4,
      barrierDismissible: false,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
      borderRadius: borderRadius,
    );
    setState(() {});
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
                        "Add Voucher",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Spacer(),
                      NavToProfile(),
                    ],
                  )),
            ),
          ),
          Utils.addGap(10),
       /*   Padding(
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
          ),*/
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
              vertical: 10.sp,
            ),
            child: Text(
              "Select your Expense and add releted attachment",
            ),
          ),
          Utils.addGap(10),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _showDatePicker(context, fromDate),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 45.sp,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Select Date"),
                          ),
                          Icon(
                            FontAwesomeIcons.calendar,
                            color: primaryColor,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Utils.addGap(5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Select Expenses',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: AppConstants.listExpenses
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          ),
   /*       Padding(
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
          ),*/
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
                  height: 40.sp,
                  width: 80.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child:  getTransparentTextFormField(
                      validator: (String? value) {
                      },
                      isObscureText: false,
                      enabled: enabled,
                      hintText: "",
                      length: 5,
                      maxlines: 1,
                      inputType: TextInputType.number,
                      onChanged: (String value) {
                      })/*(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: InputBorder.none),
                  ),*/
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Remarks  ",
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
          UploadButton(
            buttonText: "Choose file(s)",
            width: width / 2,
            onpressed: ()async {
                String? imagePath = await Utils.pickImageOrPDF();
                if (imagePath != null) {
                  print('Selected file path: $imagePath');
                  // Use the imagePath variable to access the selected file
                } else {
                  print('No file selected');
                }
            },
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
