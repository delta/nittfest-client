import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nittfest/views/themes/app_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final Size buttonSize;
  const SocialIcons({Key? key, required this.buttonSize}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) => FabCircularMenu(
          fabOpenIcon: Image.asset(
            'assets/logo_nf.png',
            width: 20,
            color: Colors.purple,
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
                icon: const Icon(FontAwesomeIcons.instagram),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/nittfest/')),
            IconButton(
                icon: const Icon(FontAwesomeIcons.facebook),
                onPressed: () =>
                    _launchURL('https://www.facebook.com/NITTFEST')),
            IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin),
                onPressed: () =>
                    _launchURL('https://www.linkedin.com/company/nittfest/'))
          ]);
}
