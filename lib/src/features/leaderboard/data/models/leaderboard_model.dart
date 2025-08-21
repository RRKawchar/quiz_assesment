import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/leaderboard_entity.dart';
part 'leaderboard_model.g.dart';
@JsonSerializable()
class LeaderboardModel extends LeaderboardEntity {
  final String name;
  final int score;
  const LeaderboardModel({
    required this.name,
    required this.score
  }): super(name: name, score: score);


  factory LeaderboardModel.fromJson(Map<String,dynamic> json)=> _$LeaderboardModelFromJson(json);
  Map<String,dynamic> toJson()=> _$LeaderboardModelToJson(this);
}
