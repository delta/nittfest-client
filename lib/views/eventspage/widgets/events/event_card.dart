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

    controller.listKey.currentState
        ?.insertItem(index, duration: const Duration(milliseconds: 500));
    controller.eventItems = [...controller.eventItems];

    return Obx(() => Material(
        elevation: index == controller.eventIndex.value ? 100 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: index == controller.eventIndex.value
                    ? Colors.white
                    : Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(children: [
              SizedBox(
                  height: controller.eventIndex.value == index ? 150 : 125,
                  child: Ink.image(
                      image: AssetImage(events
                          .data[controller.clusterIndex.value][index].image),
                      fit: BoxFit.cover,
                      child: InkWell(onTap: () {
                        controller.eventIndex.value = index;
                      }))),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    events.data[controller.clusterIndex.value][index].title,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  )),
            ]))));
  }
}
