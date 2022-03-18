import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/constants/cluster.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/views/events_page/widgets/events/event_card.dart';

class EventList extends GetView<EventsController> {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventsController>();
    final clusters = Clusters();

    return Container(
      padding: const EdgeInsets.all(16),
      height: 335,
      width: double.infinity,
      child: ListView.builder(
          key: controller.listKey,
          scrollDirection: Axis.vertical,
          itemCount: clusters.data.length,
          itemBuilder: (context, index) => EventCard(
              index: index, clusterIndex: controller.clusterIndex.value)),
    );
  }
}
