import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/views/themes/app_themes.dart';
import 'package:nittfest/controllers/home_controller.dart';

class RegisterButton extends StatelessWidget {
  final double buttonSize;

  const RegisterButton({Key? key, required this.buttonSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return MaterialButton(
      elevation: 15,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      onPressed: controller.login,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.purple.shade800,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w600,
            shadows: AppTheme.shadows,
            fontSize: buttonSize < 400 ? buttonSize * 0.8 : buttonSize,
          ),
        ),
      ),
    );
  }
}
