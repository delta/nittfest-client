import 'package:flutter/material.dart';
import 'package:nittfest/widgets/nf/logo.dart';
import 'package:nittfest/widgets/nf/profile.dart';
import 'package:nittfest/widgets/nf/upcoming_events.dart';

class NF extends StatelessWidget {
  const NF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
          height: size.height / 1.8,
          child: Stack(children: [
            Positioned(
                height: size.height / 4,
                width: size.width,
                child: Image.asset('assets/bg.png', fit: BoxFit.cover)),
            Positioned(
                left: 0,
                right: 0,
                top: size.height / 4 - 40,
                child: const Logo()),
            Positioned(
                top: size.height / 4 + 50,
                left: 0,
                right: 0,
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: const Profile()))
          ])),
      Container(
          padding: const EdgeInsets.all(10),
          child: const Text('Upcoming Events',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
      const Expanded(child: UpcomingEvent())
    ]);
  }
}
