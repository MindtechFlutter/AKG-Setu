import 'dart:async';
import 'package:akgsetu/screens/home/dashboard.dart';
import 'package:get/get.dart';
import '../../common/service_locator.dart';
import '../../common/utils/dimensions.dart';
import '../../common/utils/storage_service.dart';
import '../network/api/getx_repository.dart';
import '../routes/app_pages.dart';
import '../utils/app_constants.dart';
import 'base_controller.dart';

class SplashController extends BaseController {
  final repo = getIt.get<GetxRepository>();
  final StorageService storageService = StorageService();

  @override
  Future<void> onInit() async {
   // await getTokenApi();
    super.onInit();
  }

  void splashTimer() async {
    var _duration = Duration(
      seconds: Dimensions.screenLoadTime,
    );

    Timer(_duration, () async {
      /*try {
        if (storage.getString(AppConstants.eventId) != null) {
          Get.offNamedUntil(Routes.dashboard, (route) => false);
        } else {
          Get.offNamedUntil(Routes.auth, (route) => false);
        }
      } catch (e) {
        Get.offNamedUntil(Routes.auth, (route) => false);
      }*/
    });
  }

  Future getTokenApi() async {
    var params = {
      AppConstants.usernameK: "MindTech",
      AppConstants.passwordK: "\$auuzqI@t_DWAUw8K",
    };

    await repo.getToken(params).then((value) async {
      await storageService.setString(
          AppConstants.tokenPr, value.accessToken ?? "");
      Get.offAllNamed(Routes.login);
      print("accessToken  =======> ${value.accessToken}");
    });
  }
}
