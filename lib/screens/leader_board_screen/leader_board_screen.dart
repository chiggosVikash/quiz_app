import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoardScreen extends ConsumerWidget {
  static const routeAddress = "/leaderBoardScreen";

  const LeaderBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard"),),
      body: ListView.builder(itemBuilder: (context,index){
       return ListTile(
         leading: CircleAvatar(child: Icon(Icons.person),),
         subtitle: Text("Score $index"),
         title: Text("Your Name"),
         trailing: Text("Rank $index"),
       );
      }),
    );
  }
}
