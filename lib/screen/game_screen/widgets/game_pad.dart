import 'package:flutter/material.dart';

import 'package:snake_game/screen/game_screen/custom_types.dart';

class GamePad extends StatelessWidget {
  GamePad({
    Key key,
    @required this.setDirection,
  });

  final ValueChanged<Direction> setDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setDirection(Direction.left);
                  },
                  iconSize: 50,
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () {
                    setDirection(Direction.up);
                  },
                  iconSize: 50,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: () {
                    setDirection(Direction.down);
                  },
                  iconSize: 50,
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setDirection(Direction.right);
                  },
                  iconSize: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
