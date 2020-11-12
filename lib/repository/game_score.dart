import 'package:snake_game/data_provider/game_score.dart';
import 'package:snake_game/db_model.dart';
import 'package:sqflite/sqlite_api.dart';

class GameScoreRepository with GameScoreDataProvider {
  final Database db;

  GameScoreRepository({
    this.db,
  });

  Future<List<GameScore>> getTopScores(int page, int pageSize) async {
    int limit = pageSize;
    int offset = pageSize * (page - 1);

    final List<GameScore> gameScores = await getMaxScores(db, limit, offset);

    return gameScores;
  }
}
