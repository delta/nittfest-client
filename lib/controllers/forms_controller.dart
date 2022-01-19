import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/models/answers_response.dart';
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

  @override
  void onInit() async {
    buttonCarouselController = CarouselController();
    getFormQuestions(await storage.retriveDomain());
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
