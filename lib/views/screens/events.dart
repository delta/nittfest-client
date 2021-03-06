import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/widgets/events/app_bar.dart';
import 'package:nittfest/widgets/events/cluster_list.dart';
import 'package:nittfest/widgets/events/events_list.dart';

class Events extends GetView<EventController> {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RefreshIndicator(
      onRefresh: controller.getEvents,
      child: controller.obx(
        (clusters) => CustomScrollView(slivers: [
          SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: Image.asset('assets/bg.png', fit: BoxFit.cover)),
          const SliverToBoxAdapter(child: SearchBar()),
          SliverToBoxAdapter(
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Clusters',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )))),
          SliverToBoxAdapter(
              child:
                  SizedBox(height: 50, child: ClustersList(events: clusters!))),
          SliverToBoxAdapter(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Divider(
                    color: Colors.blueGrey,
                  ))),
          SliverToBoxAdapter(
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(() => Text(
                            clusters[controller.currentCluster.value].cluster ??
                                '',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ))))),
          EventList(clusters: clusters)
        ]),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      ));
}
