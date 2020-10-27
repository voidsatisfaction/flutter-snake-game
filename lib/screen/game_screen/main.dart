import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:snake_game/screen/game_screen/custom_types.dart';
import 'package:snake_game/screen/game_screen/widgets/game_pad.dart';
import 'package:snake_game/screen/game_screen/widgets/game_board.dart';
import 'package:snake_game/utils.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

abstract class BoardEntity<T> {
  T getCoordinates();
}

class Item implements BoardEntity {
  Item({
    Key key,
    @required this.coordinate,
  });

  List<int> coordinate;

  @override
  List<int> getCoordinates() {
    return [...coordinate];
  }
}

class Snake implements BoardEntity {
  Snake({
    Key key,
    @required this.coordinates,
    @required this.direction,
  });

  List<List<int>> coordinates;
  List<int> beforeLastTail;
  Direction direction;
  Color headColor;
  Color bodyColor;

  final directionCoordinateMap = {
    Direction.down: [1, 0],
    Direction.right: [0, 1],
    Direction.up: [-1, 0],
    Direction.left: [0, -1],
  };

  void move() {
    final List<int> coordinate = directionCoordinateMap[direction];

    final List<int> newHead = [
      getHeadRow() + coordinate[0],
      getHeadColumn() + coordinate[1]
    ];

    beforeLastTail = coordinates.last;

    coordinates = [newHead, ...getCoordinates()];
    coordinates.removeLast();
  }

  void takeItem(Item item) {
    final head = getHead();

    if (listDeepEqual(head, item.getCoordinates())) {
      _addTail(beforeLastTail);
    }
  }

  void setDirection(Direction dir) {
    direction = dir;
  }

  Direction getDirection() {
    return direction;
  }

  List<int> getHead() {
    return [...coordinates[0]];
  }

  int getHeadRow() {
    return getHead()[0];
  }

  int getHeadColumn() {
    return getHead()[1];
  }

  List<List<int>> getCoordinates() {
    final List<List<int>> newCoordinates = [];

    for (final coordinate in coordinates) {
      newCoordinates.add([...coordinate]);
    }

    return newCoordinates;
  }

  void _addTail(List<int> coordinate) {
    coordinates = [...getCoordinates(), coordinate];
  }
}

// This class is Snake and board manager
class _MyHomePageState extends State<MyHomePage> {
  final int _boardSize = 12;

  Snake snake;
  Item item;

  Timer _frameTimer;
  int speed = 300;

  @override
  void initState() {
    super.initState();

    _startGame();
  }

  void _startGame() {
    int centerRow = _boardSize ~/ 2;
    int centerColumn = _boardSize ~/ 2;

    snake = Snake(
      coordinates: [
        [centerRow, centerColumn],
        [centerRow + 1, centerColumn],
        [centerRow + 2, centerColumn],
      ],
      direction: Direction.up,
    );
    item = Item(
      coordinate: _createRandomCoordinate(
        snake.getCoordinates(),
      ),
    );

    _frameTimer = Timer.periodic(
      new Duration(milliseconds: speed),
      (timer) {
        _frame();
      },
    );
  }

  void _frame() {
    // move snake
    snake.move();

    // judge collision
    _finishIfCollision();

    // item eating
    _takeItem();

    // render snake
    _render();
  }

  void _finishIfCollision() {
    void _gameOver() {
      _frameTimer.cancel();
    }

    final List<int> head = snake.getHead();
    final int headRow = snake.getHeadRow();
    final int headColumn = snake.getHeadColumn();

    final _currentSnakeLocationWithoutHead = snake.getCoordinates();
    _currentSnakeLocationWithoutHead.removeAt(0);

    // head edge collision
    if (headRow < 0 ||
        headColumn < 0 ||
        headRow >= _boardSize ||
        headColumn >= _boardSize) {
      _gameOver();
      return;
    }

    for (final location in _currentSnakeLocationWithoutHead) {
      if (listDeepEqual(head, location)) {
        _gameOver();
        return;
      }
    }
  }

  void _takeItem() {
    final head = snake.getHead();

    if (listDeepEqual(head, item.getCoordinates())) {
      snake.takeItem(item);
      final snakeCoordinates = snake.getCoordinates();
      item = Item(
        coordinate: _createRandomCoordinate(
          snakeCoordinates,
        ),
      );
    }
  }

  void _render() {
    setState(() {
      snake = snake;
      item = item;
    });
  }

  List<int> _createRandomCoordinate([List<List<int>> withoutCoordinates]) {
    final random = new Random();

    final List<int> randomCoordinate = [
      random.nextInt(_boardSize),
      random.nextInt(_boardSize),
    ];

    if (withoutCoordinates == null) {
      return randomCoordinate;
    }

    while (true) {
      bool doAgain = false;
      for (final coordinate in withoutCoordinates) {
        if (listDeepEqual(randomCoordinate, coordinate)) {
          doAgain = true;
        }
      }

      if (!doAgain) {
        return randomCoordinate;
      }

      randomCoordinate[0] = random.nextInt(_boardSize);
      randomCoordinate[1] = random.nextInt(_boardSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // game board
            Expanded(
              child: GameBoard(
                currentSnakeLocation: snake.getCoordinates(),
                itemLocation: item.getCoordinates(),
                boardSize: _boardSize,
                borderColor: Colors.grey,
                borderWidth: 0.2,
              ),
            ),
            // game pad
            GamePad(
              setDirection: snake.setDirection,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
