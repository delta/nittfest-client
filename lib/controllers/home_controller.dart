import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/api/api_manager.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:rive/rive.dart';
import 'package:nittfest/utils/client_credentials.dart';
import 'package:universal_html/html.dart' as html;

class HomeController extends GetxController with StateMixin<ResourceResponse> {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  ApiManager api = ApiManager();
  final storage = Get.find<StorageServices>();
  ImageProvider bg = const AssetImage('bg1.png');
  void togglePlay() => carController.isActive = !carController.isActive;
  var spinWheelMap = [
    {
      'name': 'OC',
      'color': const Color(0xFF9D34E6),
      'icon': Icons.group_rounded
    },
    {
      'name': 'CONTENT',
      'color': const Color(0xFF911DB0),
      'icon': Icons.book_rounded
    },
    {
      'name': 'DESIGN',
      'color': const Color(0xFF9D34E6),
      'icon': Icons.design_services_rounded
    },
    {
      'name': 'EVENTS',
      'color': const Color(0xFF911DB0),
      'icon': Icons.event_rounded
    },
    {
      'name': 'AV',
      'color': const Color(0xFF9D34E6),
      'icons': Icons.video_collection_rounded
    },
    {
      'name': 'AMBIENCE',
      'color': const Color(0xFF911DB0),
      'icon': Icons.architecture_rounded
    }
  ];
  @override
  void onInit() {
    carController = SimpleAnimation('driwing');
    flyingcarController = SimpleAnimation('Animation');
    super.onInit();
  }

  onCallBack(String code) async {
    var c = code;

    api.getCallBack(c).then((response) {
      storage.storeData(response);
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  String code = '';
  late html.WindowBase _popupWin;
  void login() {
    if (storage.retriveJWT() == '') {
      final currentUri = Uri.base;

      final port = currentUri.port;

      final redirectUri = 'http://localhost:$port/static.html';

      var _redirectURI = redirectUri;

      log(redirectUri);

      final url = Uri.https('auth.delta.nitt.edu', '/authorize', {
        'client_id': ClientCredentials.clientId,
        'redirect_uri': _redirectURI,
        'response_type': 'code',
        'grant_type': 'authorization_code',
        'state': ClientCredentials.state,
        'scope': 'email+openid+profile+user',
        'nonce': ClientCredentials.nonce
      });

      try {
        _popupWin = html.window.open(
            url.toString(), 'DAuth', 'width=800, height=900, scrollbars=yes');

        html.window.onMessage.listen((event) {
          log(event.data.toString());

          if (event.data.toString().contains('?code=')) {
            _login(event.data.toString());
          }
        });
      } catch (e) {
        log('$e');
      }
    } else {
      navigateToForms();
    }
  }

  void navigateToForms() {
    Get.toNamed(NavigationRoutes.inductionsFormsRoute);
  }

  void _login(String eventBody) {
    final receivedUri = Uri.parse(eventBody);
    String token = receivedUri.queryParameters['code']!;
    code = token;
    onCallBack(code);
    _popupWin.close();
  }
}
