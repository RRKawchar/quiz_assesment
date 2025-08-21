import 'package:quiz_assesment/src/features/leaderboard/domain/entities/leaderboard_entity.dart';

abstract class LeaderboardState{}

class LeaderboardInitialState extends LeaderboardState{}

class LeaderboardLoadingState extends LeaderboardState{}

class GetLeaderboardDataState extends LeaderboardState{
  final List<LeaderboardEntity> rankList;
  GetLeaderboardDataState(this.rankList);
}


class LeaderboardErrorState extends LeaderboardState{
  final String message;
  LeaderboardErrorState(this.message);
}