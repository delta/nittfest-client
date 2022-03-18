import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/constants/events.dart';
import 'package:nittfest/controllers/events_controller.dart';

class EventCard extends GetView<EventsController> {
  final int index;
  final int clusterIndex;
  const EventCard({Key? key, required this.index, required this.clusterIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Events();

    var controller = Get.find<EventsController>();

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SlideTransition(
            position: controller.offsetAnimation,
            child: OpenContainer(
                closedBuilder: (BuildContext context, void Function() action) =>
                    Material(
                        elevation:
                            index == controller.eventIndex.value ? 100 : 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                            // margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: index == controller.eventIndex.value
                                    ? Colors.white
                                    : Colors.grey,
                                width: 1,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: SizedBox(
                                height: 150,
                                child: Stack(children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                          events
                                              .data[clusterIndex][index].image,
                                          fit: BoxFit.fitWidth)),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Text(
                                        events.data[clusterIndex][index].title,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      )),
                                ])))),
                openBuilder: (BuildContext context,
                        void Function({Object? returnValue}) action) =>
                    SafeArea(
                        child: Material(
                            child: Column(children: [
                      Stack(children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 2),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                                events.data[clusterIndex][index].image,
                                fit: BoxFit.fill)),
                        Positioned(
                            top: 50,
                            left: MediaQuery.of(context).size.width / 2 - 125,
                            child: Stack(children: [
                              Text(
                                events.data[clusterIndex][index].title,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 32),
                              ),
                              Text(
                                events.data[clusterIndex][index].title,
                                style: TextStyle(
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1
                                      ..color = Colors.white,
                                    fontSize: 32),
                              )
                            ]))
                      ]),
                      const Divider(color: Colors.white, thickness: 0.5)
                    ]))))));
  }
}
