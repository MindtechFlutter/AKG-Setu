import 'dart:convert';

import '../../../common/utils/storage_service.dart';
import 'getx_api.dart';

class GetxRepository {
  final GetxApi getxApi;
  final storageService = StorageService();

  GetxRepository(this.getxApi);

/*  Future<TokenModelClass> getToken(params) async {
    try {
      final response = await busyBeeApi.loadGetData(Endpoints.token, params);
      //return ConfigModel.fromJson(response.data);
      return TokenModelClass.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }*/

}
