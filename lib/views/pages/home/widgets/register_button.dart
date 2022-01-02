import 'package:flutter/material.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class RegisterButton extends StatelessWidget {
  final double buttonSize;
  const RegisterButton({Key? key, required this.buttonSize}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialButton(
        elevation: 15,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Text(
            'REGISTER',
            style: TextStyle(
              color: Colors.purple,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
              shadows: AppTheme.shadows,
              fontSize: buttonSize,
            ),
          ),
        ),
      );
}
