import 'package:akgsetu/common/controller/expense_controller.dart';
import 'package:akgsetu/common/utils/app_constants.dart';
import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
  // String? selectedExpense;
  DateTime? fromDate;
  bool enabled = true;
  String? expense;
  String? modeOfTravel;
  // String? foodType;
  String? typeOfTravel;
  String? purposeOfvisit;
  String? finalResult;
  String _partStatus = 'returned';
  String _billAmountStatus = 'returned';
  String _serviceReportStatus = 'returned';
  String _callIdStatus = 'returned';
  String _paymentStatus = 'returned';

  TextEditingController fromPlace = TextEditingController();
  TextEditingController toPlace = TextEditingController();
  TextEditingController totalKilometer = TextEditingController();
  TextEditingController ratePerKm = TextEditingController();
  TextEditingController ammount = TextEditingController();

  //Controller instance
  ExpenseController expenseController = Get.put(ExpenseController());

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
                            hintText: "Rate Per/Km",
                            inputType: TextInputType.text,
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
                            inputType: TextInputType.text,
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
                              value: 'returned',
                              groupValue: _paymentStatus,
                              onChanged: (value) {
                                setState(() {
                                  _paymentStatus = value!;
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
                              groupValue: _paymentStatus,
                              onChanged: (value) {
                                setState(() {
                                  _paymentStatus = value!;
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
                      value: 'returned',
                      groupValue: _callIdStatus,
                      onChanged: (value) {
                        setState(() {
                          _callIdStatus = value!;
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
                      groupValue: _callIdStatus,
                      onChanged: (value) {
                        setState(() {
                          _callIdStatus = value!;
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
          //call status
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
                      inputType: TextInputType.text,
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
                      inputType: TextInputType.text,
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
                      inputType: TextInputType.text,
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
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          Utils.addGap(20),
          UploadButton(
            buttonText: "Choose file(s)",
            width: width / 2,
            onpressed: () async {
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
