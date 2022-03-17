import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/models/events_response.dart';

class ClusterCard extends StatelessWidget {
  final EventResponse cluster;
  final int index;
  const ClusterCard({Key? key, required this.cluster, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EventController>();
    return Obx(() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ChoiceChip(
            selectedColor: const Color.fromARGB(255, 249, 167, 20),
            selectedShadowColor: Colors.redAccent,
            backgroundColor: Colors.grey.shade300,
            elevation: 15,
            pressElevation: 5,
            labelStyle: TextStyle(
                color: controller.currentCluster.value == index
                    ? Colors.white
                    : Colors.black,
                fontWeight: controller.currentCluster.value == index
                    ? FontWeight.w700
                    : FontWeight.w100),
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            label: Text(
              cluster.cluster ?? '',
            ),
            onSelected: (selected) => controller.currentCluster.value = index,
            selected: controller.currentCluster.value == index)));
  }
}
