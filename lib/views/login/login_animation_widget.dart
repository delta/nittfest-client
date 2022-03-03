import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/login_controller.dart';
import 'package:rive/rive.dart';

class LoginAnimation extends GetView<LoginController> {
  const LoginAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SafeArea(
      child: Scaffold(
          body: SizedBox(
              height: 400,
              width: 400,
              child: RiveAnimation.asset(
                'assets/rive/login_animation.riv',
                animations: ['Appearing'],
              ))));
}
