import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/controllers/forms_controller.dart';
import 'package:nittfest/models/card_content_model.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class CardContent extends StatelessWidget {
  final CardContentModel value;
  final String index;
  const CardContent({Key? key, required this.index, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormsController controller = Get.find<FormsController>();
    Size size = MediaQuery.of(context).size;
    var min = (size.width < size.height) ? size.width : size.height;
    return Center(
        child: SizedBox(
            width: 2000,
            height: size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: size.width < 600 ? 6 : 10),
                                child: Text(
                                  '$index-> ',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          size.width < 600 ? min * 0.03 : 20,
                                      color: AppTheme.bodycolorDark),
                                ))),
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text(
                                value.question!,
                                style: GoogleFonts.poppins(
                                    fontSize:
                                        size.width < 600 ? min * 0.06 : 36,
                                    color: AppTheme.bodycolor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                value.hint!,
                                style: GoogleFonts.poppins(
                                    fontSize:
                                        size.width < 600 ? min * 0.04 : 22,
                                    color: AppTheme.bodycolorDark),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: min > 300 ? 20 : 10),
                              TextFormField(
                                autofocus: true,
                                showCursor: true,
                                decoration: const InputDecoration(
                                    hintText: 'Type Your Answer Here....'),
                                style: TextStyle(
                                    fontSize:
                                        size.width < 600 ? min * 0.05 : 28,
                                    fontFamily: 'Poppins'),
                              ),
                              SizedBox(height: min > 300 ? 10 : 5),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: TextButton(
                                    onPressed: controller
                                        .buttonCarouselController.nextPage,
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppTheme.bodycolor)),
                                    child: Text('OK',
                                        style: GoogleFonts.poppins(
                                            fontSize: size.width < 600
                                                ? min * 0.04
                                                : 22,
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.primaryColor)),
                                  ))
                            ])),
                      ]),
                ])));
  }
}
