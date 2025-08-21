import 'package:equatable/equatable.dart';

class LeaderboardEntity extends Equatable{
  final String name;
  final int score;
  const LeaderboardEntity({required this.name,required this.score});

  @override
  List<Object?> get props => [
    name,
    score
  ];
}