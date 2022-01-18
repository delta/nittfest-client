import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

  var content = {
    'OC':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    'EVENTS':
        ' If you\'re the type to come up with the wildest ideas and live to see them realised, you\'d be a great fit for the NITTFEST Events Team. Our team prides in organising multiple offline and online events to keep the fest buzz going. Our main goal is to make the battle of departments a fair and enjoyable experience. Apart from having the creative space to ideate, learning event management, and managing people, this team is a place to have fun, think out of the box and grow. NET looks for people with great creativity yet practicality, sheer dedication and hardwork.',
    'AMBIENCE':
        'Team Ambience is in charge of creating a joyous atmosphere for Nittfest by combining art and technology to create an elegant atmosphere. With our stunning interactive displays and unique characters that add exhilaration and charm to the fest, we light up the campus with our gorgeous lamps and recreate the place to enjoy. We Ideate, Collaborate, Prototype, Design, model, and Install on site in and around campus during the fest. We add an experienced palette to all the happening spaces within the campus during the fest through the ambiance setting the overall mood to Nittfest.\n If you are one with an artistic flair and a creative mind then Ambience is the place for you.',
    'PR&C':
        ' The battle between the departments has been revived. And would it not be a sacrilege to not pen down the clash for the history books? \n Team PRnC is looking for champion writers and talkers who can smooth talk their way into people’s hearts. \n We need fresh MoCs who can sway the stage with their charm. And need we mention exciting opportunity to interview guests? \n And most importantly we need competent managers who can guide their fellow juniors. \n If you believe you’ve got the energy and enthusiasm to be the public face of the fest, put your inner introvert aside and apply now!',
    'MARKETING':
        ' NITTFest Marketing Team lays the groundwork for NITTFest, seeking to raise the bar with each edition. \n We are responsible for increasing overall brand awareness, while also driving potential and recurring companies towards NITTFest. With coverts of corporate giants like Puma, The Princeton Review, Nestle, NMT retains them, and helps NITTFest attain the monetary funds required for a successful fest. The NITTFest Marketing Team gives you the chance to show off your ingenuity and creativity while making vital contacts with the business sector, where you may polish your talents and find your niche. If you enjoy interacting with businesses and cooperating with them on a regular basis, the NITTFest Marketing Team is the place for you.',
    'DESIGN':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  };

  String getContent() => content[choosenTeam.value] ?? content['OC'] ?? '';

  String getTitle() => choosenTeam.value;

  @override
  void onInit() {
    headerTimer = Timer.periodic(const Duration(milliseconds: 800),
        (timer) => headerAnim.value = !headerAnim.value);

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
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.45),
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
                          style: GoogleFonts.eagleLake(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            shadows: [
                              const Shadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 20.0,
                                color: Colors.white38,
                              ),
                            ],
                            color: const Color(0xFFD4AF37),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        getContent(),
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.eagleLake(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            shadows: [
                              const Shadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 20.0,
                                color: Colors.white70,
                              ),
                            ],
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
                                child: Text(
                                  'Apply',
                                  style: GoogleFonts.eagleLake(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: MaterialButton(
                              textColor: const Color(0xFFD4AF37),
                              onPressed: Get.back,
                              child: Text('Close',
                                  style: GoogleFonts.eagleLake(
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
    storage.setDomain(choosenTeam.value);
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
