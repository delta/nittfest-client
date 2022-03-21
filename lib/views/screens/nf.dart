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
                height: 200,
                width: size.width,
                child: Image.asset('assets/bg.png', fit: BoxFit.cover)),
            Positioned(
                left: 0,
                right: 0,
                top: 200 - size.height / 24,
                child: const Logo()),
            Positioned(
                top: size.height / 4 + 20,
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
          padding: const EdgeInsets.only(bottom: 14),
          child: const Text('Upcoming Events',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900))),
      const Expanded(child: UpcomingEvent())
    ]);
  }
}
