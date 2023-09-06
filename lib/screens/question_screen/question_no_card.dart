import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';
import 'package:quiz_app/providers/quiz_manager_providers/current_question_provider.dart';

import '../../constants/constant.dart';

class QuestionNoCard extends ConsumerWidget {
  const QuestionNoCard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SizedBox(width: context.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: context.width*.04),
              alignment: Alignment.bottomCenter,
              height: context.height*.128,width: context.width*.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(context.width*.26)),
                  boxShadow: [
                    BoxShadow(offset: const Offset(0, .2),color: Colors.amber.shade300,blurRadius: 5),
                    BoxShadow(offset: const Offset(0, -2),color: Theme.of(context).canvasColor ,blurRadius: 5),

                  ],

                  color: Theme.of(context).canvasColor
              ),
              child: LayoutBuilder(
                  builder: (context,constraints) {
                    return Wrap(crossAxisAlignment: WrapCrossAlignment.center,children: [
                      Icon(Icons.timelapse,size: constraints.biggest.height*.15,color: Theme.of(context).colorScheme.surfaceTint,),
                      SizedBox(width: context.width*.02,),
                      Text("",style: GoogleFonts.aboreto(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.13
                      ),)
                    ],);
                  }
              ),),
          ),
          Column(children: [
            Container(width: context.width,
              padding: EdgeInsets.symmetric(vertical: context.height*.005,horizontal: context.width*.02),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  boxShadow: [
                    BoxShadow(offset: const Offset(0, 2),color: Theme.of(context).colorScheme.surfaceTint.withOpacity(.2),blurRadius: 4)
                  ]
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(spacing: context.width*.02,children: List.generate(Constants.maxQuestion, (index) {
                  return Consumer(
                    builder: (context,ref,child) {
                      final currentQuestion = ref.watch(currentQuestionPProvider);
                      return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentQuestion - 1 ? Theme.of(context).colorScheme.surfaceTint:Theme.of(context).colorScheme.secondaryContainer),
                        padding: EdgeInsets.symmetric(horizontal: context.width*.04,vertical: context.height*.02),
                        child: Text("${index+1}",style: TextStyle(
                            color: index== currentQuestion - 1 ?Theme.of(context).colorScheme.onPrimary:Theme.of(context).colorScheme.onSecondaryContainer
                        ),),);
                    }
                  );
                }),),
              ),)
          ],),

        ],
      ),
    );
  }
}
