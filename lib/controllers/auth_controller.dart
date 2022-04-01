import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/config/environments.dart';
import 'package:nittfest/services/api_services.dart';
import 'package:nittfest/services/storage_services.dart';
import 'package:nittfest/constants/navigation_routes.dart';
import 'dart:developer';

import 'package:nittfest/widgets/auth/dauth_webview.dart';

class AuthController extends GetxController {
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  final isLoading = false.obs;

  @override
  void onInit() {
    String? token = storage.retriveJWT();
    if (token != null) {
      navigateToForms();
    }
    super.onInit();
  }

  void login() async {
    String? token = storage.retriveJWT();
    // return;
    if (token == null) {
      final url = Uri.https('auth.delta.nitt.edu', '/authorize', {
        'client_id': Environment.clientId,
        'redirect_uri': Environment.redirectUri,
        'response_type': 'code',
        'grant_type': 'authorization_code',
        'state': Environment.state,
        'scope': 'email+openid+profile+user',
        'nonce': Environment.nonce
      });

      try {
        Get.dialog(DauthWebView(
          authorizationUrl: url.toString(),
          redirectUri: Environment.redirectUri,
        ));
      } catch (e) {
        isLoading.value = false;

        log('$e');
      }
    } else {
      isLoading.value = false;
      navigateToForms();
    }
  }

  void navigateToForms() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.offAndToNamed(NavigationRoutes.main);
    });
  }

  Future<void> onCallBack(String code) async {
    api.getCallBack(code).then((response) async {
      await storage.storeData(response);
      isLoading.value = false;
      navigateToForms();
    }, onError: (err) {
      Get.snackbar('Failed To Login', err.toString());
      log(err);
    });
  }
}
