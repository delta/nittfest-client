import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/constants/break_points.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/views/pages/home/responsive/home_page_desktop.dart';
import 'package:nittfest/views/pages/home/responsive/home_page_phone.dart';
import 'package:nittfest/views/pages/home/widgets/social_icons.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('${size.width} ${size.height}');
    return Obx(() => AnimatedCrossFade(
        firstChild: Container(color: Colors.black45),
        duration: const Duration(milliseconds: 1000),
        crossFadeState: controller.crossFadeState.value,
        secondChild: Scaffold(
          body: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: controller.bg, fit: BoxFit.cover)),
              child: Stack(children: [
                Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.36))),
                HomeResponsive(),
              ])),
          floatingActionButton: SocialIcons(buttonSize: size),
        )));
  }
}

class HomeResponsive extends GetResponsiveView<HomeController> {
  HomeResponsive({Key? key})
      : super(key: key, settings: BreakPoints.getResponsiveScreenSettings());

  @override
  Widget? desktop() => const HomePageDesktop();

  @override
  Widget? phone() => const HomePagePhone();
}
