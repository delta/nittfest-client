import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/views/themes/app_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double size;
  const Footer({Key? key, required this.size}) : super(key: key);
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) => Text.rich(TextSpan(
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: size,
              shadows: AppTheme.shadows,
              color: Colors.white70),
          children: [
            const TextSpan(text: 'Made With '),
            const TextSpan(
              text: '💚',
            ),
            const TextSpan(
              text: ' By ',
            ),
            TextSpan(
              text: 'DeltaForce',
              style: const TextStyle(color: Colors.green),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _launchURL('https://delta.nitt.edu/'),
            ),
          ]));
}
