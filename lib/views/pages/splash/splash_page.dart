import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/controllers/splash_controller.dart';
import 'package:nittfest/views/pages/forms/widgets/tree.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider bg = const AssetImage('bg1.webp');
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: bg, fit: BoxFit.fill)),
            child: Stack(children: [
              Positioned(
                  left: 50,
                  right: 50,
                  bottom: 30,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Tree())),
              Center(
                  child: Text(
                '404 \n Not Found',
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 8,
                    color: Colors.white),
              )),
            ])));
  }
}
