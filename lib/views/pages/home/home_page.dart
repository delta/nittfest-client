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
    return AnimatedCrossFade(
        firstChild: Container(color: Colors.black45),
        duration: const Duration(milliseconds: 1000),
        crossFadeState: CrossFadeState.showSecond,
        secondChild: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: size.height, maxWidth: size.width),
            child: Scaffold(
              body: Stack(children: [
                Image.asset(
                  'assets/bg2.webp',
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.36))),
                HomeResponsive(),
              ]),
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
