import 'dart:ui';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/views/themes/app_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final Size buttonSize;
  const SocialIcons({Key? key, required this.buttonSize}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  void _contactDialog() {
    var data = [
      'Santosh - +91 95000 64685',
      'Nandika - +91 93611 21350',
      'Shelly -  +91 70103 32932'
    ];
    Get.dialog(Center(
        child: SingleChildScrollView(
            child: Material(
                type: MaterialType.transparency,
                child: ClipRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 700),
                            child: Container(
                                padding: const EdgeInsets.all(40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.79),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 0),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: Column(children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Contacts',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(5.0, 5.0),
                                            blurRadius: 20.0,
                                            color: Colors.white38,
                                          ),
                                        ],
                                        color: Color(0xFFD4AF37),
                                      ),
                                    ),
                                  ),
                                  for (var i = 0; i < data.length; ++i)
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          data[i],
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            shadows: [
                                              Shadow(
                                                offset: Offset(5.0, 5.0),
                                                blurRadius: 20.0,
                                                color: Colors.white38,
                                              ),
                                            ],
                                            color: Colors.white,
                                          ),
                                        )),
                                ]))))))))));
  }

  @override
  Widget build(BuildContext context) => FabCircularMenu(
          fabOpenIcon: Image.asset(
            'assets/logo_nf.png',
            width: 20,
            color: Colors.red,
          ),
          ringColor: Colors.transparent,
          fabSize: buttonSize.width < 400 ? (buttonSize.width / 400) * 54 : 54,
          fabColor: AppTheme.bodycolor,
          fabCloseIcon: const Icon(Icons.close, color: Colors.black),
          ringDiameter: 250,
          animationDuration: const Duration(milliseconds: 400),
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            IconButton(
                icon: Image.asset('assets/call.png',
                    height: 45, color: Colors.white),
                onPressed: _contactDialog),
            IconButton(
                icon: Image.asset('assets/instagram.png',
                    height: 45, color: Colors.white),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/nittfest/')),
            IconButton(
                icon: Image.asset('assets/fb.png',
                    height: 45, color: Colors.white),
                onPressed: () =>
                    _launchURL('https://www.facebook.com/NITTFEST')),
          ]);
}
