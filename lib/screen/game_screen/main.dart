import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:snake_game/screen/game_screen/custom_types.dart';
import 'package:snake_game/screen/game_screen/widgets/game_pad.dart';
import 'package:snake_game/screen/game_screen/widgets/game_board.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  final int _boardSize = 12;

  Direction _currentSnakeDirection = Direction.up;
  List<List<int>> _currentSnakeLocation = [
    [6, 6],
    [7, 6],
    [8, 6]
  ];
  List<int> _itemLocation = [-1, -1];

  Timer _frameTimer;
  int speed = 300;

  @override
  void initState() {
    super.initState();

    _startGame();
  }

  void _startGame() {
    _itemLocation = _createRandomCoordinate(_currentSnakeLocation);

    Timer _frameTimer = Timer.periodic(
      new Duration(milliseconds: speed),
      (timer) {
        _frame();
      },
    );
  }

  void _frame() {
    // move snake
    final List<int> removedTail = _moveSnake();

    // judge collision
    _finishIfCollision();

    // item eating
    _takeItem(removedTail);

    // render snake
    _render();
  }

  List<int> _moveSnake() {
    final dirCoordinateMap = {
      Direction.down: [1, 0],
      Direction.right: [0, 1],
      Direction.up: [-1, 0],
      Direction.left: [0, -1],
    };

    final coordinate = dirCoordinateMap[_currentSnakeDirection];

    final head = _currentSnakeLocation[0];
    final newHead = [head[0] + coordinate[0], head[1] + coordinate[1]];

    _currentSnakeLocation.insert(0, newHead);
    return _currentSnakeLocation.removeLast();
  }

  void _finishIfCollision() {
    void _gameOver() {
      _frameTimer.cancel();
    }

    final head = _currentSnakeLocation[0];
    final int headRow = head[0];
    final int headColumn = head[1];
    final _currentSnakeLocationWithoutHead = [..._currentSnakeLocation];
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
      if (_listDeepEqual(head, location)) {
        _gameOver();
        return;
      }
    }
  }

  void _takeItem(List<int> removedTail) {
    final head = _currentSnakeLocation[0];

    if (_listDeepEqual(head, _itemLocation)) {
      _currentSnakeLocation.add(removedTail);
      _itemLocation = _createRandomCoordinate(_currentSnakeLocation);
    }
  }

  void _render() {
    setState(() {
      _currentSnakeLocation = [..._currentSnakeLocation];
      _itemLocation = [..._itemLocation];
    });
  }

  void _setDirection(Direction direction) {
    setState(() {
      _currentSnakeDirection = direction;
    });
  }

  bool _listDeepEqual(list1, list2) {
    return ListEquality().equals(list1, list2);
  }

  List<int> _createRandomCoordinate([List<List<int>> withoutCoordinates]) {
    final random = new Random();

    final randomCoordinate = [
      random.nextInt(_boardSize),
      random.nextInt(_boardSize),
    ];

    if (withoutCoordinates == null) {
      return randomCoordinate;
    }

    while (true) {
      bool doAgain = false;
      for (final coordinate in withoutCoordinates) {
        if (_listDeepEqual(randomCoordinate, coordinate)) {
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
                currentSnakeLocation: _currentSnakeLocation,
                itemLocation: _itemLocation,
                boardSize: _boardSize,
                borderColor: Colors.grey,
                borderWidth: 0.2,
              ),
            ),
            // game pad
            GamePad(
              setDirection: _setDirection,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
