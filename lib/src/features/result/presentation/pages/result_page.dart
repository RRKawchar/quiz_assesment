import 'package:flutter/material.dart';
import 'package:quiz_assesment/src/core/routes/routes_name.dart';
import 'package:quiz_assesment/src/core/services/local_storage_service.dart';
import 'package:quiz_assesment/src/core/utils/show_snackbar.dart';

class ResultPage extends StatefulWidget {
  final int score;
  final int totalQuestion;
  const ResultPage({super.key, required this.score, required this.totalQuestion});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final TextEditingController _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Score: ${widget.score}/${widget.totalQuestion}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()async{
                if(_nameController.text.isNotEmpty){
                  final storage = LocalStorageService.instance;
                  List<dynamic> leaderboard = storage.getData("leaderboard") ?? [];

                  leaderboard.add({
                    "name": _nameController.text,
                    "score": widget.score,
                  });

                  await storage.saveData("leaderboard", leaderboard);
                  Navigator.pushNamedAndRemoveUntil(context, RoutesName.homePage, (_)=>false);
                }else{
                  showSnackBar(context, "Please Enter your name");
                }


              },
              child: Text("Save Score",style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

