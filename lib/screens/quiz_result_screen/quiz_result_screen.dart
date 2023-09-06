import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';
import 'package:quiz_app/models/submit_quiz_models/quiz_answer_model.dart';
import 'package:quiz_app/screens/quiz_result_screen/rank_text.dart';

import 'correct_incorrect_total_question.dart';

class QuizResultScreen extends ConsumerStatefulWidget {
  static const routeAddress = "quizResult";
  final QuizAnswerModel _resultData;
  const QuizResultScreen({super.key,required QuizAnswerModel resultData}):_resultData = resultData;

  @override
  ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Result"),),
        body: Container(
          color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.4),
          child: ListView(children: [
            Image.asset("assets/result.png",height: context.height*.2,width: context.width*.9,fit: BoxFit.cover,),
            Container(
                margin: EdgeInsets.symmetric(vertical: context.height*.02),
                child: Center(child: Text("Congratulations!",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.surfaceTint
                ),))),
            RankText(name: widget._resultData.name, correctCount: widget._resultData.correctQuestions,),
            SizedBox(height: context.height*.02,),

            IncorrectCorrectNdTotalQuestion(
              answerData: widget._resultData
            ),
            SizedBox(height: context.height*.02,),

            // Container(
            //     margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.02),
            //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text("Attempted Question :",style: GoogleFonts.abyssinicaSil(),),
            //         const QuestionIndex(),
            //       ],
            //     ))



          ],),
        ) );
  }
}
