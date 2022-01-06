import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:nittfest/models/card_content_model.dart';
import 'package:rive/rive.dart';

class FormsController extends GetxController {
  var isPlaying = false.obs;
  var pageNumber = 0.obs;
  var maxPage = 0.obs;
  late Artboard? treeArtboard;
  late CarouselController buttonCarouselController;
  late SMINumber growInput;

  @override
  void onInit() {
    buttonCarouselController = CarouselController();
    super.onInit();
  }

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
  void onRiveTreeInit(Artboard artboard) {
    final treeController =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(treeController);
    growInput = treeController.findInput<double>('input') as SMINumber;
  }

  void treeGrow() =>
      (growInput.value) < 100 ? growInput.change((growInput.value) + 10) : 100;

  void treeShrink() =>
      (growInput.value) >= 10 ? growInput.change((growInput.value) - 10) : 0;

  void nextPage() {
    if (pageNumber.value < maxPage.value) {
      buttonCarouselController.nextPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);
      pageNumber++;
      //treeGrow();
    } else {
      pageNumber.value = maxPage.value;
    }
  }

  void previousPage() {
    if (pageNumber.value > 0) {
      pageNumber--;
      buttonCarouselController.previousPage(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInCirc);
      //treeShrink();
    } else {
      pageNumber.value = 0;
    }
  }
}
