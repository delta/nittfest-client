import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/controllers/forms_controller.dart';

import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class CardContent extends StatelessWidget {
  final Question value;
  final String index;
  const CardContent({Key? key, required this.index, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormsController controller = Get.find<FormsController>();
    Size size = MediaQuery.of(context).size;
    var min = (size.width < size.height) ? size.width : size.height;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: size.width < 600 ? 6 : 10),
                        child: Text(
                          '$index -> ',
                          style: GoogleFonts.poppins(
                              fontSize: size.width < 600 ? min * 0.03 : 20,
                              shadows: AppTheme.shadows,
                              color: AppTheme.primaryColor),
                        ))),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        value.question,
                        style: GoogleFonts.poppins(
                            fontSize: size.width < 600 ? min * 0.05 : 36,
                            shadows: AppTheme.shadows,
                            color: AppTheme.bodycolor),
                      ),
                      SizedBox(height: min > 300 ? 20 : 10),
                      TextFormField(
                        autofocus: true,
                        showCursor: true,
                        cursorColor: AppTheme.primaryColor,
                        decoration: const InputDecoration(
                            hintText: 'Type Your Answer Here....'),
                        style: TextStyle(
                            fontSize: size.width < 600 ? min * 0.035 : 28,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: min > 300 ? 20 : 5),
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed:
                                controller.buttonCarouselController.nextPage,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppTheme.bodycolor)),
                            child: Text('OK',
                                style: GoogleFonts.poppins(
                                    fontSize:
                                        size.width < 600 ? min * 0.034 : 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryColor)),
                          ))
                    ])),
              ]),
        ]);
  }
}
