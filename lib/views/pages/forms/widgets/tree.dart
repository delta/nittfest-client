import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:nittfest/controllers/splash_controller.dart';
import 'package:rive/rive.dart';

class Tree extends StatelessWidget {
  const Tree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();
    return GestureDetector(
      child: RiveAnimation.asset(
        'assets/tree.riv',
        fit: BoxFit.fill,
        onInit: controller.onRiveTreeInit,
      ),
      onTap: controller.treeGrow,
    );
  }
}
