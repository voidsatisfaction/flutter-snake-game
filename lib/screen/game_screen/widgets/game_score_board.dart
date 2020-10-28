import 'package:flutter/material.dart';

class GameScoreBoard extends StatelessWidget {
  GameScoreBoard({
    Key key,
    @required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Score: $score", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
