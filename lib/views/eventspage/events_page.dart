import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/views/eventspage/widgets/clusters/cluster_scroller.dart';
import 'package:nittfest/views/eventspage/widgets/events/event_list.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
              body: Column(
        children: [
          Container(
              height: 40,
              padding: const EdgeInsets.only(top: 8),
              color: Colors.black54,
              child: Center(child: Image.asset('assets/logo_nf.png'))),
          const ClusterScroller(),
          const SizedBox(height: 60),
          const EventList(),
        ],
      )));
}
