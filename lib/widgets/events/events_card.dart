import 'package:flutter/material.dart';
import 'package:nittfest/models/events_response.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final int index;
  const EventCard({Key? key, required this.event, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      height: 175,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.black54,
      ),
      child: Center(
          child: Stack(
        children: [
          Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                event.name ?? '',
                textAlign: TextAlign.center,
              ))
        ],
      )));
}
