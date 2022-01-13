import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:nittfest/models/card_content_model.dart';
import 'package:rive/rive.dart';

class FormsController extends GetxController {
  var isPlaying = false.obs;
  var pageNumber = 0.obs;
  late int maxPage;
  late Artboard? treeArtboard;
  late CarouselController buttonCarouselController;
  late SMINumber growInput;

  var content = [
    CardContentModel(
        question: 'What talent would you show off in a talent show?',
        hint:
            'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
    CardContentModel(
        question: 'What talent would you show off in a talent show?',
        hint:
            'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
    CardContentModel(
        question: 'What talent would you show off in a talent show?',
        hint:
            'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
    CardContentModel(
        question: 'What talent would you show off in a talent show?',
        hint:
            'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
    CardContentModel(
        question: 'What talent would you show off in a talent show?',
        hint:
            'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)')
  ];

  @override
  void onInit() {
    buttonCarouselController = CarouselController();
    maxPage = content.length;
    super.onInit();
  }

  void onRiveTreeInit(Artboard artboard) {
    final treeController =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(treeController);
    growInput = treeController.findInput<double>('input') as SMINumber;
  }

  void nextPage() {
    if (pageNumber.value < maxPage) {
      buttonCarouselController.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);
    } else {
      pageNumber.value = maxPage;
    }
  }

  void previousPage() {
    if (pageNumber.value > 0) {
      buttonCarouselController.previousPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);
    } else {
      pageNumber.value = 0;
    }
  }
}
