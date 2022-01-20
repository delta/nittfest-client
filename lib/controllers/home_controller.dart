import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/constants/team_description.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/api/api_manager.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';

import 'package:nittfest/utils/client_credentials.dart';
import 'package:universal_html/html.dart' as html;

class HomeController extends GetxController with StateMixin<ResourceResponse> {
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  ApiManager api = ApiManager();
  final storage = Get.find<StorageServices>();
  ImageProvider bg = const AssetImage('assets/bg2.webp');
  var currentPointer = const Offset(0, 0);
  var center = const Offset(217.0, 208.9);
  var startAngle = 0.0.obs;
  var choosenTeam = 'OC'.obs;
  var headerAnim = false.obs;
  late Timer headerTimer;
  var textSize = 0.0.obs;
  var applyElevation = 1.0.obs;
  var crossFadeState = CrossFadeState.showFirst.obs;
  final _preferences = ['OC', 'OC', 'OC'].obs;

  get preferences => _preferences;

  String getContent() =>
      teamContent[choosenTeam.value] ?? teamContent['OC'] ?? '';

  String getTitle() => choosenTeam.value;

  @override
  void onInit() {
    headerTimer = Timer.periodic(const Duration(milliseconds: 800),
        (timer) => headerAnim.value = !headerAnim.value);
    Timer(const Duration(milliseconds: 2000),
        () => crossFadeState.value = CrossFadeState.showSecond);
    super.onInit();
  }

  @override
  void onClose() {
    headerTimer.cancel();
    super.onClose();
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
      startAngle.value += 0.04;
      if (startAngle > finishAngle) {
        timer.cancel();
        if (startAngle.value >= 2 * pi) {
          startAngle.value = 0;
        }
        setChosenTeamValue();
      }
    });
  }

  void setChosenTeamValue() async {
    for (int i = 1; i <= 5; i++) {
      if (startAngle.value > i * pi / 3 - pi / 6 &&
          startAngle.value < i * pi / 3 + pi / 6) {
        choosenTeam.value = data[6 - i];
        storage.setDomain(data[6 - i]);
        Timer(const Duration(milliseconds: 250), () {
          textSize.value = 0.5;
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
      navigateToForms();
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void showcontent() {
    Get.dialog(
      Center(
          child: SingleChildScrollView(
              child: Material(
        type: MaterialType.transparency,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.79),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Wrap(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          getTitle(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            shadows: [
                              Shadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 20.0,
                                color: Colors.white38,
                              ),
                            ],
                            color: Color(0xFFD4AF37),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        getContent(),
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            // shadows: [
                            //   const Shadow(
                            //     offset: Offset(5.0, 5.0),
                            //     blurRadius: 20.0,
                            //     color: Colors.white70,
                            //   ),
                            // ],
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: MaterialButton(
                                textColor: const Color(0xFFD4AF37),
                                onPressed: login,
                                child: const Text(
                                  'Apply',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: MaterialButton(
                              textColor: const Color(0xFFD4AF37),
                              onPressed: Get.back,
                              child: const Text('Close',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ))),
      barrierDismissible: false,
    );
  }

  String code = '';
  late html.WindowBase _popupWin;
  void login() async {
    if (await storage.retriveJWT() == '') {
      const redirectUri = ClientCredentials.redirectUri;

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
    storage.domain = getTitle();
    Get.offAllNamed(NavigationRoutes.inductionsFormsRoute,
        parameters: {'domain': choosenTeam.value});
  }

  void _login(String eventBody) {
    final receivedUri = Uri.parse(eventBody);
    String token = receivedUri.queryParameters['code']!;
    code = token;
    _popupWin.close();
    onCallBack(code);
  }
}
