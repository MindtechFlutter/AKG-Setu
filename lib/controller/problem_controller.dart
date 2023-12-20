import 'package:akgsetu/common/service_locator.dart';
import 'package:akgsetu/controller/base_controller.dart';
import 'package:akgsetu/network/api/getx_repository.dart';
import 'package:akgsetu/utils/app_constants.dart';
import 'package:akgsetu/utils/storage_service.dart';

class ProblemMasterController extends BaseController {
  final repo = getIt<GetxRepository>();
  final StorageService storgeService = StorageService();

  Future problemMasterApiCall() async {
    var token = StorageService().getString(AppConstants.tokenPr);
    
  }
}
