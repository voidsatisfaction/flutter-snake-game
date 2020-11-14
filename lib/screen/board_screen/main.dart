import 'package:flutter/material.dart';

import 'package:snake_game/screen/board_screen/widgets/main_picture_widget.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final String _mainPictureURL = 'assets/images/chung_baram.jpg';
  final double _height = 210;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MainPictureWidget(
            mainPictureUrl: _mainPictureURL,
            height: _height,
          ),
        ],
      ),
    );
  }
}
