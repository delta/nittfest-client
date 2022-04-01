import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/widgets/events/events_card.dart';

class EventList extends StatelessWidget {
  final List<EventResponse> clusters;
  const EventList({Key? key, required this.clusters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return Obx(() => SliverList(
        delegate:
            SliverChildListDelegate(clusters[controller.currentCluster.value]
                .events
                .asMap()
                .map((i, event) => MapEntry(
                    i,
                    EventCard(
                      index: i,
                      event: event,
                      cluster:
                          clusters[controller.currentCluster.value].cluster ??
                              '',
                    )))
                .values
                .toList())));
  }
}
