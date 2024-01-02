import 'dart:convert';
import 'dart:ffi';

import 'package:akgsetu/common/service_locator.dart';
import 'package:akgsetu/controller/base_controller.dart';
import 'package:akgsetu/network/api/getx_repository.dart';
import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/network/model/employee_master_model.dart';
import 'package:akgsetu/network/model/problem_master_model.dart';
import 'package:akgsetu/network/model/product_group_master_model.dart';
import 'package:akgsetu/network/model/product_master_model.dart';
import 'package:akgsetu/network/model/spare_master_model.dart';
import 'package:akgsetu/network/model/voucher_delete_model.dart';
import 'package:akgsetu/network/model/voucher_detail_model.dart';
import 'package:akgsetu/network/model/voucher_entry_model.dart';
import 'package:akgsetu/utils/app_constants.dart';
import 'package:akgsetu/utils/storage_service.dart';
import 'package:akgsetu/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VouchersController extends BaseController {
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

  //Employee Master Api Call
  Future voucherDetail() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    // var employeeId = await storageService.getString(AppConstants.employeeIdPr);
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
      Utils.showSnackBar(error, voucherDetail());
    });
  }

  Future voucherDelete(int voucherId) async {
    var token = await storageService.getString(AppConstants.tokenPr);
    // var employeeId = await storageService.getString(AppConstants.employeeIdPr);
    var params = {"employeeid": 283, "voucherid": voucherId};
    isLoading.value = true;
    await repo.voucherDelete(params, token).then((value) async {
      VoucherDeleteModel model = value;
      if (model.responseCode == 201) {
        // Utils.getDeleteDialog(context);
        Utils.showToast(model.message);
        voucherDetail();
      } else if (model.responseCode == 203) {
        Utils.showToast(model.message);
        isLoading.value = false;
        // Utils.getDeleteDialog(context, voucherDetail);
      } else {
        isLoading.value = false;
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.showSnackBar(error, voucherDetail());
    });
  }
}
