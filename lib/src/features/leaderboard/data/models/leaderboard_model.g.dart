// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardModel _$LeaderboardModelFromJson(Map<String, dynamic> json) =>
    LeaderboardModel(
      name: json['name'] as String,
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderboardModelToJson(LeaderboardModel instance) =>
    <String, dynamic>{'name': instance.name, 'score': instance.score};
