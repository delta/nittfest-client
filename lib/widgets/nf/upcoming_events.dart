// import 'package:flutter/material.dart';
// import 'package:nittfest/models/events_response.dart';
// import 'package:nittfest/widgets/events/cluster_card.dart';
// import 'package:nittfest/widgets/nf/upcoming_events_card.dart';

// class UpcomingEvent extends StatelessWidget {
//   final List<EventResponse> events;
//   const UpcomingEvent({Key? key, required this.events}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 16,
//       ),
//       child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: events
//               .asMap()
//               .map((i, event) =>
//                   MapEntry(i, UpcomingEventsCard(index: i, event: event)))
//               .values
//               .toList()));
// }
