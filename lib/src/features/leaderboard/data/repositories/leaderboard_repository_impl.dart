import 'package:quiz_assesment/src/features/leaderboard/data/datasources/leaderboard_local_data_source.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/entities/leaderboard_entity.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/repositories/leaderboard_repository.dart';

class LeaderboardRepositoryImpl extends LeaderboardRepository{
  final LeaderboardLocalDataSource dataSource;
  LeaderboardRepositoryImpl(this.dataSource);

  @override
  List<LeaderboardEntity> getAllRankData() {
   return dataSource.getAllRankData();
  }

}