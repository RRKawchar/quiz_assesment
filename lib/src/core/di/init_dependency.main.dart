
part of 'init_dependency.dart';

final getIt=GetIt.instance;

Future<void> initDependency()async{

  await TeXRenderingServer.start();
 await LocalStorageService.instance.initBox();

_questionInit();
_leaderboardInit();


}

void _questionInit(){
  getIt.registerFactory<QuestionLocalDataSource>(()=>QuestionLocalDataSourceImpl());
  getIt.registerFactory<QuestionRepository>(()=>QuestionRepositoryImpl(getIt()));
  getIt.registerFactory(()=>GetAllQuestionUseCase(getIt()));
  getIt.registerLazySingleton(()=>QuestionBloc(getIt()));
}

void _leaderboardInit(){
  getIt.registerFactory<LeaderboardLocalDataSource>(()=>LeaderboardLocalDataSourceImpl());
  getIt.registerFactory<LeaderboardRepository>(()=>LeaderboardRepositoryImpl(getIt()));
  getIt.registerFactory(()=>GetLeaderboardUseCase(getIt()));
  getIt.registerLazySingleton(()=>LeaderboardBloc(getIt()));
}