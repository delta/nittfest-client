import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/api/api_manager.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:rive/rive.dart';
import 'package:nittfest/utils/client_credentials.dart';
import 'package:universal_html/html.dart' as html;

class HomeController extends GetxController
    with StateMixin<ResourceResponse>, GetSingleTickerProviderStateMixin {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  ApiManager api = ApiManager();
  final storage = Get.find<StorageServices>();
  ImageProvider bg = const AssetImage('bg2.webp');
  var currentPointer = const Offset(0, 0);
  var center = const Offset(217.0, 208.9);
  var startAngle = 0.0.obs;
  var choosenTeam = 'OC'.obs;
  var headerAnim = false.obs;
  late Timer headerTimer;
  var textSize = 0.0.obs;
  late List<String> data = [
    'OC',
    'EVENTS',
    'AMBIENCE',
    'PR&C',
    'MARKETING',
    'DESIGN',
  ];

  @override
  void onInit() {
    headerTimer = Timer.periodic(const Duration(milliseconds: 800),
        (timer) => headerAnim.value = !headerAnim.value);

    super.onInit();
  }

  void updateStartAngle(DragUpdateDetails details) {
    if (center.dx != 0 && center.dy != 0) {
      currentPointer -= center;
      var theta = details.delta.distance / currentPointer.distance;
      var updatedPointer = details.localPosition - center;
      var direction = currentPointer.dx * updatedPointer.dy -
          currentPointer.dy * updatedPointer.dx;
      if (direction > 0) {
        if (startAngle.value + theta > 2 * pi) {
          startAngle.value += theta - 2 * pi;
        } else {
          startAngle.value += theta;
        }
      } else if (direction < 0) {
        if (startAngle.value - theta < 0) {
          startAngle.value -= theta - 2 * pi;
        } else {
          startAngle.value -= theta;
        }
      }
    }
    currentPointer += center + details.delta;
  }

  void adjust() {
    int i = 1;
    for (i = 1; i <= 6; i++) {
      if (startAngle.value >= ((i - 1) / 6) * 360.0 * pi / 180.0) {
        if (startAngle.value <= (i / 6) * 360.0 * pi / 180.0) {
          moveWheel((i / 6) * 360.0 * pi / 180.0);
          break;
        }
      }
    }
  }

  void moveWheel(double finishAngle) {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      startAngle.value += 0.01;
      if (startAngle > finishAngle) {
        timer.cancel();
        if (startAngle.value >= 2 * pi) {
          startAngle.value = 0;
        }
        setChosenTeamValue();
      }
    });
  }

  void setChosenTeamValue() {
    for (int i = 1; i <= 5; i++) {
      if (startAngle.value > i * pi / 3 - pi / 6 &&
          startAngle.value < i * pi / 3 + pi / 6) {
        choosenTeam.value = data[6 - i];

        Timer(const Duration(milliseconds: 250), () {
          textSize.value = 0;
          Timer(const Duration(milliseconds: 250), () {
            textSize.value = 1;
          });
        });

        return;
      }
    }
    choosenTeam.value = data[0];
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
          if (event.data.toString().contains('?code=')) {
            _login(event.data.toString());
          }
        });
      } catch (e) {
        dev.log('$e');
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
