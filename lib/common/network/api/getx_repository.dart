import 'dart:convert';

import 'package:akgsetu/common/network/model/token_model.dart';
import 'package:dio/dio.dart';

import '../../../common/utils/storage_service.dart';
import '../constant/endpoints.dart';
import '../dio/dio_exception.dart';
import 'getx_api.dart';

class GetxRepository {
  final GetxApi getxApi;
  final storageService = StorageService();

  GetxRepository(this.getxApi);

  Future<TokenModel> getToken(params) async {
    try {
      final response = await getxApi.loadPostData(Endpoints.token, params);
      //return ConfigModel.fromJson(response.data);
      return TokenModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

}
