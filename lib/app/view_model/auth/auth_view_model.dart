import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_innovation_shop/app/core/helper/auth_helper.dart';
import 'package:hive_innovation_shop/app/core/service/api_service.dart';
import 'package:hive_innovation_shop/app/core/utils/api_constants.dart';
import 'package:hive_innovation_shop/app/core/utils/secure_constants.dart';

import '../../presentation/reusable_widgets/show_loading_dialog.dart';
import '../../presentation/routes/route_pages_name.dart';

class AuthViewModel extends GetxController {
  AuthViewModel();



  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString message = "".obs;
  APIService apiService = APIService();

  Future<void> login({required username, required password, context}) async {
    showLoaderDialog(context);

    try {
      dynamic login = await apiService.postAPICall(
          url: kLoginUrl,
          param: {"username": username, "password": password},
          isHeader: true);
      Map loginData = jsonDecode(login);
      if (loginData["token"] != null) {
        isError.value = false;
        message.value = "success";
        GetStorage().write(kToken, loginData["token"]);
      } else {
        debugPrint(loginData["message "]);
        isError.value = false;
        message.value = loginData["message"];
      }
      Get.back();

      // Get.offAndToNamed(RoutePagesName.kINITIAL);
    } catch (e) {
      message.value = e.toString();
      isError.value = true;
      isLoading.value = false;
      Get.back();
    }
  }

  Future<void> createAccount(
      {required username, required password, context}) async {
    showLoaderDialog(context);

    try {
      dynamic login = await apiService.postAPICall(
          url: kCreateAccountUrl,
          param: {"username": username, "password": password},
          isHeader: true);
      Map loginData = jsonDecode(login);
      if (loginData["token"] != null) {
        isError.value = false;
        message.value = "success";
      } else {
        debugPrint(loginData["message "]);
        isError.value = false;
        message.value = loginData["message"];
      }
      Get.back();

      // Get.offAndToNamed(RoutePagesName.kINITIAL);
    } catch (e) {
      message.value = e.toString();
      isError.value = true;
      isLoading.value = false;
      Get.back();
    }
  }
}
