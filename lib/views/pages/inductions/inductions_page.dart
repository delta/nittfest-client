import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:nittfest/constants/break_points.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/inductions/responsive/inductions_page_desktop.dart';
import 'package:nittfest/views/pages/inductions/responsive/inductions_page_phone.dart';

class InductionsPage extends GetResponsiveView<InductionsController> {
  InductionsPage({Key? key})
      : super(key: key, settings: BreakPoints.getResponsiveScreenSettings());

  @override
  Widget? desktop() => const InductionsPageDesktop();

  @override
  Widget? phone() => const InductionsPagePhone();
}
