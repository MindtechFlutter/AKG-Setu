
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../screens/network/api/getx_api.dart';
import '../screens/network/api/getx_repository.dart';
import '../screens/network/dio/dio_client.dart';



final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(GetxApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(GetxRepository(getIt.get<GetxApi>()));
  // getIt.registerSingleton(HomeController());
}
