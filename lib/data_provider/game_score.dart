import 'package:snake_game/db_model.dart';
// FIXME: not use db itself but some interface or wrapping class
import 'package:sqflite/sqflite.dart';

mixin GameScoreDataProvider {
  final gameScoreTableName = GameScore.table_name;

  Future<GameScore> createGameScore(
    Database db,
    GameScore gameScore,
  ) async {
    await db.insert(
      gameScoreTableName,
      gameScore.toMap(),
    );

    return gameScore;
  }

  Future<List<GameScore>> getGameScores(
    Database db,
    List<String> ids,
  ) async {
    final List<Map<String, dynamic>> rawGameScores = await db.query(
      gameScoreTableName,
      // sync with the number of ids and ?
      where: "id IN (${ids.map((_) => '?').join(', ')})",
      whereArgs: ids,
    );

    return [
      for (final rawGameScore in rawGameScores) GameScore.fromMap(rawGameScore)
    ];
  }

  Future<List<GameScore>> getAllGameScores(
    Database db,
  ) async {
    final List<Map<String, dynamic>> rawGameScores = await db.query(
      gameScoreTableName,
    );

    return [
      for (final rawGameScore in rawGameScores) GameScore.fromMap(rawGameScore)
    ];
  }

  Future<List<GameScore>> getMaxScores(
    Database db,
    int limit,
    int offset,
  ) async {
    final List<Map<String, dynamic>> maxRawGameScores = await db.query(
      gameScoreTableName,
      orderBy: 'score DESC',
      limit: limit,
      offset: offset,
    );

    return [
      for (final maxRawGameScore in maxRawGameScores)
        GameScore.fromMap(maxRawGameScore)
    ];
  }
}
