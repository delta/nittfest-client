import 'package:flutter/material.dart';
import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/views/pages/forms/widgets/card_content.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel_navigator.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class FormsPageDesktop extends StatelessWidget {
  final QuestionResponse questionResponse;
  const FormsPageDesktop({Key? key, required this.questionResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          top: 20,
          left: 50,
          child: Image.asset(
            'assets/logo_nf.png',
            color: AppTheme.bodycolor,
            width: 45,
          )),
      Carousel(
        children: questionResponse.questions
            .asMap()
            .map((i, value) => MapEntry(
                i,
                Center(
                    child: SizedBox(
                        width: 2000,
                        height: size.height,
                        child: CardContent(
                            index: (i + 1).toString(),
                            value: questionResponse.questions[i])))))
            .values
            .toList(),
      ),
      const Positioned(bottom: 10, right: 10, child: CarouselNavigator())
    ]);
  }
}
