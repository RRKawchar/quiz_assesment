import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:quiz_assesment/src/features/leaderboard/domain/usecases/get_leaderboard_usecase.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/bloc/leaderboard_event.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/bloc/leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent,LeaderboardState>{
  final GetLeaderboardUseCase useCase;
  LeaderboardBloc(this.useCase):super(LeaderboardInitialState()){
    on<GetAllRankDataEvent>(_onGetAllRank);
  }

  void _onGetAllRank(GetAllRankDataEvent event,Emitter<LeaderboardState> emit){
    emit(LeaderboardLoadingState());
    try{
      final data = useCase.call();
      print("data in bloc $data");
      emit(GetLeaderboardDataState(data));
    }catch(e){
      emit(LeaderboardErrorState(e.toString()));
    }
  }

}