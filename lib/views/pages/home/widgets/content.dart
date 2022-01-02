import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/views/pages/home/widgets/register_button.dart';

class Content extends StatelessWidget {
  final double headerSize;
  final double logoSize;
  final double bodySize;
  final double buttonSize;

  const Content(
      {Key? key,
      required this.headerSize,
      required this.logoSize,
      required this.bodySize,
      required this.buttonSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/logo_nf.png',
            color: Colors.white,
            height: logoSize,
          ),
          Text(
            'INDUCTIONS',
            style: GoogleFonts.poppins(
                fontSize: headerSize,
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
                color: Colors.white),
          ),
          Text(
            'Witness The Battle Of Departments',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: bodySize,
                color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          RegisterButton(buttonSize: buttonSize)
        ],
      );
}
