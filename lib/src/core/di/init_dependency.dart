import 'package:flutter_tex/flutter_tex.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_assesment/src/core/services/local_storage_service.dart';
import 'package:quiz_assesment/src/features/leaderboard/data/datasources/leaderboard_local_data_source.dart';
import 'package:quiz_assesment/src/features/leaderboard/data/repositories/leaderboard_repository_impl.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/usecases/get_leaderboard_usecase.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:quiz_assesment/src/features/quiz/domain/repositories/question_repository.dart';
import 'package:quiz_assesment/src/features/quiz/presentation/bloc/question_bloc.dart';

import '../../features/quiz/data/datasources/question_local_data_source.dart';
import '../../features/quiz/data/repositories/question_repository_impl.dart';
import '../../features/quiz/domain/usecases/get_question_usecase.dart';

part 'init_dependency.main.dart';