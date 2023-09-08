import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';
import 'package:quiz_app/extensions/theme_extension.dart';
import 'package:quiz_app/screens/leader_board_screen/leader_board_screen.dart';

import '../../constants/constant.dart';
import '../../providers/quiz_manager_providers/get_user_rank_provider.dart';
import '../question_screen/question_view.dart';

class SubjectsView extends ConsumerStatefulWidget {
  static const routeAddress = "/homepage";
  const SubjectsView({super.key});

  @override
  ConsumerState<SubjectsView> createState() => _SubjectsViewState();
}

class _SubjectsViewState extends ConsumerState<SubjectsView> {

  @override
  Widget build(BuildContext context) {
    // final rankValue = ref.watch(getUserRankPProvider);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(title:  const Text("Subjects"),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, LeaderBoardScreen.routeAddress);
        }, icon: const Icon(Icons.leaderboard),
        color: context.themeData.colorScheme.primary,
        )
      ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: context.height*.03,left: context.width*.01,right: context.width*.01),
          itemCount: Constants.subjects.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: context.height*.05,
              crossAxisSpacing: context.width*.02,crossAxisCount: 2,childAspectRatio: 0.9),
          itemBuilder: (context,index){
            return LayoutBuilder(builder: (context,constraints){
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, QuestionView.routeAddress,
                  arguments: Constants.subjects[index]["subject"]
                  );
                },
                child: Stack(clipBehavior: Clip.none,
                  children: [
                    Card(child: Container(width: constraints.biggest.width,
                      padding: EdgeInsets.symmetric(horizontal: constraints.biggest.width*.05,vertical: constraints.biggest.height*.02),
                      child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Constants.subjects[index]["subject"],
                            style: GoogleFonts.bodoniModa(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.12
                            ),)
                        ],
                      ),
                    ),),

                    Opacity(opacity: .1,
                        child: Image.network(
                          Constants.subjects[index]["icon"],fit: BoxFit.cover,
                          height: constraints.biggest.height*.9,)),



                    Positioned(
                      top: -(constraints.biggest.height*.09),
                      left: -(constraints.biggest.width*.03),
                      child: Container(height: constraints.biggest.height*.4,width: constraints.biggest.width*.6,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Theme.of(context).colorScheme.surfaceTint.withOpacity(.5),blurRadius: 3,offset: const Offset(3, -2))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage(Constants.subjects[index]["icon"]),fit:BoxFit.cover)
                        ),),
                    ),

                  ],
                ),
              );
            });
          }),);
  }
}
