import 'package:flutter/material.dart';
import 'package:nittfest/models/scores_response.dart';
import 'package:nittfest/widgets/scores/score_bar.dart';

class ScoresPodium extends StatelessWidget {
  final List<ScoresResponse> scoreResponse;
  const ScoresPodium({Key? key, required this.scoreResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreBar(height: 160, dept: scoreResponse[1]),
            ScoreBar(height: 180, dept: scoreResponse[0]),
            ScoreBar(height: 150, dept: scoreResponse[2])
          ]);
}
