import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';
import 'package:quiz_app/models/submit_quiz_models/quiz_answer_model.dart';

import 'no_of_question_container.dart';

class IncorrectCorrectNdTotalQuestion extends ConsumerWidget {
  final QuizAnswerModel _answerData;
  const IncorrectCorrectNdTotalQuestion({super.key,required QuizAnswerModel answerData}):_answerData = answerData;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Center(
      child: Wrap(spacing: context.width*.02,children: [
        QuestionCountContainer(color: Colors.indigo,
            child: LayoutBuilder(
                builder: (context,constraints) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("${_answerData.totalQuestion}",style:GoogleFonts.b612(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.26
                    ),),
                    SizedBox(height: constraints.biggest.height*.03,),
                    Text("Total",style:GoogleFonts.b612(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.17
                    ),),
                    Text("Question",style: TextStyle(color: Colors.indigo.shade300),)
                  ],);
                }
            ) ),
        QuestionCountContainer(color: Colors.teal,
            child: LayoutBuilder(
                builder: (context,constraints) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("${_answerData.correctQuestions}",style:GoogleFonts.b612(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.26
                    ),),
                    SizedBox(height: constraints.biggest.height*.03,),
                    Text("Correct",style:GoogleFonts.b612(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.17
                    ),),
                    const Text("Question",style: TextStyle(color: Colors.teal),)
                  ],);
                }
            )),
        QuestionCountContainer(color:Colors.red ,child:LayoutBuilder(
            builder: (context,constraints) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
                Text("${_answerData.wrongQuestions}",style:GoogleFonts.b612(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.26
                ),),
                SizedBox(height: constraints.biggest.height*.03,),
                Text("Incorrect",style:GoogleFonts.b612(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.17
                ),),
                const Text("Question",style: TextStyle(color: Colors.red),)
              ],);
            }
        ))
      ],),
    );
  }
}
