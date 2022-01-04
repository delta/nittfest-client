import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nittfest/constants/break_points.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/home/responsive/home_page_desktop.dart';
import 'package:nittfest/views/pages/home/responsive/home_page_phone.dart';
import 'package:nittfest/views/pages/home/widgets/social_icons.dart';

class HomePage extends GetView<InductionsController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider bg = const AssetImage('bg1.webp');
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(image: DecorationImage(image: bg, fit: BoxFit.cover)),
        child: HomeResponsive(),
      ),
      floatingActionButton: const SocialIcons(),
    );
  }
}

class HomeResponsive extends GetResponsiveView<InductionsController> {
  HomeResponsive({Key? key})
      : super(key: key, settings: BreakPoints.getResponsiveScreenSettings());

  @override
  Widget? desktop() => const HomePageDesktop();

  @override
  Widget? phone() => const HomePagePhone();
}
