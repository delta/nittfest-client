import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/widgets/events/event_details.dart';

class UpcomingEventsCard extends StatelessWidget {
  final Event event;
  final int index;
  const UpcomingEventsCard({Key? key, required this.event, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: size.width / 2.5,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.black54,
        ),
        child: InkWell(
            onTap: () => Get.to(EventDetails(event: event)),
            child: Center(
                child: Stack(
              children: [
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(
                      event.name!,
                      textAlign: TextAlign.center,
                    ))
              ],
            ))));
  }
}
