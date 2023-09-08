import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/loding_indicators/in_processing_indicator.dart';
import 'package:quiz_app/providers/leader_board_provider/leader_board_provider.dart';


class LeaderBoardScreen extends ConsumerStatefulWidget {
  static const routeAddress = "/leaderBoardScreen";
  const LeaderBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends ConsumerState<LeaderBoardScreen> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future((){
      ref.read(leaderBoardPProvider.notifier).lazyLoading(scrollController: _scrollController);
      ref.read(leaderBoardPProvider.notifier).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard"),),
      body: Consumer(
        builder: (context,ref,child) {
          final leaderboardValue = ref.watch(leaderBoardPProvider);
          return leaderboardValue.when(data: (boardsData){
            if(boardsData.isEmpty) return const Center(child: Text("Data not available"),);
            return ListView.builder(
              itemCount: boardsData.length,
                controller: _scrollController,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(boardsData[index].imageUrl),),
                    subtitle: Text("Score ${boardsData[index].correctCount}"),
                    title: Text(boardsData[index].name),
                    trailing: Text("Rank ${index+1}"),
                  );
                });

          }, error: (e,st)=> const Center(child: Text("Something went wrong"),),
              loading: ()=> const Center(child: InProcessingIndicator(),));

        }
      ),
    );
  }
}