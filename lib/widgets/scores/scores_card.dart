import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nittfest/controllers/scores_controller.dart';
import 'package:nittfest/models/scores_response.dart';

class ScoresCard extends StatelessWidget {
  final ScoresResponse scoresResponse;
  final int index;
  const ScoresCard(
      {Key? key, required this.index, required this.scoresResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScoresController>();
    return Obx(() => InkWell(
        onTap: () {
          if (controller.expandedIndex.value == index) {
            controller.expandedIndex.value = -1;
          } else {
            controller.expandedIndex.value = index;
          }
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff121222)),
            child: Wrap(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(scoresResponse.position,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(),
                Text(scoresResponse.department,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(),
                Text(scoresResponse.totalPoints.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  child: controller.expandedIndex.value == index
                      ? Column(children: [
                          const SizedBox(height: 10),
                          const Divider(color: Colors.blueGrey, height: 10),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text('CLUSTER',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          ...scoresResponse.clusterPoints
                              .asMap()
                              .map((i, value) => MapEntry(
                                  i,
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(value.cluster,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          const Spacer(),
                                          Text(value.points.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ))))
                              .values
                              .toList(),
                        ])
                      : const SizedBox.shrink())
            ]))));
  }
}
