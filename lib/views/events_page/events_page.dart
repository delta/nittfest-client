import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/views/events_page/widgets/clusters/cluster_scroller.dart';
import 'package:nittfest/views/events_page/widgets/events/event_list.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                      height: 40,
                      padding: const EdgeInsets.only(top: 8),
                      color: Colors.black54,
                      child: Center(child: Image.asset('assets/logo_nf.png'))),
                  const ClusterScroller(),
                  const SizedBox(height: 60),
                  const EventList(),
                  SizedBox(
                      height: 70,
                      child: CurvedNavigationBar(
                          backgroundColor: Colors.transparent,
                          height: 40,
                          index: 1,
                          animationDuration: const Duration(milliseconds: 400),
                          animationCurve: Curves.easeInOut,
                          items: const <Widget>[
                            Icon(Icons.assessment,
                                size: 20, color: Colors.black),
                            Icon(Icons.app_registration_sharp,
                                size: 20, color: Colors.black),
                            Icon(Icons.wrap_text_sharp,
                                size: 20, color: Colors.black),
                          ],
                          onTap: (index) => log('Tapped index $index'))),
                ],
              ))));
}
