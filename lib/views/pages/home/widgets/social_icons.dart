import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) => FabCircularMenu(
          fabOpenIcon: Image.asset(
            'assets/logo_nf.png',
            width: 20,
          ),
          ringColor: Colors.transparent,
          fabSize: 54,
          fabColor: Colors.white,
          fabOpenColor: Colors.black,
          ringDiameter: 300,
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            IconButton(
                icon: const Icon(FontAwesomeIcons.instagram),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/nittfest/')),
            IconButton(
                icon: const Icon(FontAwesomeIcons.facebook),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/nittfest/')),
            IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin),
                onPressed: () =>
                    _launchURL('https://www.instagram.com/nittfest/'))
          ]);
}
