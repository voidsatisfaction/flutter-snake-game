import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snake_game/business_logic/GameScoreBusinessLogicComponent.dart';
import 'package:snake_game/db_model.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  bool loading = true;
  GameScoreBloc _gameScoreBloc;

  @override
  void initState() {
    super.initState();
    _gameScoreBloc = BlocProvider.of<GameScoreBloc>(context);

    _gameScoreBloc.add(GameScoreEvent.fetch);
  }

  Widget _starNumberWidget(
    int score,
    double starSize,
    double scoreSize,
  ) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.red[500],
            size: starSize,
          ),
          Text(
            '$score',
            style: TextStyle(
              fontSize: scoreSize,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRow(
    String name,
    int score,
    String message,
  ) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/trophy1.png',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        _starNumberWidget(
                          score,
                          25,
                          25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlainRow(
    String name,
    int score,
    String message,
    int ranking,
  ) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(
        top: 10,
        left: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '#$ranking',
              style: TextStyle(
                // fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                _starNumberWidget(score, 20, 20)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameScoreBloc, List<GameScore>>(
      builder: (context, gameScores) {
        return ListView.separated(
          padding: EdgeInsets.only(
            top: 0,
            left: 30,
            right: 30,
          ),
          itemCount: gameScores.length,
          itemBuilder: (context, i) {
            GameScore gameScore = gameScores[i];
            // top view
            if (i == 0) {
              return _buildTopRow(
                gameScore.name,
                gameScore.score,
                gameScore.message,
              );
            }

            return _buildPlainRow(
              gameScore.name,
              gameScore.score,
              gameScore.message,
              i + 1,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    );
  }
}
