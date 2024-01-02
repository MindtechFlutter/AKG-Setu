import 'dart:convert';

import 'package:akgsetu/network/model/active_task_model.dart';
import 'package:akgsetu/network/model/employee_master_model.dart';
import 'package:akgsetu/network/model/login_model.dart';
import 'package:akgsetu/network/model/problem_master_model.dart';
import 'package:akgsetu/network/model/product_group_master_model.dart';
import 'package:akgsetu/network/model/product_master_model.dart';
import 'package:akgsetu/network/model/spare_master_model.dart';
import 'package:akgsetu/network/model/voucher_delete_model.dart';
import 'package:akgsetu/network/model/voucher_detail_model.dart';
import 'package:akgsetu/network/model/voucher_entry_model.dart';
import 'package:akgsetu/network/model/voucher_upload_image_model.dart';
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
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.activeTaskList, params, token);

      if (response.data != null) {
        return ActiveTaskModel.fromJson(response.data);
      } else {
        return ActiveTaskModel();
      }
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ProblemMasterModel> problemMaster(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.problemMaster, params, token);

      if (response.data != null) {
        return ProblemMasterModel.fromJson(response.data);
      } else {
        return ProblemMasterModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<ProductGroupMasterModel> productGroupMaster(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.productGroupMaster, params, token);

      if (response.data != null) {
        return ProductGroupMasterModel.fromJson(response.data);
      } else {
        return ProductGroupMasterModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<ProductMasterModel> productMaster(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.productMaster, params, token);

      if (response.data != null) {
        return ProductMasterModel.fromJson(response.data);
      } else {
        return ProductMasterModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<SpareMasterModel> spareMaster(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.spareMaster, params, token);

      if (response.data != null) {
        return SpareMasterModel.fromJson(response.data);
      } else {
        return SpareMasterModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<EmployeeMasterModel> employeeMaster(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.employeeList, params, token);

      if (response.data != null) {
        return EmployeeMasterModel.fromJson(response.data);
      } else {
        return EmployeeMasterModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<VoucherEntryModel> voucherEntry(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.voucherEntry, params, token);

      if (response.data != null) {
        return VoucherEntryModel.fromJson(response.data);
      } else {
        return VoucherEntryModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<VoucherDetailModel> voucherDetail(params, token) async {
    try {
      Response response = await getxApi.loadPostDataBearerToken(
          Endpoints.voucherDetail, params, token);

      if (response.data != null) {
        return VoucherDetailModel.fromJson(response.data);
      } else {
        return VoucherDetailModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<VoucherDeleteModel> voucherDelete(params, token) async {
    try {
      Response response =
          await getxApi.deletePostApi(Endpoints.voucherDelete, params, token);

      if (response.data != null) {
        return VoucherDeleteModel.fromJson(response.data);
      } else {
        return VoucherDeleteModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<VoucherImageUploadModel> voucherUploadImage(params, token) async {
    try {
      Response response = await getxApi.loadPostDataMultiPart(
          Endpoints.voucherImageUpload, params, token);

      if (response.data != null) {
        return VoucherImageUploadModel.fromJson(response.data);
      } else {
        return VoucherImageUploadModel();
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }
}
