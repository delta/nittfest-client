import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/auth_controller.dart';
import 'package:webviewx/webviewx.dart';

class DauthWebView extends StatelessWidget {
  final String authorizationUrl;
  final String redirectUri;

  const DauthWebView({
    Key? key,
    required this.authorizationUrl,
    required this.redirectUri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<AuthController>();
    return SafeArea(
        child: SingleChildScrollView(
            child: Stack(children: [
      Center(
          child: WebViewX(
        width: size.width,
        height: size.height + 15,
        javascriptMode: JavascriptMode.unrestricted,
        initialContent: authorizationUrl,
        navigationDelegate: (navReq) async {
          if (navReq.content.source.startsWith(redirectUri)) {
            Uri responseUrl = Uri.parse(navReq.content.source);
            String? code = responseUrl.queryParameters['code'];
            await controller.onCallBack(code!);
            Get.back();
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      )),
    ])));
  }
}
