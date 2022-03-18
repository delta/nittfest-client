import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/models/events_response.dart';

class EventDetails extends StatelessWidget {
  final Event event;
  const EventDetails({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black87,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                    toolbarHeight: 50,
                    collapsedHeight: 50,
                    leading: IconButton(
                        onPressed: Get.back,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.amber,
                        )),
                    expandedHeight: 200,
                    flexibleSpace:
                        Image.asset('assets/bg.png', fit: BoxFit.cover)),
                SliverToBoxAdapter(
                  child: FloatingActionButton(
                      backgroundColor: Colors.deepPurple,
                      onPressed: () async => controller.playVideo(event),
                      child: const Icon(
                        Icons.tv,
                        color: Colors.amber,
                      )),
                )
              ],
            )));
  }
}
