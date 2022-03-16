import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/controllers/scores_controller.dart';

class NF extends GetView<ScoresController> {
  const NF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller.obx((scores) => Stack(children: [
            Positioned(
                height: 200,
                child: Image.asset('assets/bg.png', fit: BoxFit.cover)),
            Positioned(
              left: 0,
              right: 0,
              top: 200 - 40,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.redAccent,
                        spreadRadius: 1,
                      )
                    ],
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(240, 255, 180, 10),
                      Color.fromARGB(220, 255, 100, 20),
                    ]),
                    border: Border.all(
                        color: const Color.fromARGB(255, 150, 107, 10))),
                transform: Matrix4.identity()
                  ..setEntry(2, 1, 0.01)
                  ..rotateY(0.2),
              ),
            ),
            Positioned(
                top: 200,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ))
          ]));
}
