import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nittfest/config/themes.dart';
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
    return Obx(() => Card(
        color: Colors.black87,
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.25),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppTheme.scoresbgCard),
            child: Wrap(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(scoresResponse.position,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ))),
                Row(
                  children: [
                    Container(
                      height: 72,
                      width: 72,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[16],
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.75, color: Colors.white)),
                      child: Image.asset(
                          'https://static.nittfest.org/images/departments/' +
                              scoresResponse.department +
                              '.png',
                          fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 10),
                    Column(children: [
                      Text(scoresResponse.department,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          )),
                      Text('Points: ${scoresResponse.totalPoints}',
                          style: const TextStyle(
                            fontSize: 12,
                          )),
                    ]),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: IconButton(
                        onPressed: () {
                          if (controller.expandedIndex.value == index) {
                            controller.expandedIndex.value = -1;
                          } else {
                            controller.expandedIndex.value = index;
                          }
                        },
                        icon: Icon(
                          controller.expandedIndex.value == index
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.white,
                        )))
              ]),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  child: controller.expandedIndex.value == index
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              const SizedBox(height: 10),
                              Divider(
                                color: Colors.grey.shade400,
                                height: 24,
                              ),
                              ...scoresResponse.clusterPoints
                                  .asMap()
                                  .map((i, value) => MapEntry(
                                      i,
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(value.cluster,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              const Spacer(),
                                              Text(value.points.toString(),
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ))))
                                  .values
                                  .toList(),
                            ])
                      : const SizedBox.shrink())
            ]))));
  }
}
