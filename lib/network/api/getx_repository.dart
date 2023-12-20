import 'dart:convert';

import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/network/model/login_model.dart';
import 'package:akgsetu/screens/home/active-task.dart';
import 'package:dio/dio.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/storage_service.dart';
import '../../utils/utility.dart';
import '../constant/endpoints.dart';
import '../dio/dio_exception.dart';
import '../model/token_model.dart';
import 'getx_api.dart';

class GetxRepository {
  final GetxApi getxApi;
  final storageService = StorageService();

  GetxRepository(this.getxApi);

  Future<TokenModel> getToken(params) async {
    try {
      Response response = await getxApi.loadPostData(Endpoints.token, params);
      //return ConfigModel.fromJson(response.data);
      print("+++++++++statuscode++++++++++");
      print(response.statusCode);
      if (response.data != null) {
        return TokenModel.fromJson(response.data);
      } else {
        return TokenModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Utils.showSnackBar(errorMessage, () {
        getToken(params);
      });
      throw errorMessage;
    }
  }

  Future<LoginModel> login(params, token) async {
    try {
      Response response =
          await getxApi.loadPostDataBearerToken(Endpoints.login, params, token);

      if (response.data != null) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      rethrow;
    }
  }

   Future<ActiveTaskModel> activeTask(params, token) async {
    try {
      Response response =
          await getxApi.loadPostDataBearerToken(Endpoints.activeTaskList, params, token);

      if (response.data != null) {
        return ActiveTaskModel.fromJson(response.data);
      } else {
        return ActiveTaskModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      rethrow;
    }
  }

    Future<LoginModel> problemMaster(params, token) async {
    try {
      Response response =
          await getxApi.loadPostDataBearerToken(Endpoints.problemMaster, params, token);

      if (response.data != null) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      rethrow;
    }
  }
}
