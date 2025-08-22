import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_assesment/src/core/utils/show_snackbar.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:quiz_assesment/src/features/leaderboard/presentation/bloc/leaderboard_event.dart';
import '../bloc/leaderboard_state.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {

  @override
  void initState() {
    super.initState();
    context.read<LeaderboardBloc>().add(GetAllRankDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard")),
      body:BlocConsumer<LeaderboardBloc,LeaderboardState>(
          listener: (context,state){
            if(state is LeaderboardErrorState){
              showSnackBar(context, state.message);
            }
          },
          builder: (context,state){
            if(state is LeaderboardLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is GetLeaderboardDataState){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: state.rankList.length,
                  itemBuilder: (context, index) {
                    final entry = state.rankList[index];
                    return ListTile(
                      leading: Text("#${index + 1}.",style: TextStyle(fontSize: 14),),
                      title: Text(entry.name,style: TextStyle(fontSize: 16),),
                      trailing: Text("Score: ${entry.score}"),
                    );
                  },
                ),
              );
            }else{
              return SizedBox.shrink();
            }
          },

          ),
    );




  }
}
