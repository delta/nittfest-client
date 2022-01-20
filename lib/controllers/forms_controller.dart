import 'dart:collection';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nittfest/constants/team_description.dart';
import 'package:nittfest/models/answers_response.dart';
import 'package:nittfest/models/preference_model.dart';
import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/services/api/api_manager.dart';
import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/views/routes/navigation_routes.dart';
import 'package:get/get.dart';

class FormsController extends GetxController with StateMixin<QuestionResponse> {
  var isPlaying = false.obs;
  var pageNumber = 0.obs;
  late int maxPage;
  ApiManager api = ApiManager();
  final storage = Get.find<StorageServices>();
  late CarouselController buttonCarouselController;
  late List<TextEditingController> textControllers = List.empty(growable: true);
  List<Answer> answ = <Answer>[];
  var questions = <Question>[];
  final _preferences = List.filled(6, 'OC').obs;
  var isButtonEnabled = true.obs;
  get preferences => _preferences;
  bool isPreferenceFilled = false;
  @override
  void onInit() async {
    buttonCarouselController = CarouselController();
    getFormQuestions();
    super.onInit();
  }

  getFormQuestions() async {
    String jwt = await storage.retriveJWT();
    var domain = Get.parameters['domain'];
    api.getFormQuestions(domain!, jwt).then((response) async {
      maxPage = response.questions.length - 1;
      questions = response.questions;
      for (int i = 0; i < questions.length; i++) {
        textControllers.add(TextEditingController(text: questions[i].answer));
      }
      change(response, status: RxStatus.success());
      isPreferenceFilled =
          await api.isPrefrencesFilled(await storage.retriveJWT());
      if (!isPreferenceFilled) {
        showPreferences();
      }
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
      set.add(pref);
    });
    if (isDuplicate) {
      isButtonEnabled.value = true;
      Get.snackbar('Error', 'All the preferences should be Unique',
          backgroundColor: Colors.red.withOpacity(0.5));
      return;
    } else {
      await postPreferences();

      Get.back();
    }
  }

  Future<void> postPreferences() async {
    Preferences prefs = Preferences(
        preference1: preferences[0],
        preference2: preferences[1],
        preference3: preferences[2],
        preference4: preferences[3],
        preference5: preferences[4],
        preference6: preferences[5]);
    isPreferenceFilled =
        await api.postPreference(await storage.retriveJWT(), prefs);
  }

  void showPreferences() {
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
                  child: Column(children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'PREFERENCES',
                          style: TextStyle(
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
                    for (var pref = 0; pref < 6; ++pref)
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Preferences ${pref + 1} : ',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFFD4AF37),
                                )),
                            Obx(
                              () => DropdownButton<String>(
                                value: preferences[pref],
                                items: data
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) => preferences[pref] = value,
                              ),
                            ),
                          ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => MaterialButton(
                          onPressed: () async {
                            if (isButtonEnabled.value) {
                              isButtonEnabled.value = false;
                              postPreferencesCheck();
                            }
                          },
                          padding: const EdgeInsets.all(16),
                          color: const Color(0xFFD4AF37),
                          textColor: Colors.white,
                          child: isButtonEnabled.value
                              ? const Text('SUBMIT',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ))
                              : const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                        )),
                  ])),
            ),
          ),
        ),
      ))),
      barrierDismissible: false,
    );
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
                  color: Colors.black,
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
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Are you sure?',
                          style: TextStyle(
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
                                child: const Text(
                                  'Yes',
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

  void submit() async {
    if (isPreferenceFilled) {
      if (answ.isNotEmpty) {
        answ.clear();
      }
      for (int i = 0; i < questions.length; i++) {
        answ.add(Answer(
            answer: textControllers[i].text, questionId: questions[i].id));
      }
      var answerResponse = AnswerResponse(answers: answ);
      api.postFormAnswers(answerResponse, await storage.retriveJWT()).then(
          (response) {
        Get.snackbar('Success',
            'Response has been Successfully Submitted and Can be Edited Later',
            backgroundColor: Colors.green.withOpacity(0.5));
        Get.offAndToNamed(NavigationRoutes.inductionsHomeRoute);
      }, onError: (err) {
        Get.snackbar('Error', 'Error While Submitting',
            backgroundColor: Colors.red.withOpacity(0.5));
        Get.offAndToNamed(NavigationRoutes.inductionsHomeRoute);
      });
    } else {
      showPreferences();
    }
  }
}
