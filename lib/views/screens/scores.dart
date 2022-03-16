import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/controllers/scores_controller.dart';
import 'package:nittfest/widgets/scores/scores_card.dart';
import 'package:nittfest/widgets/scores/scores_podium.dart';

class Scores extends GetView<ScoresController> {
  const Scores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
        (scores) => CustomScrollView(slivers: [
          SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: Image.asset('assets/bg.png', fit: BoxFit.cover)),
          SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child:
                      ScoresPodium(scoreResponse: controller.sort(scores!)))),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(255, 255, 255, 0.09),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Position',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Department',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Divider(),
                  Text('Points', style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
          )),
          SliverList(
              delegate: SliverChildListDelegate(scores
                  .asMap()
                  .map((i, score) => MapEntry(
                        i,
                        ScoresCard(index: i, scoresResponse: score),
                      ))
                  .values
                  .toList()))
        ]),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      );
}
