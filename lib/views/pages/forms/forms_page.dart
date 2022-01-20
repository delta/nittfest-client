import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/constants/break_points.dart';
import 'package:nittfest/controllers/forms_controller.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/utils/loader.dart';
import 'package:nittfest/views/pages/forms/responsive/forms_page_desktop.dart';
import 'package:nittfest/views/pages/forms/responsive/forms_page_phone.dart';

class FormsPage extends GetView<FormsController> {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: controller.obx(
        (questions) => Stack(children: [
          Image.asset(
            'assets/bg1.webp',
            height: size.height,
            width: size.width,
            fit: BoxFit.fill,
          ),
          Container(decoration: const BoxDecoration(color: Colors.black38)),
          FormsPageResponsive(questionResponse: questions!),
        ]),
        onLoading: const Loader(),
      ),
    );
  }
}

class FormsPageResponsive extends GetResponsiveView<HomeController> {
  final QuestionResponse questionResponse;
  FormsPageResponsive({Key? key, required this.questionResponse})
      : super(key: key, settings: BreakPoints.getResponsiveScreenSettings());

  @override
  Widget? desktop() => FormsPageDesktop(questionResponse: questionResponse);

  @override
  Widget? phone() => FormsPagePhone(questionResponse: questionResponse);
}
