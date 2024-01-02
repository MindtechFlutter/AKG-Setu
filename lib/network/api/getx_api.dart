import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utils/storage_service.dart';
import '../../utils/utility.dart';
import '../dio/dio_client.dart';

class GetxApi {
  final DioClient dioClient;
  final storageService = StorageService();

  GetxApi({required this.dioClient});

  Future<Response> loadPostFormData(endpoint, body, params, token) async {
    Dio dio = new Dio();
    dioClient.dio.options.contentType = Headers.formUrlEncodedContentType;
    dioClient.dio.options.headers["Content-Type"] = "multipart/form-data";
    dio.options.headers["token"] = token;

    try {
      final Response response = await dioClient.post(endpoint,
          data: body,
          queryParameters: params,
          options: Options(contentType: 'multipart/form-data'));

      Map<String, dynamic> data = response.data;
      //print(response.data);
      if (data['show'] == true) {
        await Utils.showToast(data["message"]);
      }
      if (data['status'] == 401) {
        //   await storageService.clearData();
        //    Get.offAllNamed(Routes.loginonboardscreen);
      }
      /*  if(response.statusCode.toString()=="401")
        {
          g.Get.offNamedUntil(Routes.login, (route) => false);
          storageService.setBool(AppConstants.isLoggedIn, false);
        }*/
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetData(endpoint, params) async {
    try {
      final Response response =
          await dioClient.get(endpoint, queryParameters: params);
      Map<String, dynamic> data = response.data;
      // print(response.data);
/*      if (data['show'] == true) {
        await Utils.showToast(data["message"]);
      }*/
      if (data?['status'] == 401) {
        //    await storageService.clearData();
        // Get.offAllNamed(Routes.loginonboardscreen);
      }
      /* if(response.statusCode.toString()=="401")
      {
        g.Get.offNamedUntil(Routes.login, (route) => false);
        storageService.setBool(AppConstants.isLoggedIn, false);
      }*/
      return response; //json.encode(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetDataWithParams(endpoint, params, token) async {
    try {
      final Map<String, dynamic> header = new Map<String, dynamic>();
      header["token"] = token;
      final Response response = await dioClient.get(endpoint,
          queryParameters: params, options: Options(headers: header));
      Map<String, dynamic> data = response.data;
      // print(response.data);
      /*if (data['show'] == true) {
        await Utils.showToast(data["message"]);
      }*/
      if (data?['status'] == 401) {
        //    await storageService.clearData();
        // Get.offAllNamed(Routes.loginonboardscreen);
      }
      /* if(response.statusCode.toString()=="401")
      {
        g.Get.offNamedUntil(Routes.login, (route) => false);
        storageService.setBool(AppConstants.isLoggedIn, false);
      }*/
      return response; //json.encode(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetDataWithOutParams(endpoint, token) async {
    try {
      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      final Map<String, dynamic> header = new Map<String, dynamic>();
      header["token"] = token;

      final Response response =
          await dioClient.get(endpoint, options: Options(headers: header));
      Map<String, dynamic> data = response.data;
      // print(response.data);
      /*  if (data['show'] == true) {
        await Utils.showToast(data["message"]);
      }*/
      if (data['status'] == 401) {
        //    await storageService.clearData();
        // Get.offAllNamed(Routes.loginonboardscreen);
      }
      /* if(response.statusCode.toString()=="401")
      {
        g.Get.offNamedUntil(Routes.login, (route) => false);
        storageService.setBool(AppConstants.isLoggedIn, false);
      }*/
      return response; //json.encode(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadPostData(endpoint, params) async {
    // final Map<String, dynamic> header = new Map<String, dynamic>();
    // header["token"] = "";

    try {
      final Response response = await dioClient.post(endpoint,
          data: params,
          options: Options(contentType: 'application/x-www-form-urlencoded'));

      Map<String, dynamic> data = response.data;

      /*  if (data['status'] == 1) {
        await Utils.showToast(data["message"]);
      }*/

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadPostDataJsonType(endpoint, params, token) async {
    final Map<String, dynamic> header = new Map<String, dynamic>();
    header["token"] = token;

    try {
      final Response response = await dioClient.post(endpoint,
          data: params,
          options: Options(
            headers: header,
            contentType: 'application/json',
          ));

      Map<String, dynamic> data = response.data;

      /*  if (data['status'] == 1) {
        await Utils.showToast(data["message"]);
      }*/

      if (data['status'] == 401) {
        //    await storageService.clearData();
        //Get.offAllNamed(Routes.loginonboardscreen);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadGetDataWithParamsJsonType(
      endpoint, params, token) async {
    try {
      final Map<String, dynamic> header = new Map<String, dynamic>();
      header["token"] = token;
      final Response response = await dioClient.get(
        endpoint,
        queryParameters: params,
        options: Options(headers: header),
      );
      Map<String, dynamic> data = response.data;
      // print(response.data);
      if (data['show'] == true) {
        await Utils.showToast(data["message"]);
      }
      if (data?['status'] == 401) {
        //    await storageService.clearData();
        // Get.offAllNamed(Routes.loginonboardscreen);
      }
      /* if(response.statusCode.toString()=="401")
      {
        g.Get.offNamedUntil(Routes.login, (route) => false);
        storageService.setBool(AppConstants.isLoggedIn, false);
      }*/
      return response; //json.encode(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadPostDataBearerToken(endpoint, params, token) async {
    try {
      final Map<String, dynamic> header = new Map<String, dynamic>();
      header["Authorization"] = "Bearer $token";
      final response = await dioClient.dio.post(endpoint,
          data: params,
          options: Options(
            headers: header,
          ));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deletePostApi(endpoint, params, token) async {
    try {
      final Map<String, dynamic> header = Map<String, dynamic>();
      header["Authorization"] = "Bearer $token";
      final response = await dioClient.dio.post(endpoint,
          data: params,
          options: Options(
            headers: header,
          ));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loadPostDataMultiPart(endpoint, params, token) async {
    // var data = FormData.fromMap({
    //   'files': [
    //     await MultipartFile.fromFile(
    //         '/C:/Users/vedant/Pictures/Screenshots/images.png',
    //         filename: '/C:/Users/vedant/Pictures/Screenshots/images.png'),
    //     await MultipartFile.fromFile(
    //         '/C:/Users/vedant/Pictures/Screenshots/Screenshot (7).png',
    //         filename:
    //             '/C:/Users/vedant/Pictures/Screenshots/Screenshot (7).png'),
    //     await MultipartFile.fromFile(
    //         '/C:/Users/vedant/Pictures/Screenshots/Screenshot (36).png',
    //         filename:
    //             '/C:/Users/vedant/Pictures/Screenshots/Screenshot (36).png')
    //   ],
    //   'employeeid': '283',
    //   'voucherid': '23'
    // });
    try {
      final Map<String, dynamic> header = new Map<String, dynamic>();
      header["Authorization"] = "Bearer $token";
      final response = await dioClient.dio.post(endpoint,
          data: FormData.fromMap(params),
          options: Options(
            headers: header,
          ));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future uploadingImage(endpoint, params, token) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcwNDE3NzE1NiwianRpIjoiMzU5NDgxZjUtMmJkOS00NDE2LTgwMWQtYzljZDAxMDMzNGNjIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6Ik1pbmRUZWNoIiwibmJmIjoxNzA0MTc3MTU2LCJleHAiOjE3MDQyNjM1NTYsInVzZXJuYW1lIjp7InVzZXJuYW1lIjoiTWluZFRlY2gifX0.Ouze92bKBEAfWIPWtKPjr7znlu20fqHztJKLhgzPoPk'
    };
    var data = FormData.fromMap({
      'files': [
        await MultipartFile.fromFile(
            '/C:/Users/vedant/Pictures/Screenshots/images.png',
            filename: '/C:/Users/vedant/Pictures/Screenshots/images.png'),
        await MultipartFile.fromFile(
            '/C:/Users/vedant/Pictures/Screenshots/Screenshot (1).png',
            filename:
                '/C:/Users/vedant/Pictures/Screenshots/Screenshot (1).png')
      ],
      'employeeid': '283',
      'voucherid': '23'
    });

    var dio = Dio();
    var response = await dio.request(
      'http://api.akgsetu.in/Mindtech/VoucherImageUpload',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
