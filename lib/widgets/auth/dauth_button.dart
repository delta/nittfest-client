import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/auth_controller.dart';
import 'package:nittfest/config/themes.dart';

class DauthButton extends StatelessWidget {
  const DauthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Container(
        width: 250,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Obx(
          () => TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 28,
                      child: !controller.isLoading.value
                          ? Image.asset(
                              'assets/delta_logo.png',
                            )
                          : const CircularProgressIndicator(
                              color: Colors.green,
                            ),
                    )),
                const Expanded(
                  child: Text(
                    'Login with DAuth',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(16),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppTheme.primarydarkcolor),
                shadowColor:
                    MaterialStateProperty.all<Color>(AppTheme.primarydarkcolor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black)))),
            onPressed: !controller.isLoading.value ? controller.login : null,
          ),
        ));
  }
}
