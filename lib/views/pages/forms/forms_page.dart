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
    ImageProvider bg = const AssetImage('assets/bg1.webp');
    return Scaffold(
      body: controller.obx(
        (questions) => Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(image: bg, fit: BoxFit.cover)),
          child: FormsPageResponsive(questionResponse: questions!),
        ),
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
