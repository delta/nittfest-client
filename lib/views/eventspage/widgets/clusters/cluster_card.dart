import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/models/event_card_items.dart';

class ClusterCard extends GetView<EventsController> {
  final CardItem item;
  final int index;

  const ClusterCard({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(() => Material(
      elevation: index == controller.clusterIndex.value ? 100 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
          width: controller.clusterIndex.value == index ? 90 : 80,
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: index == controller.clusterIndex.value
                  ? Colors.white
                  : Colors.grey,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(children: [
            Ink.image(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
              child: InkWell(onTap: () {
                controller.startAnimation.value = false;
                controller.clusterIndex.value = index;
                controller.eventIndex.value = 0;
              }),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  item.title,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )),
          ]))));
}
