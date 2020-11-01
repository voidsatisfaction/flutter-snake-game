import 'package:flutter/material.dart';

class GameScoreBoard extends StatelessWidget {
  GameScoreBoard({
    Key key,
    @required this.score,
    @required this.maxScore,
  });

  final int score;
  final int maxScore;

  @override
  Widget build(BuildContext context) {
    final int currentMaxScore = (maxScore > score) ? maxScore : score;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Score: $score",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "Max Score: $currentMaxScore",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
