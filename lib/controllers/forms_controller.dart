import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:nittfest/models/card_content_model.dart';
import 'package:rive/rive.dart';

class FormsController extends GetxController {
  var isPlaying = false.obs;
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
}
