///Most of the time i prefer to use flutter secure storage with helper class but now i'm going to use
///but now i'm not going to use it coz this is just a demo app




/*
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';

class AuthHelper {
  final storage = const FlutterSecureStorage();

  Future<bool> saveAuthToken(dynamic authData) async {
    try {
      await storage.write(key: kToken, value: jsonEncode(authData));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteAuthToken() async {
    await storage.delete(key: kToken);
  }

  Future<String> getAuthToken() async {
    var allValues = await storage.read(key: kToken);

    String resultAuth;
    if (allValues != null) {
      return allValues;
    } else {
      resultAuth = "";
      return resultAuth;
    }
  }
}
*/
