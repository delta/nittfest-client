import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/controllers/dashboard_controller.dart';
import 'package:nittfest/widgets/nf/upcoming_events_card.dart';

class UpcomingEvent extends GetView<DashboardController> {
  const UpcomingEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
      (dashboard) => Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: dashboard!.upcomingEvents
                  .asMap()
                  .map((i, event) =>
                      MapEntry(i, UpcomingEventsCard(index: i, event: event)))
                  .values
                  .toList())),
      onEmpty: const Center(
          child: Text(
        'No Upcoming Events Yet \nStay Tuned!',
        textAlign: TextAlign.center,
      )));
}
