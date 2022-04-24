import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:hive_innovation_shop/app/core/utils/api_constants.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';

import '../exceptions/api_exception.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<dynamic> postAPICall({
    required String url,
    Map? param,
    bool? isHeader,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(kBaseUrl + url),
          body: param != null ? jsonEncode(param) : {},
          headers: isHeader ?? false
              ? getHeaderWithToken()
              : {
                  "Content-type": "application/json",
                  "Accept": "application/json"
                });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getAPICall({
    required String url,
    Map? param,
    bool? isHeader,
  }) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(kBaseUrl + url),
          headers: isHeader ?? false ? getHeaderWithToken() : {});
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        //  var responseJson = response.body.toString();
        return response.body.toString();
      case 400:
        //   var responseJson =response.body.toString() ;
        return response.body;
      case 401:
        return response.body;
      case 403:
        return response.body;
        throw UnauthorisedException(response.body.toString());
      case 500:
        return response.body;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

  dynamic getHeaderWithToken() {
    return {
      'Authorization': 'Bearer ${GetStorage().read(kToken)}',
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }
}
