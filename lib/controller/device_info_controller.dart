import 'package:akgsetu/controller/base_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceController extends BaseController {
  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    final version = androidInfo.version.release;
    final sdk = androidInfo.version.sdkInt;
    var brandName = androidInfo.brand;
    var device = androidInfo.device;
    var id = androidInfo.id;

    print('Running on Version $version');
    print('Running on Sdk$sdk');
    print('Running on Brand$brandName');
    print('Running on Device$device');
    print('Running on Device Id $id');
  }
}
