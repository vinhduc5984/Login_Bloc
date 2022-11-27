import 'package:dio/dio.dart' as diox;
import 'dart:convert' as convert;

import 'package:testsuntech/src/configs/aplication.dart';
import 'package:testsuntech/src/configs/http_status_code.dart';

class BaseRepository {
  String serverHost = 'https://stagingbvth.mediorbit.vn/';
  static diox.Dio dio = diox.Dio(diox.BaseOptions(
    baseUrl: Application.baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  ));

  Future<diox.Response<dynamic>> sendFormData(
    String gateway,
    diox.FormData formData,
  ) async {
    try {
      var response = await dio.post(
        serverHost + gateway,
        data: formData,
        options: getOptions(),
        onSendProgress: (send, total) {
          // AppBloc.progressBloc.add(UpdateProgressSendEvent(
          //   progress: send / total,
          // ));
        },
        onReceiveProgress: (received, total) {
          // AppBloc.progressBloc.add(UpdateProgressReceiveEvent(
          //   progress: received / total,
          // ));
        },
      );

      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: serverHost + gateway);
    }
  }

  Future<diox.Response<dynamic>> postRoute(
      String gateway, Map<String, dynamic> body,
      {String? query}) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }
      var response = await dio.post(
        serverHost + gateway,
        data: convert.jsonEncode(body),
        options: getOptions(),
        queryParameters: query == null ? null : paramsObject,
      );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: serverHost + gateway);
    }
  }

  diox.Options getOptions() {
    return diox.Options(
      validateStatus: (status) {
        return true;
      },
      headers: getHeaders(),
    );
  }

  getHeaders() {
    return {
      // 'Authorization':
      //     'Bearer ${UserLocal().getAccessToken().isEmpty ? UserLocal().getBackupToken() : UserLocal().getAccessToken()}',
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };
  }

  diox.Response catchDioError({
    required diox.DioError exception,
    required String gateway,
  }) {
    Application().serverErrorAlert();

    return diox.Response(
      requestOptions: diox.RequestOptions(path: serverHost + gateway),
      data: null,
      statusCode: StatusCode.badGateway,
      statusMessage: "CATCH EXCEPTION DIO",
    );
  }
}
