import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/home_controller.dart';

class RegisterButton extends StatelessWidget {
  final double buttonSize;

  const RegisterButton({Key? key, required this.buttonSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return MaterialButton(
      elevation: 15,
      color: Colors.transparent,
      onPressed: controller.login,
      child: Image.asset('assets/register.png', width: buttonSize),
    );
  }
}
