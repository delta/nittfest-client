import 'package:flutter/material.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/widgets/events/cluster_card.dart';

class ClustersList extends StatelessWidget {
  final List<EventResponse> events;
  const ClustersList({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: events
              .asMap()
              .map((i, cluster) =>
                  MapEntry(i, ClusterCard(index: i, cluster: cluster)))
              .values
              .toList()));
}
