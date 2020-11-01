import 'package:snake_game/utils.dart';

abstract class AModel<T> {
  String tableName;

  Map<String, dynamic> toMap();
}

const _gameScoreInitScript = """
  CREATE TABLE game_scores
    (
      id VARCHAR(64) PRIMARY KEY,
      name VARCHAR(256),
      score INTEGER,
      message VARCHAR(256),
      created_at VARCHAR(64)
    );

  CREATE INDEX score
    ON game_scores(score);
  
  CREATE INDEX created_at
    ON game_scores(created_at);
""";

class GameScore extends AModel {
  static const table_name = 'game_scores';

  final String id; // uuid
  final String name;
  final int score;
  final String message;
  final DateTime createdAt;

  GameScore({
    this.id,
    this.name,
    this.score,
    this.message,
    this.createdAt,
  });

  factory GameScore.fromMap(
    Map<String, dynamic> entityMap,
  ) {
    return GameScore(
      id: entityMap['id'],
      name: entityMap['name'],
      score: entityMap['score'],
      message: entityMap['message'],
      createdAt: DateTime.parse(entityMap['created_at']),
    );
  }

  factory GameScore.withoutId(
    String name,
    int score,
    String message,
    DateTime createdAt,
  ) {
    return GameScore(
      id: getUuid(),
      name: name,
      score: score,
      message: message,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'message': message,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

const INIT_SCRIPTS = [
  _gameScoreInitScript,
];
const MIGRATION_SCRIPTS = [];
