import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:akgsetu/controller/device_info_controller.dart';
import 'package:dio/dio.dart' as diovala;
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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
  // String? finalResult;
  String _billAmountStatus = '';
  String _serviceReportStatus = 'returned';

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
  // DeviceController deviceController = Get.put(DeviceController());

  Future uploadingImage() async {
    expenseController.isLoading.value = true;
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNDE3NzE1NiwianRpIjoiMzU5NDgxZjUtMmJkOS00NDE2LTgwMWQtYzljZDAxMDMzNGNjIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6Ik1pbmRUZWNoIiwibmJmIjoxNzA0MTc3MTU2LCJleHAiOjE3MDQyNjM1NTYsInVzZXJuYW1lIjp7InVzZXJuYW1lIjoiTWluZFRlY2gifX0.Ouze92bKBEAfWIPWtKPjr7znlu20fqHztJKLhgzPoPk'
    };
    List<diovala.MultipartFile> files = [];
    for (var filePath in expenseController.selectedFilesString) {
      files.add(await diovala.MultipartFile.fromFile(filePath));
    }
    var data = diovala.FormData.fromMap({
      'file': files,
      'employeeid': '283',
      'voucherid': '23',
    });

    var dio = diovala.Dio()
      ..interceptors.add(diovala.LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    var response = await dio.post(
      'http://api.akgsetu.in/Mindtech/VoucherImageUpload',
      options: diovala.Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      Utils.showToast(response.statusMessage);
      expenseController.selectedFilesString.clear();
      expenseController.isLoading.value = false;
    } else {
      expenseController.isLoading.value = false;
    }
  }

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
            .copyWith(background: Colors.white),
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
          Text("Select your Expense and add related attachment",
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
                    final formatter = DateFormat('yyyy-MM-dd');
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
                      controller: expenseController.fromPlace,
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
                      controller: expenseController.toPlace,
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
                            controller: expenseController.totalKilometer,
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
                            controller: expenseController.ratePerKilometer,
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
                            controller: expenseController.amount,
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
                          value: 'Yes',
                          groupValue: expenseController.ticketStatus.value,
                          onChanged: (value) {
                            setState(() {
                              expenseController.ticketStatus.value = value!;
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
                          groupValue: expenseController.ticketStatus.value,
                          onChanged: (value) {
                            setState(() {
                              expenseController.ticketStatus.value = value!;
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
                                    groupValue:
                                        expenseController.paymentType.value,
                                    onChanged: (value) {
                                      setState(() {
                                        expenseController.paymentType.value =
                                            value!;
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
                                    groupValue:
                                        expenseController.paymentType.value,
                                    onChanged: (value) {
                                      setState(() {
                                        expenseController.paymentType.value =
                                            value!;
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
                                    groupValue:
                                        expenseController.paymentType.value,
                                    onChanged: (value) {
                                      setState(() {
                                        expenseController.paymentType.value =
                                            value!;
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
                                          controller: expenseController
                                              .paymentRecievedAmount,
                                          validator: (String? value) {},
                                          isObscureText: false,
                                          hintText: "Enter Amount",
                                          inputType: TextInputType.number,
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
                      value: 'Yes',
                      groupValue: expenseController.serviceReportStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.serviceReportStatus.value = value!;
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
                      groupValue: expenseController.serviceReportStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.serviceReportStatus.value = value!;
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
                      groupValue: expenseController.callIdNumberStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.callIdNumberStatus.value = value!;
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
                      groupValue: expenseController.callIdNumberStatus.value,
                      onChanged: (value) {
                        setState(() {
                          expenseController.callIdNumberStatus.value = value!;
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

          expenseController.callIdNumberStatus.value == "Yes" &&
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
                            controller: expenseController.callIdNumber,
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

          expenseController.callIdNumberStatus.value == "Yes" &&
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
                      value: expenseController.callStatus.value,
                      onChanged: (String? value) {
                        expenseController.callStatus.value = value;
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
                      controller: expenseController.paymentRecievedAmount,
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
                        controller: expenseController.remarks,
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
                                          print(expenseController
                                              .selectedFilesString.length);
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
                          child: Obx(
                            () => ModalProgressHUD(
                              inAsyncCall: expenseController.isLoading.value,
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
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Icon(
                                                      Icons.picture_as_pdf,
                                                      size: 30.sp),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 3.sp,
                                                  right: 3.sp,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      expenseController
                                                          .selectedFilesString
                                                          .value
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
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
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
                                                          .selectedFilesString
                                                          .value
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
                            ),
                          ),
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
                        // expenseController.validate(context);
                        // expenseController.voucherEntry();
                        // deviceController.getDeviceInfo();
                        if (expenseController.selectedFilesString.length > 0) {
                          uploadingImage();
                        }

                        if (_billAmountStatus == "returned" &&
                            expenseController.selectedFilesString.isEmpty) {
                          Utils.showToast(
                              "Please upload Bill Amount Image before proceeding ");
                        } else if (expenseController.ticketStatus.value ==
                                "returned" &&
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
