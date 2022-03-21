import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/config/themes.dart';
import 'package:nittfest/constants/screen_constants.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/widgets/bottom_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Container(
          decoration: BoxDecoration(gradient: AppTheme.bgs),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              PageView(
                controller: controller.pageController,
                children: widgetItems,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ]),
            bottomNavigationBar: const BottomBar(),
          )));
}
