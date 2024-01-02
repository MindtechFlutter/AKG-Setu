import 'package:akgsetu/common/service_locator.dart';
import 'package:akgsetu/controller/base_controller.dart';
import 'package:akgsetu/network/api/getx_repository.dart';
import 'package:akgsetu/network/model/voucher_entry_model.dart';
import 'package:akgsetu/utils/app_constants.dart';
import 'package:akgsetu/utils/storage_service.dart';
import 'package:akgsetu/utils/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends BaseController {
  final StorageService storageService = StorageService();
  final repo = getIt.get<GetxRepository>();
  //Date variable
  var selectedDate = "".obs;
  //Which expense is selected from expense List eg food,travel etc
  final Rx<String?> selectedExpense = Rxn<String?>();
  //Selected Mode of Travel
  final Rx<String?> selectedModeOfTravel = Rxn<String?>();
  //From Place(under travel)and all
  TextEditingController fromPlace = TextEditingController();
  TextEditingController toPlace = TextEditingController();
  TextEditingController totalKilometer = TextEditingController();
  TextEditingController ratePerKilometer = TextEditingController();
  TextEditingController amount = TextEditingController();
  var billPartStatus = 'returned'.obs;
  var lodgeStatus = 'returned'.obs;
  var foodStatus = 'returned'.obs;
  var ticketStatus = 'Yes'.obs;
  var selectedFiles = <PlatformFile>[].obs;
  var selectedFilesString = [].obs;
  final Rx<String?> foodType = Rxn<String?>();
  TextEditingController paymentRecievedAmount = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController callIdNumber = TextEditingController();
  final Rx<String?> selectedTypeOfTravel = Rxn<String?>();
  final Rx<String?> selectedPurposeOfVisit = Rxn<String?>();
  final Rx<String?> selectedInstallingStatus = Rxn<String?>();
  final Rx<String?> selectedVehicleType = Rxn<String?>();
  var paymentStatus = 'No'.obs;
  var paymentType = 'Check'.obs;
  var serviceReportStatus = 'Yes'.obs;
  var callIdNumberStatus = 'Yes'.obs;
  final Rx<String?> callStatus = Rxn<String?>();
  // final Rx<String?> callStatus = Rxn<String?>();
  // final Rx<String?> callIdStatus = Rxn<String?>();

//Validate
  validate(BuildContext context) async {
    Get.focusScope?.unfocus();

    if (selectedDate.isEmpty) {
      Utils.showToast(AppConstants.errorDate);
    } else if (selectedExpense.value == null) {
      Utils.showToast(AppConstants.errorTypeOfExpense);
    } else if (selectedExpense.value == "Travel") {
      if (selectedModeOfTravel.value == null) {
        Utils.showToast(AppConstants.errorModeOfTravel);
      } else if (fromPlace.text.isEmpty) {
        Utils.showToast(AppConstants.errorFromPlace);
      } else if (toPlace.text.isEmpty) {
        Utils.showToast(AppConstants.errorToPlace);
      } else if (totalKilometer.text.isEmpty) {
        Utils.showToast(AppConstants.errortotalKilometer);
      } else if (ratePerKilometer.text.isEmpty) {
        Utils.showToast(AppConstants.errorratePerKilometer);
      } else if (amount.text.isEmpty) {
        Utils.showToast(AppConstants.errorAmount);
      } else {
        voucherEntry();
      }
    } else {
      voucherEntry();
    }
  }

  //Voucher Entry Api Call
  Future voucherEntry() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {
      AppConstants.voucherdateK: selectedDate.value,
      AppConstants.employeeidK: employeeId,
      AppConstants.expensetypeK: selectedExpense.value ?? "Travel",
      AppConstants.modeK: selectedModeOfTravel.value ?? "Car",
      AppConstants.fromplaceK: fromPlace.text,
      AppConstants.toplaceK: toPlace.text,
      AppConstants.totalkmK: totalKilometer.text,
      AppConstants.rateK: ratePerKilometer.text,
      AppConstants.amountK: amount.text,
      AppConstants.vehicletypeK: selectedTypeOfTravel.value ?? "Bike",
      AppConstants.ticketbillK: ticketStatus.value,
      AppConstants.traveltypeK:
          selectedTypeOfTravel.value ?? "Reached Customer Site",
      AppConstants.visitpurposeK: selectedTypeOfTravel.value ?? "Service Call",
      AppConstants.servicereportK: serviceReportStatus.value,
      AppConstants.callidK: callIdNumberStatus.value,
      AppConstants.callidnumberK: callIdNumber.text,
      AppConstants.callstatusK: callStatus.value ?? "Solved Or Completed",
      AppConstants.paymentreceivedK: paymentStatus.value,
      AppConstants.paymenttypeK: paymentType.value,
      AppConstants.paymentamountK: paymentRecievedAmount.text,
      AppConstants.oreasontK: "",
      AppConstants.gstbillK: "No",
      AppConstants.employeeremarksK: remarks.text
    };
    isLoading.value = true;
    await repo.voucherEntry(params, token).then((value) async {
      VoucherEntryModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        // if (model.data != {}) {
        //   employeeMasterList.value = model.data ?? [];
        // }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      // Utils.showSnackBar(error, voucherEntry());
    });
  }

  //Voucher image upload api call
  Future voucherImageUpload(int voucherId) async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {'files': [], 'employeeid': '283', 'voucherid': voucherId};
    isLoading.value = true;
    await repo.voucherEntry(params, token).then((value) async {
      VoucherEntryModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        // if (model.data != {}) {
        //   employeeMasterList.value = model.data ?? [];
        // }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      // Utils.showSnackBar(error, voucherEntry());
    });
  }
}
