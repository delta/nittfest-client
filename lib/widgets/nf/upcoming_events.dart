import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/widgets/nf/upcoming_events_card.dart';

class UpcomingEvent extends GetView<EventController> {
  const UpcomingEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx((events) => Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: controller
              .upcomingEvents(events!)
              .asMap()
              .map((i, event) =>
                  MapEntry(i, UpcomingEventsCard(index: i, event: event)))
              .values
              .toList())));
}
