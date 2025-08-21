import 'package:quiz_assesment/src/core/services/local_storage_service.dart';
import 'package:quiz_assesment/src/features/leaderboard/data/models/leaderboard_model.dart';

abstract class LeaderboardLocalDataSource{
 List<LeaderboardModel> getAllRankData();
}

class LeaderboardLocalDataSourceImpl extends LeaderboardLocalDataSource{

  @override
  List<LeaderboardModel> getAllRankData() {
    final response=LocalStorageService.instance.getData<List<dynamic>>('leaderboard')??[];

     final data = response.map((item)=>LeaderboardModel.fromJson(Map<String, dynamic>.from(item))).toList();
    print("data check in here my data soureces : $response");
    data.sort((a, b) => (b.score).compareTo(a.score));
    return data;
  }

}