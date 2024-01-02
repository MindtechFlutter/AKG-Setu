import 'dart:convert';

import 'package:akgsetu/common/service_locator.dart';
import 'package:akgsetu/controller/base_controller.dart';
import 'package:akgsetu/network/api/getx_repository.dart';
import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/network/model/employee_master_model.dart';
import 'package:akgsetu/network/model/problem_master_model.dart';
import 'package:akgsetu/network/model/product_group_master_model.dart';
import 'package:akgsetu/network/model/product_master_model.dart';
import 'package:akgsetu/network/model/spare_master_model.dart';
import 'package:akgsetu/network/model/voucher_detail_model.dart';
import 'package:akgsetu/network/model/voucher_entry_model.dart';
import 'package:akgsetu/utils/app_constants.dart';
import 'package:akgsetu/utils/storage_service.dart';
import 'package:akgsetu/utils/utility.dart';
import 'package:get/get.dart';

class ActiveTaskController extends BaseController {
  final StorageService storageService = StorageService();
  final repo = getIt.get<GetxRepository>();
  var activeTaskList = <ActiveTaskData>[].obs;
  var productGroupMasterList = <ProductGroupMasterData>[].obs;
  var productMasterList = <ProductMasterData>[].obs;
  var problemMasterList = <ProblemMasterData>[].obs;
  var spareMasterList = <SpareMasterData>[].obs;
  var employeeMasterList = <EmployeeMasterData>[].obs;
  var voucherDetailList = <VoucherDetailData>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await activeTaskApiCall();
  }

  //ApiCalling Method for active task list
  Future activeTaskApiCall() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": 110};
    isLoading.value = true;
    await repo.activeTask(params, token).then((value) async {
      ActiveTaskModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          activeTaskList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }

  //Product Group Master Api Call
  Future productGroupMaster() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": employeeId};
    isLoading.value = true;
    await repo.productGroupMaster(params, token).then((value) async {
      ProductGroupMasterModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          productGroupMasterList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }

  //Product  Master Api Call
  Future productMaster() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": employeeId, "productgroupmasterid": "2"};
    isLoading.value = true;
    await repo.productMaster(params, token).then((value) async {
      ProductMasterModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          productMasterList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }

  //Problem Master Api Call
  Future problemMaster() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": employeeId, "productmasterid": "56"};
    isLoading.value = true;
    await repo.problemMaster(params, token).then((value) async {
      ProblemMasterModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          problemMasterList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }

  //Spare Master Api Call
  Future spareMaster() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": employeeId, "productmasterid": "2"};
    isLoading.value = true;
    await repo.spareMaster(params, token).then((value) async {
      SpareMasterModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          spareMasterList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }

  //Employee Master Api Call
  Future EmployeeMaster() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": "90"};
    isLoading.value = true;
    await repo.employeeMaster(params, token).then((value) async {
      EmployeeMasterModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          employeeMasterList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }

  // //Employee Master Api Call
  // Future VoucherEntry() async {
  //   var token = await storageService.getString(AppConstants.tokenPr);
  //   var employeeId = await storageService.getString(AppConstants.employeeIdPr);
  //   var params = {
  //     AppConstants.voucherdateK: "2023-12-23",
  //     AppConstants.employeeidK: "283",
  //     AppConstants.expensetypeK: "Travel",
  //     AppConstants.modeK: "Car",
  //     AppConstants.fromplaceK: "City A",
  //     AppConstants.toplaceK: "City B",
  //     AppConstants.totalkmK: 150.0,
  //     AppConstants.rateK: 0.5,
  //     AppConstants.amountK: 75.0,
  //     AppConstants.vehicletypeK: "Bike",
  //     AppConstants.ticketbillK: "No",
  //     AppConstants.traveltypeK: "Reached Customer Site",
  //     AppConstants.visitpurposeK: "Service Call",
  //     AppConstants.servicereportK: "Yes",
  //     AppConstants.callidK: "Yes",
  //     AppConstants.callidnumberK: "031223/T00012",
  //     AppConstants.callstatusK: "Solved Or Completed",
  //     AppConstants.paymentreceivedK: "No",
  //     AppConstants.paymenttypeK: "",
  //     AppConstants.paymentamountK: 0,
  //     AppConstants.oreasontK: "",
  //     AppConstants.gstbillK: "No",
  //     AppConstants.employeeremarksK: ""
  //   };
  //   isLoading.value = true;
  //   await repo.voucherEntry(params, token).then((value) async {
  //     VoucherEntryModel model = value;
  //     isLoading.value = false;
  //     if (model.data != null) {
  //       // if (model.data != {}) {
  //       //   employeeMasterList.value = model.data ?? [];
  //       // }
  //     } else {
  //       Utils.showToast(model.message);
  //       isLoading.value = false;
  //     }
  //   }).onError((error, stackTrace) {
  //     isLoading.value = false;
  //     Utils.showSnackBar(error, activeTaskApiCall());
  //   });
  // }

  //Employee Master Api Call
  Future VoucherDetail() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {
      "employeeid": 283,
      "fromdate": "2022-01-01",
      "todate": "2023-12-31",
      "voucherstatus": "All"
    };
    isLoading.value = true;
    await repo.voucherDetail(params, token).then((value) async {
      VoucherDetailModel model = value;
      isLoading.value = false;
      if (model.data != null) {
        if (model.data!.isNotEmpty) {
          voucherDetailList.value = model.data ?? [];
        }
      } else {
        Utils.showToast(model.message);
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, activeTaskApiCall());
    });
  }
}
