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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GamePadButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setDirection(Direction.left);
                  },
                  iconSize: 50,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GamePadButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () {
                    setDirection(Direction.up);
                  },
                  iconSize: 50,
                ),
                GamePadButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: () {
                    setDirection(Direction.down);
                  },
                  iconSize: 50,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GamePadButton(
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

class GamePadButton extends StatelessWidget {
  GamePadButton({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.iconSize,
  });

  final VoidCallback onPressed;
  final Icon icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: iconSize,
    );
  }
}
