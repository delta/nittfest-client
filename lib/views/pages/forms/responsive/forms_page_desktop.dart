import 'package:flutter/material.dart';
import 'package:nittfest/models/card_content_model.dart';
import 'package:nittfest/views/pages/forms/widgets/card_content.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel.dart';
// import 'package:nittfest/views/pages/forms/widgets/carousel.dart';
// import 'package:nittfest/views/pages/forms/widgets/tree.dart';
// import 'package:nittfest/views/themes/app_themes.dart';
// import 'package:nittfest/views/pages/forms/widgets/card_content.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel_navigator.dart';

class FormsPageDesktop extends StatelessWidget {
  const FormsPageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var content = [
      CardContentModel(
          question: 'What talent would you show off in a talent show?',
          hint:
              'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
      CardContentModel(
          question: 'What talent would you show off in a talent show?',
          hint:
              'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
      CardContentModel(
          question: 'What talent would you show off in a talent show?',
          hint:
              'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
      CardContentModel(
          question: 'What talent would you show off in a talent show?',
          hint:
              'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)'),
      CardContentModel(
          question: 'What talent would you show off in a talent show?',
          hint:
              'Thanks for showing your interest in Chroma\'22. We need to know your name (in case you win XD)')
    ];
    return Scaffold(
        body: Stack(children: [
      Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('bg.png'), fit: BoxFit.cover))),
      Positioned(
          top: 20,
          left: 50,
          child: Image.asset(
            'assets/logo_nf.png',
            color: Colors.white,
            width: 45,
          )),
      Carousel(
        children: content
            .asMap()
            .map((i, value) => MapEntry(
                i, CardContent(index: (i + 1).toString(), value: value)))
            .values
            .toList(),
      ),
      const Positioned(bottom: 10, right: 10, child: CarouselNavigator())
    ]));
  }
}
