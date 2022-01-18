import 'package:flutter/material.dart';
import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/views/pages/forms/widgets/card_content.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel_navigator.dart';

class FormsPagePhone extends StatelessWidget {
  final QuestionResponse questionResponse;
  const FormsPagePhone({Key? key, required this.questionResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          top: 10,
          left: 10,
          child: Image.asset(
            'assets/logo_nf.png',
            color: Colors.white,
            width: 25,
          )),
      Carousel(
        children: questionResponse.questions
            .asMap()
            .map((i, value) => MapEntry(
                i,
                Center(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: size.width,
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
