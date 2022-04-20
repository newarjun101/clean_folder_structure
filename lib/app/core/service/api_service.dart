import 'dart:convert';
import 'dart:io';
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
      final response = await http.post(Uri.parse(url),
          body: param ?? {}, headers: isHeader ?? false ? {} : {});
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}
