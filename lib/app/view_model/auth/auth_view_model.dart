import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  RxBool isVisible = true.obs;
  APIService apiService = APIService();

  ///login
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
        Get.back();
        Get.offAndToNamed(RoutePagesName.kINITIAL);
      } else {
        debugPrint(loginData["message "]);
        isError.value = false;
        message.value = loginData["message"];
        Get.back();
      }

      // Get.offAndToNamed(RoutePagesName.kINITIAL);
    } catch (e) {
      message.value = e.toString();
      isError.value = true;
      isLoading.value = false;
      Get.back();
    }
  }

  ///password visible or not
  onPasswordOnOff() {
    isVisible.toggle();
  }

  ///create account
  Future<void> createAccount(
      {required username, required password, context}) async {
    showLoaderDialog(context);

    try {
      dynamic createAccount = await apiService.postAPICall(
          url: kCreateAccount,
          param: {"username": username, "password": password},
          isHeader: true);

      Map userData = jsonDecode(createAccount);
      if (userData["token"] != null) {
        isError.value = false;
        message.value = "success";
        GetStorage().write(kToken, userData["token"]);
        Get.back();
        Get.offAndToNamed(RoutePagesName.kINITIAL);
      } else {
        debugPrint(userData["message "]);
        isError.value = false;
        message.value = userData["message"];
        Get.back();
      }

      // Get.offAndToNamed(RoutePagesName.kINITIAL);
    } catch (e) {
      message.value = e.toString();
      isError.value = true;
      isLoading.value = false;
      Get.back();
    }
  }
}
