import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/constants/cluster.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/views/eventspage/widgets/clusters/cluster_card.dart';

class ClusterScroller extends GetView<EventsController> {
  const ClusterScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clusters = Clusters();

    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.all(16),
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: clusters.data.length,
        itemBuilder: (context, index) => ClusterCard(item: clusters.data[index], index: index),
      ),
    );
  }
}
