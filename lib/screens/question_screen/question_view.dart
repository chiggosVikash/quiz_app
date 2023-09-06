import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/constant.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';
import 'package:quiz_app/providers/quiz_manager_providers/current_question_provider.dart';
import 'package:quiz_app/providers/quiz_manager_providers/get_question_provider.dart';
import 'package:quiz_app/providers/quiz_manager_providers/quiz_manager.dart';
import 'package:quiz_app/screens/question_screen/prev_next_button.dart';
import 'package:quiz_app/screens/question_screen/question_text.dart';

import 'options_view.dart';
import 'question_no_card.dart';

class QuestionView extends ConsumerStatefulWidget {
  static const routeAddress = "/questionView";
  final String subject;
  const QuestionView({super.key,required this.subject});

  @override
  ConsumerState<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends ConsumerState<QuestionView> {

  // late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    Future((){
      ref.invalidate(quizManagerProvider);
      ref.read(quizManagerProvider.notifier).getQuestion(subject: widget.subject);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Quiz - ${widget.subject}"),),
        body: Stack(alignment: Alignment.center,
          children: [
            Container(color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.2),),
            Opacity(
                opacity: .07,
                child: Icon(Icons.question_answer,size: context.height*.2,color: Theme.of(context).colorScheme.surfaceTint,)),

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const QuestionNoCard(),
                Consumer(
                  builder: (context,ref,child) {
                    final questionValue = ref.watch(getQuestionPProvider);
                    return questionValue.when(data: (question){
                      if(question == null){
                        return const Center(child: Text("Question not available"),);
                      }
                      return Expanded(
                          child: ListView(
                              children:[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.015),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    QuestionText(question: question.question,),
                                    SizedBox(height: context.height*.01,),
                                    const Divider(thickness: .3,),
                                    OptionView(question: question,),

                                  ],),
                                )
                              ]
                            // }),
                          ));
                    }, error: (e,st)=> const Center(child: Text("Error Something went wrong"),),
                        loading: ()=> const Center(child: RepaintBoundary(child: CircularProgressIndicator()),));

                  }
                ),
                Consumer(
                  builder: (context,ref,child) {
                    final currentQuestionNo = ref.watch(currentQuestionPProvider);
                    return PrevNdNextButton(
                      previousAction: currentQuestionNo <=1 ? null : (){
                        ref.read(quizManagerProvider.notifier).backQuestion();
                      },
                      nextAction: (){
                        if(currentQuestionNo < Constants.maxQuestion){
                          ref.read(quizManagerProvider.notifier).nextQuestion(subject: widget.subject);
                        }else{
                          /// Submit question
                          ref.read(quizManagerProvider.notifier).submitAnswer(subject: widget.subject);
                        }

                    },);
                  }
                )
              ],
            ),
          ],
        ));
  }


}
