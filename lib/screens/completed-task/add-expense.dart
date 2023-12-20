import 'dart:io';
import 'dart:math';

import 'package:akgsetu/controller/device_info_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_compressor/pdf_compressor.dart';
import '../../common/CommanTextField.dart';
import '../../common/constants.dart';
import '../../common/rounded_button.dart';
import '../../controller/expense_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_paths.dart';
import '../../utils/utility.dart';
import '../common/navToProfile.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  bool isFood = true;
  bool isTravel = false;
  bool isOthers = false;
  // String? selectedExpense;
  DateTime? fromDate;
  bool enabled = true;
  String? expense;
  String? modeOfTravel;
  // String? foodType;
  String? typeOfTravel;
  String? purposeOfvisit;
  String? finalResult;
  String _partStatus = '';
  String _billAmountStatus = '';
  String _serviceReportStatus = 'returned';

  String paymentType = 'Check';

  TextEditingController fromPlace = TextEditingController();
  TextEditingController toPlace = TextEditingController();
  TextEditingController totalKilometer = TextEditingController();
  TextEditingController ratePerKm = TextEditingController();
  TextEditingController ammount = TextEditingController();
  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random.secure();
  String? documentImagePath2;
  String? showImagePath;
  var imageQuality;
  var firstTime = true;
  // List<PlatformFile> selectedFiles = [];
  List<String?> selected = [];

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  //Controller instance
  ExpenseController expenseController = Get.put(ExpenseController());
  DeviceController deviceController = Get.put(DeviceController());

  Future<DateTime?> _showDatePicker(ctx, DateTime? date) async {
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
    return date;
  }

  Widget selectExpense() {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Select your Expense and add releted attachment",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
          Utils.addGap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  var date = await _showDatePicker(context, fromDate);
                  var dateString;
                  if (date != null) {
                    final formatter = DateFormat('dd/MM/yy');
                    final formattedDate = formatter.format(date);
                    dateString = formattedDate;
                  }
                  print(dateString);
                  expenseController.selectedDate.value =
                      dateString ?? "Select Date ";
                  // print(expenseController.selectedDate.value);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 45.sp,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        expenseController.selectedDate.value == ""
                            ? Expanded(
                                child: Text("Select Date"),
                              )
                            : Expanded(
                                child: Text(
                                    "${expenseController.selectedDate.value}"),
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
          Utils.addGap(5),
          Obx(
            () => Container(
              // margin: EdgeInsets.symmetric(horizontal: 20.sp),
              height: 50.sp,
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
                  value: expenseController.selectedExpense.value,
                  onChanged: (String? value) {
                    expenseController.selectedExpense.value = value;
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
          ),
          Obx(() => expenseController.selectedExpense.value == "Travel"
              ? travelExpense()
              : Container()),
          Obx(() => expenseController.selectedExpense.value == "Food"
              ? food()
              : Container()),
          Obx(() => expenseController.selectedExpense.value == "Lodge"
              ? lodge()
              : Container()),
          Obx(() => expenseController.selectedExpense.value == "Other"
              ? other()
              : Container()),
        ],
      ),
    );
  }

  Widget travelExpense() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.addGap(5),
          //mode of travel
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.sp),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Mode Of Travel ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: AppConstants.listModeOfTravel
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
                value: expenseController.selectedModeOfTravel.value,
                onChanged: (String? value) {
                  expenseController.selectedModeOfTravel.value = value;
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
          Utils.addGap(5),
          //from place
          Row(
            children: [
              Expanded(
                child: Container(
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
                      hintText: "From Place",
                      inputType: TextInputType.text,
                      onChanged: (String value) {}),
                ),
              ),
              Utils.addHGap(15),
              Expanded(
                child: Container(
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
                      hintText: "To Place",
                      inputType: TextInputType.text,
                      onChanged: (String value) {}),
                ),
              ),
            ],
          ),
          Utils.addGap(5),
          //Total km
          expenseController.selectedModeOfTravel.value == "Bike" ||
                  expenseController.selectedModeOfTravel.value == "Car"
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
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
                            hintText: "Total Kilometer",
                            inputType: TextInputType.number,
                            onChanged: (String value) {}),
                      ),
                    ),
                    Utils.addHGap(15),
                    Expanded(
                      child: Container(
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
                            hintText: "Rate Per/Km",
                            inputType: TextInputType.number,
                            onChanged: (String value) {}),
                      ),
                    ),
                  ],
                )
              : Container(),
          expenseController.selectedModeOfTravel.value == "Bike" ||
                  expenseController.selectedModeOfTravel.value == "Car"
              ? Utils.addGap(5)
              : Container(),
          //Enter Amount
          expenseController.selectedModeOfTravel.value == "Bike" ||
                  expenseController.selectedModeOfTravel.value == "Car"
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
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
                            hintText: "Enter Amount",
                            inputType: TextInputType.number,
                            onChanged: (String value) {}),
                      ),
                    ),
                  ],
                )
              : Container(),
          Utils.addGap(5),
          //petrol bill
          expenseController.selectedModeOfTravel.value == "Bike" ||
                  expenseController.selectedModeOfTravel.value == "Car"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Petrol Bill Amount?",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'returned',
                      groupValue: _billAmountStatus,
                      onChanged: (value) {
                        setState(() {
                          _billAmountStatus = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'not_returned',
                      groupValue: _billAmountStatus,
                      onChanged: (value) {
                        setState(() {
                          _billAmountStatus = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : Container(),
          expenseController.selectedModeOfTravel.value == "Bike"
              ? Utils.addGap(5)
              : Container(),
          //type of travel
          expenseController.selectedModeOfTravel.value == "Public Transport"
              ? Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20.sp),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Type Of Vehicle',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: AppConstants.listTypeofVehicle
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
                          value: expenseController.selectedVehicleType.value,
                          onChanged: (String? value) {
                            setState(() {
                              expenseController.selectedVehicleType.value =
                                  value;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Do you have a Ticket?",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        ),
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
                        Text(
                          'Yes',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        ),
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
                        Text(
                          'No',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
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
                                hintText: "Enter Amount",
                                inputType: TextInputType.text,
                                onChanged: (String value) {}),
                          ),
                        ),
                      ],
                    ),
                    Utils.addGap(5),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 20.sp),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Type Of Travel ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: AppConstants.listTypeOfTravel
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
                          value: expenseController.selectedTypeOfTravel.value,
                          onChanged: (String? value) {
                            setState(() {
                              expenseController.selectedTypeOfTravel.value =
                                  value;
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
                  ],
                )
              : Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Type Of Travel ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: AppConstants.listTypeOfTravel
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
                      value: expenseController.selectedTypeOfTravel.value,
                      onChanged: (String? value) {
                        setState(() {
                          expenseController.selectedTypeOfTravel.value = value;
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
          Utils.addGap(5),
          //purpose of travel
          expenseController.selectedTypeOfTravel.value == "Customer Site"
              ? Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Purpose ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: AppConstants.listPurposeOfvisit
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
                      value: expenseController.selectedPurposeOfVisit.value,
                      onChanged: (String? value) {
                        setState(() {
                          expenseController.selectedPurposeOfVisit.value =
                              value;
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
                )
              : Container(),
          Utils.addGap(5),
          //installing status
          expenseController.selectedPurposeOfVisit.value == "Installing"
              ? Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Installation Status',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: AppConstants.listInstallingStatus
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
                      value: expenseController.selectedInstallingStatus.value,
                      onChanged: (String? value) {
                        expenseController.selectedInstallingStatus.value =
                            value;
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
                )
              : expenseController.selectedPurposeOfVisit.value ==
                      "Payment Recovery"
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Recieved Payment?",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Radio(
                              value: 'Yes',
                              groupValue: expenseController.paymentStatus.value,
                              onChanged: (value) {
                                setState(() {
                                  expenseController.paymentStatus.value =
                                      value!;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                            Radio(
                              value: 'No',
                              groupValue: expenseController.paymentStatus.value,
                              onChanged: (value) {
                                setState(() {
                                  expenseController.paymentStatus.value =
                                      value!;
                                });
                              },
                              activeColor: Colors.red,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        expenseController.paymentStatus.value == "Yes" &&
                                expenseController
                                        .selectedPurposeOfVisit.value ==
                                    "Payment Recovery"
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Radio(
                                    value: 'Check',
                                    groupValue: paymentType,
                                    onChanged: (value) {
                                      setState(() {
                                        paymentType = value!;
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Text(
                                    'Check',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Radio(
                                    value: 'Cash',
                                    groupValue: paymentType,
                                    onChanged: (value) {
                                      setState(() {
                                        paymentType = value!;
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Radio(
                                    value: 'Deduction Letter',
                                    groupValue: paymentType,
                                    onChanged: (value) {
                                      setState(() {
                                        paymentType = value!;
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Text(
                                    'Deduction Letter',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            : Container(),
                        expenseController.paymentStatus.value == "Yes"
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.sp,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          border: Border.all(
                                            color: AppColors.grayA5,
                                            width: 1.sp,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.sp)),
                                      child: getTransparentTextFormField(
                                          validator: (String? value) {},
                                          isObscureText: false,
                                          hintText: "Enter Amount",
                                          inputType: TextInputType.text,
                                          onChanged: (String value) {}),
                                    ),
                                  ),
                                ],
                              )
                            : Container()
                      ],
                    )
                  : expenseController.selectedPurposeOfVisit.value == "Other"
                      ? Row(
                          children: [
                            Expanded(
                              child: Container(
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
                                    hintText: "Other Reason",
                                    inputType: TextInputType.text,
                                    onChanged: (String value) {}),
                              ),
                            ),
                          ],
                        )
                      : Container(),
          expenseController.selectedModeOfTravel.value == "Bike"
              ? Utils.addGap(5)
              : Container(),
          //service
          expenseController.selectedPurposeOfVisit.value == "ServiceCall"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Service Report?",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'returned',
                      groupValue: _serviceReportStatus,
                      onChanged: (value) {
                        setState(() {
                          _serviceReportStatus = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'not_returned',
                      groupValue: _serviceReportStatus,
                      onChanged: (value) {
                        setState(() {
                          _serviceReportStatus = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : Container(),
          //callid
          expenseController.selectedPurposeOfVisit.value == "ServiceCall"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Call ID Number?",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'Yes',
                      groupValue: expenseController.callIdStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.callIdStatus.value = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'No',
                      groupValue: expenseController.callIdStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.callIdStatus.value = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : Container(),
          expenseController.selectedModeOfTravel.value == "Bike"
              ? Utils.addGap(5)
              : Container(),
          //call Id Number

          expenseController.callIdStatus.value == "Yes" &&
                  expenseController.selectedPurposeOfVisit.value ==
                      "ServiceCall"
              ? Row(
                  children: [
                    Expanded(
                      child: Container(
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
                            hintText: "Enter CallId Number",
                            inputType: TextInputType.phone,
                            onChanged: (String value) {}),
                      ),
                    ),
                  ],
                )
              : Container(),

          expenseController.callIdStatus.value == "Yes" &&
                  expenseController.selectedPurposeOfVisit.value ==
                      "ServiceCall"
              ? Utils.addGap(5)
              : Container(),
          expenseController.selectedPurposeOfVisit.value == "ServiceCall"
              ? Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Call Status ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: AppConstants.listcallStatus
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
                      value: finalResult,
                      onChanged: (String? value) {
                        setState(() {
                          finalResult = value;
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
                )
              : Container(),
          expenseController.selectedModeOfTravel.value == "Bike"
              ? Utils.addGap(5)
              : Container()
        ],
      ),
    );
  }

  Widget food() {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.addGap(5),
          Obx(
            () => Container(
              // margin: EdgeInsets.symmetric(horizontal: 20.sp),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Food Type',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: AppConstants.listFoodType
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
                  value: expenseController.foodType.value,
                  onChanged: (String? value) {
                    setState(() {
                      expenseController.foodType.value = value;
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
          ),
          Utils.addGap(5),
          Row(
            children: [
              Expanded(
                child: Container(
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
                      hintText: "Enter Amount",
                      inputType: TextInputType.number,
                      onChanged: (String value) {}),
                ),
              ),
            ],
          ),
          Utils.addGap(5),
          Obx(() => expenseController.foodType.value == "Paid"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Lodge Bill?",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'returned',
                      groupValue: expenseController.foodStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.foodStatus.value = value!;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    Radio(
                      value: 'not_returned',
                      groupValue: expenseController.foodStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.foodStatus.value = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      'No',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : Utils.addGap(5)),
          Utils.addGap(5),
        ],
      ),
    );
  }

  Widget lodge() {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.addGap(5),
          Row(
            children: [
              Expanded(
                child: Container(
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
                      hintText: "Enter Amount",
                      inputType: TextInputType.number,
                      onChanged: (String value) {}),
                ),
              ),
            ],
          ),
          Utils.addGap(5),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  "Lodge Bill?",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
                Radio(
                  value: 'returned',
                  groupValue: expenseController.lodgeStatus.value,
                  onChanged: (value) {
                    setState(() {
                      expenseController.lodgeStatus.value = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
                Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
                Radio(
                  value: 'not_returned',
                  groupValue: expenseController.lodgeStatus.value,
                  onChanged: (value) {
                    setState(() {
                      expenseController.lodgeStatus.value = value!;
                    });
                  },
                  activeColor: Colors.red,
                ),
                Text(
                  'No',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Utils.addGap(5),
        ],
      ),
    );
  }

  Widget other() {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.addGap(5),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 80.sp,
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
                      maxlines: 3,
                      hintText: "Enter Description of Expense?",
                      inputType: TextInputType.text,
                      onChanged: (String value) {}),
                ),
              ),
            ],
          ),
          Utils.addGap(5),
          Row(
            children: [
              Expanded(
                child: Container(
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
                      hintText: "Enter Amount",
                      inputType: TextInputType.number,
                      onChanged: (String value) {}),
                ),
              ),
            ],
          ),
          Utils.addGap(5),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  "Bill?",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
                Radio(
                  value: 'returned',
                  groupValue: expenseController.billPartStatus.value,
                  onChanged: (value) {
                    expenseController.billPartStatus.value = value!;
                  },
                  activeColor: Colors.green,
                ),
                Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
                Radio(
                  value: 'not_returned',
                  groupValue: expenseController.billPartStatus.value,
                  onChanged: (value) {
                    expenseController.billPartStatus.value = value!;
                  },
                  activeColor: Colors.red,
                ),
                Text(
                  'No',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Utils.addGap(5),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Obx(() {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(flip: false, reverse: false),
              child: Container(
                height: height / 6.2,
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  // ClipPath(
                  //   clipper: WaveClipperTwo(flip: false, reverse: false),
                  //   child: Container(
                  //     height: height / 6,
                  //     color: primaryColor,
                  //     child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  //         child: Row(
                  //           children: [
                  //             InkWell(
                  //               onTap: () => Navigator.of(context).pop(),
                  //               child: Icon(
                  //                 Icons.arrow_back,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //             10.width,
                  //             Text(
                  //               "Add Voucher",
                  //               style: TextStyle(
                  //                   color: Colors.white, fontSize: 24),
                  //             ),
                  //             Spacer(),
                  //             NavToProfile(),
                  //           ],
                  //         )),
                  //   ),
                  // ),
                  // Utils.addGap(10),
                  selectExpense(),
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
                    child: getTransparentTextFormField(
                        validator: (String? value) {},
                        isObscureText: false,
                        hintText: "Remarks",
                        inputType: TextInputType.text,
                        onChanged: (String value) {}),
                  ),
                  Utils.addGap(20),
                  UploadButton(
                    buttonText: "Choose file(s)",
                    width: width / 2,
                    onpressed: () async {
                      // String? imagePath = await Utils.pickImageOrPDF();
                      // if (imagePath != null) {
                      //   print('Selected file path: $imagePath');
                      //   // Use the imagePath variable to access the selected file
                      // } else {
                      //   print('No file selected');
                      // }
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (mounted) {
                                        Navigator.pop(context);
                                      }
                                      try {
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'pdf',
                                            'png',
                                            'jpeg'
                                          ],
                                          allowMultiple: true,
                                          allowCompression: true,
                                        );

                                        if (result != null) {
                                          expenseController.selectedFiles
                                              .value = result.files;
                                          for (var i = 0;
                                              i <
                                                  expenseController
                                                      .selectedFiles.length;
                                              i++) {
                                            var sele = expenseController
                                                .selectedFiles[i].path;
                                            expenseController
                                                .selectedFilesString
                                                .add(sele);
                                          }
                                          // for (int i = 0;
                                          //     i < selectedFiles.length;
                                          //     i++) {
                                          // debugPrint(
                                          //     'Image path is - ${selectedFiles[i].path}');

                                          // if (
                                          //     // result.files.single.path!
                                          //     //   .contains('pdf')
                                          //     selectedFiles[i]
                                          //         .path!
                                          //         .contains('pdf')) {
                                          //   try {
                                          //     String outputPath =
                                          //         await getTempPath();
                                          //     await PdfCompressor
                                          //         .compressPdfFile(
                                          //             // result
                                          //             //     .files.single.path!,
                                          //             selectedFiles[i].path!,
                                          //             outputPath,
                                          //             CompressQuality.MEDIUM);
                                          //     documentImagePath2 = outputPath;
                                          //     showImagePath = outputPath;
                                          //   } catch (e) {
                                          //     debugPrint(
                                          //         'error from image compression is - $e');
                                          //     documentImagePath2 =
                                          //         result.files.single.path!;
                                          //     showImagePath =
                                          //         result.files.single.name;
                                          //   }
                                          // }
                                          // else {
                                          // final filePath =
                                          //     File(selectedFiles[i].path!);
                                          // debugPrint(
                                          //     "This is filePath${filePath}");
                                          // File(
                                          //         result.files.single.path!)
                                          //     .absolute
                                          //     .path;

                                          // Create output file path
                                          // eg:- "Volume/VM/abcd_out.jpeg"
                                          // bool isPng =
                                          //     filePath.contains(".png");
                                          // var lastIndex =
                                          //     filePath.lastIndexOf(isPng
                                          //         ? RegExp(r'.pn')
                                          //         : RegExp(r'.jp'));
                                          // final splitted = filePath
                                          //     .substring(0, (lastIndex));
                                          // final outPath =
                                          //     "${splitted}_out${filePath.substring(lastIndex)}";

                                          // var compressedImagePath =
                                          //     await FlutterImageCompress
                                          //         .compressAndGetFile(
                                          //             filePath, outPath,
                                          //             // minWidth: 1000,
                                          //             // minHeight: 1000,
                                          //             format: isPng
                                          //                 ? CompressFormat
                                          //                     .png
                                          //                 : CompressFormat
                                          //                     .jpeg,
                                          //             quality:
                                          //                 imageQuality);
                                          // final bytes = compressedImagePath!
                                          //     .readAsBytesSync()
                                          //     .lengthInBytes;
                                          // final kb = bytes / 1024;
                                          // final mb = kb / 1024;

                                          // debugPrint(
                                          //     'image size is $kb and $mb');

                                          // documentImagePath2 =
                                          //     selectedFiles[i].path;

                                          // debugPrint(
                                          //   'image path - ${result.files.single.path!} image name - ${result.files.single.name}',
                                          // );
                                          print(expenseController
                                              .selectedFiles.value.length);
                                          setState(() {});
                                        } else {
                                          debugPrint(
                                            'User Canceled Click',
                                          );
                                        }
                                      } catch (error) {
                                        debugPrint(
                                            'error while picking image from gallery $error');
                                      }
                                    },
                                    child:
                                        const Text('Select Files From Gallery'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (mounted) {
                                        Navigator.pop(context);
                                      }
                                      try {
                                        final ImagePicker picker =
                                            ImagePicker();

                                        // Pick an image
                                        final XFile? image =
                                            await picker.pickImage(
                                                source: ImageSource.camera,
                                                imageQuality: imageQuality);
                                        if (image != null) {
                                          documentImagePath2 = image.path;
                                          showImagePath = image.name;
                                          expenseController.selectedFilesString
                                              .add(documentImagePath2);

                                          debugPrint(
                                            'image path - ${image.path} image name - ${image.name}',
                                          );
                                          setState(() {});
                                        }
                                      } catch (error) {
                                        debugPrint(
                                            'error while picking image from camera $error');
                                      }
                                    },
                                    child:
                                        const Text('Capture Image From Camera'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      setState(() {});
                    },
                  ),
                  Utils.addGap(10),
                  expenseController.selectedFilesString.value.isNotEmpty
                      ?
                      // Container(
                      //     margin: EdgeInsets.symmetric(horizontal: width / 2.9),
                      //     height: height / 7,
                      //     color: Colors.red,
                      //     child: Stack(children: [
                      //       Container(
                      //         width: double.infinity,
                      //         child: Image.file(
                      //           File(documentImagePath2 ?? ""),
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topRight,
                      //         child: Padding(
                      //           padding: EdgeInsets.only(right: 3.sp),
                      //           child: IconButton(
                      //             icon: Icon(Icons.close),
                      //             onPressed: () {
                      //               documentImagePath2 = null;
                      //               setState(() {});
                      //             },
                      //             color: AppColors.maroon,
                      //           ),
                      //         ),
                      //       ),
                      //     ]),
                      //   )
                      Container(
                          height: 270.sp,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 8.sp),
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing:
                                    8.0, // Add spacing between images
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: min(
                                  6,
                                  expenseController.selectedFilesString
                                      .length), // Limit to 6 images),
                              itemBuilder: (context, index) => Container(
                                  height: 30.sp,
                                  width: 30.sp,
                                  child: (expenseController
                                              .selectedFilesString[index]
                                              ?.contains(".pdf") ??
                                          false)
                                      ? Stack(children: [
                                          Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Icon(Icons.picture_as_pdf,
                                                  size: 30.sp),
                                            ),
                                          ),
                                          Positioned(
                                              top: 3.sp,
                                              right: 3.sp,
                                              child: GestureDetector(
                                                onTap: () {
                                                  expenseController
                                                      .selectedFilesString.value
                                                      .removeAt(index);
                                                  setState(() {});
                                                },
                                                child: Image.asset(
                                                  AppIcons.closeIcon,
                                                  height: 23.sp,
                                                  width: 23.sp,
                                                ),
                                              )),
                                        ])
                                      : Stack(children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.file(
                                                File(expenseController
                                                        .selectedFilesString[
                                                    index]),
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                // width: 30.sp,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 3.sp,
                                              right: 3.sp,
                                              child: GestureDetector(
                                                onTap: () {
                                                  expenseController
                                                      .selectedFilesString.value
                                                      .removeAt(index);
                                                  setState(() {});
                                                },
                                                child: Image.asset(
                                                  AppIcons.closeIcon,
                                                  height: 23.sp,
                                                  width: 23.sp,
                                                ),
                                              )),
                                        ]))),
                        )
                      : Container(
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                              ),
                              Utils.addGap(2),
                            ],
                          ),
                        ),
                  Utils.addGap(6),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 5.5),
                    child: RoundedButton(
                      buttonText: 'Submit',
                      width: width,
                      onpressed: () {
                        deviceController.getDeviceInfo();
                        if (_billAmountStatus == "returned" &&
                            expenseController.selectedFilesString.isEmpty) {
                          Utils.showToast(
                              "Please upload Bill Amount Image before proceeding ");
                        } else if (_partStatus == "returned" &&
                            expenseController.selectedFilesString.isEmpty) {
                          Utils.showToast(
                              "Please upload Bill Amount Image before proceeding ");
                        } else if (expenseController.paymentStatus.value ==
                                "Yes" &&
                            expenseController.selectedFilesString.isEmpty) {
                          Utils.showToast(
                              "Please upload Bill Amount Image before proceeding ");
                        }

                        // Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

Future<String> getTempPath() async {
  var dir = await getExternalStorageDirectory();
  await Directory('${dir!.path}/CompressPdfs').create(recursive: true);

  String randomString = getRandomString(10);
  String pdfFileName = '$randomString.pdf';
  return '${dir.path}/CompressPdfs/$pdfFileName';
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random.secure();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

//     child: Stack(
//   clipBehavior: Clip.none,
//   children: [
//     Container(
//       width: 70,
//       height: 70,
//       decoration: BoxDecoration(
//         color: Colors.grey.withOpacity(0.6),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           Align(
//               alignment: Alignment.center,
//               child: documentImagePath2 == null && firstTime
//                   ? const Icon(
//                       Icons.image,
//                       color: Colors.black45,
//                     )
//                   : documentImagePath2!.contains("pdf")
//                       ? const Icon(
//                           Icons.picture_as_pdf,
//                           color: Colors.black45,
//                         )
//                       : ClipRRect(
//                           borderRadius:
//                               BorderRadius.circular(10),
//                           child: Image.file(
//                             File(documentImagePath2 ?? ""),
//                             fit: BoxFit.cover,
//                             height: 70,
//                             width: 70,
//                           ))),
//         ],
//       ),
//     ),
//     Positioned(
//       top: -18,
//       right: -18,
//       child: Visibility(
//         visible: documentImagePath2 != null && firstTime,
//         child: IconButton(
//           icon: const Icon(Icons.cancel,
//               color: Colors.red, size: 20),
//           onPressed: () {
//             documentImagePath2 = null;
//             setState(() {});
//             // Handle delete action
//           },
//         ),
//       ),
//     ),
//   ],
// ),
