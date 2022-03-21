import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/config/themes.dart';
import 'package:nittfest/controllers/scores_controller.dart';
import 'package:nittfest/widgets/scores/scores_card.dart';
import 'package:nittfest/widgets/scores/scores_podium.dart';

class Scores extends GetView<ScoresController> {
  const Scores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RefreshIndicator(
      onRefresh: controller.getScores,
      child: controller.obx(
        (scores) => CustomScrollView(slivers: [
          SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: Image.asset('assets/bg.png', fit: BoxFit.cover)),
          SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child:
                      ScoresPodium(scoreResponse: controller.sort(scores!)))),
          SliverToBoxAdapter(
              child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: AppTheme.scoresbg,
                          border: Border.all(width: 0.5, color: Colors.white),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      padding:
                          const EdgeInsets.only(top: 30, right: 4, left: 4),
                      child: Column(
                          children: scores
                              .asMap()
                              .map((i, score) => MapEntry(
                                    i,
                                    ScoresCard(index: i, scoresResponse: score),
                                  ))
                              .values
                              .toList()))))
        ]),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      ));
}
