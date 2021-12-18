import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/inductions/widgets/register_button.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Image.asset(
            'assets/logo_nf.png',
            color: Colors.white,
            height: logoSize,
          )),
          const SizedBox(height: 10),
          Center(
              child: Text(
            'INDUCTIONS',
            style: TextStyle(
                fontSize: headerSize,
                fontWeight: FontWeight.w900,
                letterSpacing: 8,
                color: Colors.white),
          )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'We have taken each and every project handed over to us as a challenge, which has helped us achieve a high project success rate.We have taken each and every project handed over to us as a challenge, which has helped us achieve a high project success',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: bodySize,
                  color: Colors.white70),
            ),
          ),
          const SizedBox(height: 15),
          Center(child: RegisterButton(buttonSize: buttonSize))
        ],
      );
}
