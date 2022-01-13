import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class Footer extends StatelessWidget {
  final double size;
  const Footer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'Made with 💚 by DeltaForce & Graphique',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: size,
              shadows: AppTheme.shadows,
              color: Colors.white70),
        ),
      );
}
