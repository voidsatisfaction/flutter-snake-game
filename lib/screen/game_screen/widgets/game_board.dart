import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  GameBoard({
    Key key,
    @required this.currentSnakeLocation,
    @required this.itemLocation,
    @required this.borderColor,
    @required this.borderWidth,
    @required this.boardSize,
  });

  final List<List<int>> currentSnakeLocation;
  final List<int> itemLocation;
  final int boardSize;
  final Color borderColor;
  final double borderWidth;

  bool _isSnakeHead(List<List<int>> currentSnakeLocation, int row, int column) {
    return currentSnakeLocation[0][0] == row &&
        currentSnakeLocation[0][1] == column;
  }

  bool _isSnakeBody(List<List<int>> currentSnakeLocation, int row, int column) {
    if (currentSnakeLocation[0][0] == row &&
        currentSnakeLocation[0][1] == column) {
      return false;
    }

    for (final location in currentSnakeLocation) {
      if (location[0] == row && location[1] == column) {
        return true;
      }
    }

    return false;
  }

  bool _isItem(List<int> itemLocation, int row, int column) {
    return itemLocation[0] == row && itemLocation[1] == column;
  }

  Widget _drawSnakeBody(Color color) {
    return Container(
      color: color,
    );
  }

  Widget _drawItem(Color color) {
    return Container(
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: boardSize,
      children: List.generate(
        boardSize * boardSize,
        (index) {
          final int row = index ~/ boardSize;
          final int column = index % boardSize;

          if (_isSnakeHead(currentSnakeLocation, row, column)) {
            return _drawSnakeBody(Colors.lightGreenAccent);
          }

          if (_isSnakeBody(currentSnakeLocation, row, column)) {
            return _drawSnakeBody(Colors.lightGreen);
          }

          if (_isItem(itemLocation, row, column)) {
            return _drawItem(Colors.lightBlue);
          }

          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: borderWidth),
                left: BorderSide(width: borderWidth),
                right: BorderSide(width: borderWidth),
                bottom: BorderSide(width: borderWidth),
              ),
            ),
          );
        },
      ),
    );
  }
}
