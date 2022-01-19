import 'dart:collection';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/constants/team_description.dart';
import 'package:nittfest/models/answers_response.dart';
import 'package:nittfest/models/preference_model.dart';
import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/services/api/api_manager.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

class FormsController extends GetxController with StateMixin<QuestionResponse> {
  var isPlaying = false.obs;
  var pageNumber = 0.obs;
  late int maxPage;
  late Artboard? treeArtboard;
  ApiManager api = ApiManager();
  final storage = Get.find<StorageServices>();
  late CarouselController buttonCarouselController;
  late List<TextEditingController> textControllers = List.empty(growable: true);
  List<Answer> answ = <Answer>[];
  var questions = <Question>[];
  final _preferences = List.filled(3, 'OC').obs;

  get preferences => _preferences;

  @override
  void onInit() async {
    buttonCarouselController = CarouselController();
    getFormQuestions(await storage.retriveDomain());
    if (!(await api.isPrefrencesFilled(await storage.retriveJWT()))) {
      showPreferences();
    }
    super.onInit();
  }

  getFormQuestions(String domain) async {
    String jwt = await storage.retriveJWT();
    api.getFormQuestions(domain, jwt).then((response) {
      maxPage = response.questions.length - 1;
      questions = response.questions;
      for (int i = 0; i < questions.length; i++) {
        textControllers.add(TextEditingController(text: questions[i].answer));
      }
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void nextPage() {
    if (pageNumber.value < maxPage) {
      buttonCarouselController.nextPage(
          duration: const Duration(milliseconds: 300));
      pageNumber.value++;
    } else {
      pageNumber.value = maxPage;
      submitAnswers();
    }
  }

  void previousPage() {
    if (pageNumber.value > 0) {
      buttonCarouselController.previousPage(
          duration: const Duration(milliseconds: 300));
      pageNumber.value--;
    } else {
      pageNumber.value = 0;
    }
  }

  void postPreferencesCheck() async {
    var set = HashSet<String>();
    bool isDuplicate = false;
    preferences.forEach((pref) {
      if (set.contains(pref)) {
        isDuplicate = true;
      }
    });
    if (isDuplicate) {
      Get.snackbar('Error', 'All the preferences should be Unique');
      return;
    } else {
      Get.dialog(Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          children: [
            const Text('Are You Sure ?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(onPressed: Get.back, child: const Text('No')),
                MaterialButton(
                    onPressed: () async {
                      await postPreferences();
                      storage.storePreferences(true);
                      Get.back();
                    },
                    child: const Text('Yes'))
              ],
            )
          ],
        ),
      ));
    }
  }

  Future<void> postPreferences() async {
    Preferences prefs = Preferences(
        preference1: preferences[0],
        preference2: preferences[1],
        preference3: preferences[2]);
    api.postPreference(await storage.retriveJWT(), prefs);
  }

  void showPreferences() {
    Get.dialog(
        Material(
            child: Center(
                child: SingleChildScrollView(
                    child: SingleChildScrollView(
                        child: Material(
                            type: MaterialType.transparency,
                            child: ClipRect(
                                child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 500),
                                        child: Container(
                                            padding: const EdgeInsets.all(40),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black
                                                  .withOpacity(0.79),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 20,
                                                ),
                                              ],
                                            ),
                                            child: Column(children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'PREFERENCES',
                                                    style:
                                                        GoogleFonts.eagleLake(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 40.0,
                                                      shadows: [
                                                        const Shadow(
                                                          offset:
                                                              Offset(5.0, 5.0),
                                                          blurRadius: 20.0,
                                                          color: Colors.white38,
                                                        ),
                                                      ],
                                                      color: const Color(
                                                          0xFFD4AF37),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              for (var pref = 0;
                                                  pref < 3;
                                                  ++pref)
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                          'Preferences ${pref + 1} : '),
                                                      Obx(
                                                        () => DropdownButton<
                                                            String>(
                                                          value:
                                                              preferences[pref],
                                                          items: data
                                                              .map((String
                                                                      value) =>
                                                                  DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                      value,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                    ),
                                                                  ))
                                                              .toList(),
                                                          onChanged: (value) =>
                                                              preferences[
                                                                  pref] = value,
                                                        ),
                                                      ),
                                                    ]),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              MaterialButton(
                                                onPressed: () async =>
                                                    postPreferencesCheck(),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                color: const Color(0xFFD4AF37),
                                                textColor: Colors.white,
                                                child: Text('Submit',
                                                    style:
                                                        GoogleFonts.eagleLake(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    )),
                                              ),
                                            ])))))))))),
        barrierDismissible: false);
  }

  void submitAnswers() async {
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
                  color: Colors.white,
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
                          'Are you sure?',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: MaterialButton(
                                textColor: const Color(0xFFD4AF37),
                                onPressed: submit,
                                child: Text(
                                  'Yes',
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

  void submit() async {
    if (answ.isNotEmpty) {
      answ.clear();
    }
    for (int i = 0; i < questions.length; i++) {
      answ.add(
          Answer(answer: textControllers[i].text, questionId: questions[i].id));
    }
    var answerResponse = AnswerResponse(answers: answ);
    api.postFormAnswers(answerResponse, await storage.retriveJWT()).then(
        (response) {
      Get.offAndToNamed(NavigationRoutes.inductionsHomeRoute);
    }, onError: (err) {});
  }
}
