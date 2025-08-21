import 'package:quiz_assesment/src/features/leaderboard/domain/entities/leaderboard_entity.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/repositories/leaderboard_repository.dart';

class GetLeaderboardUseCase{
  final LeaderboardRepository repository;
  GetLeaderboardUseCase(this.repository);

  List<LeaderboardEntity> call(){
    return repository.getAllRankData();
  }
}