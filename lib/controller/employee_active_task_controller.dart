import 'dart:convert';

import 'package:akgsetu/common/service_locator.dart';
import 'package:akgsetu/controller/base_controller.dart';
import 'package:akgsetu/network/api/getx_repository.dart';
import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/utils/app_constants.dart';
import 'package:akgsetu/utils/storage_service.dart';
import 'package:akgsetu/utils/utility.dart';
import 'package:get/get.dart';

class ActiveTaskController extends BaseController {
  final StorageService storageService = StorageService();
  final repo = getIt.get<GetxRepository>();
  var activeTaskList = <ActiveTaskData>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await activeTaskApiCall();
  }

  //ApiCalling Method for active task list
  Future activeTaskApiCall() async {
    var token = await storageService.getString(AppConstants.tokenPr);
    var employeeId = await storageService.getString(AppConstants.employeeIdK);
    var params = {"employeeid": employeeId};
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
}
