import 'package:flutter/material.dart';

import 'package:snake_game/screen/board_screen/widgets/main_picture_widget.dart';
import 'package:snake_game/screen/board_screen/widgets/title_widget.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final String _mainPictureURL = 'assets/images/chung_baram.jpg';
  final double _height = 210;

  final String _bandTitle = '블로거 청바람 모임';
  final bool _isPublicBand = false;
  final int _memberCount = 33;
  final Color _invitationColor = Colors.redAccent;
  final Color _writeButtonColor = Colors.redAccent;

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
          TitleWidget(
            bandTitle: _bandTitle,
            bandCategory: _isPublicBand ? '공개' : '비공개',
            memberCount: _memberCount,
            writeButtonColor: _writeButtonColor,
            invitationColor: _invitationColor,
          ),
        ],
      ),
    );
  }
}
