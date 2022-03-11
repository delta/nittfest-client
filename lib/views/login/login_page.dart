import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:nittfest/controllers/login_controller.dart';
import 'package:nittfest/views/login/login_animation_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        const SizedBox(height: 20),
        const SizedBox(height: 400, child: LoginAnimation()),
        const SizedBox(height: 100),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(30, 30, 30, 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(
                  color: Color.fromRGBO(30, 30, 30, 1),
                  width: 2.0,
                ),
              ),
            ),
          ),
          child: SizedBox(
              width: 200,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Login with DAuth',
                    style: TextStyle(
                        color: Colors.lightGreenAccent.shade400, fontSize: 20)),
                const SizedBox(width: 10),
                SizedBox(
                    height: 30, child: Image.asset('assets/dauth_logo.png')),
              ])),
          onPressed: controller.navigateToEvents,
        ),
      ],
    )));
  }
}
