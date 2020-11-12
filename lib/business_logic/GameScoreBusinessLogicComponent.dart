import 'package:bloc/bloc.dart';
import 'package:snake_game/db_model.dart';
import 'package:snake_game/repository/game_score.dart';

enum GameScoreEvent { fetch }

class GameScoreBloc extends Bloc<GameScoreEvent, List<GameScore>> {
  final GameScoreRepository gameScoreRepository;

  GameScoreBloc({this.gameScoreRepository}) : super([]);

  @override
  Stream<List<GameScore>> mapEventToState(GameScoreEvent event) async* {
    final currentTopGameScores = state;

    switch (event) {
      case GameScoreEvent.fetch:
        final topGameScores = await gameScoreRepository.getTopScores(0, 10);
        yield [...currentTopGameScores, ...topGameScores];
        break;
      default:
        break;
    }
  }
}
