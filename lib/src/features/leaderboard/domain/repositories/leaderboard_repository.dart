import 'package:quiz_assesment/src/features/leaderboard/domain/entities/leaderboard_entity.dart';

abstract class LeaderboardRepository{
  List<LeaderboardEntity> getAllRankData();
}