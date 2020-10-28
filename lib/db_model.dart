const _gameScoreInitScript = """
  CREATE TABLE game_scores
    (
      id INTEGER PRIMARY KEY,
      score INTEGER,
      message VARCHAR(256)
    );
""";

class GameScore {
  final int id;
  final int score;
  final String message;

  GameScore({this.id, this.score, this.message});
}

const INIT_SCRIPTS = [
  _gameScoreInitScript,
];
const MIGRATION_SCRIPTS = [];
