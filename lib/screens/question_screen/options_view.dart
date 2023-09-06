import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';
import 'package:quiz_app/extensions/theme_extension.dart';
import 'package:quiz_app/models/question/question_model.dart';
import 'package:quiz_app/providers/quiz_manager_providers/quiz_manager.dart';

import '../../models/question/option_model.dart';

class OptionView extends ConsumerWidget {
  final QuestionModel _question;
  const OptionView({super.key,required QuestionModel question}):_question = question;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final answer = ref.watch(quizManagerProvider.select((value) => value.where((element) => element.question == _question))).toList();

    // final _optionAnim = Tween<Offset>(begin: Offset(0, 0),end: Offset(-2, 0))
    //     .animate(CurvedAnimation(parent: controller, curve: Interval(0.2, 0.4,curve: Cure)));
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

      Text("Options: ",style: GoogleFonts.abyssinicaSil(
          color: Colors.grey,
          fontSize: ((context.height+context.width)*context.aspectRatio)*.025
      )),


      Column(children: List.generate( _question.options.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: InkWell(
            onTap: (){
              ref.read(quizManagerProvider.notifier).addAnswer(question: _question, answer: _question.options[index].id);
            },
            child: Container(
              width: context.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                border: answer[0].selectedAnswer == _question.options[index].id ? Border.all(color: context.themeData.colorScheme.primary) : null
              ),
              padding: EdgeInsets.symmetric(vertical: context.height*.012),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "  ${index+1} ",
                    style: GoogleFonts.abyssinicaSil(
                        fontSize: ((context.height+context.width)*context.aspectRatio)*.03
                    )),
                TextSpan(text: _question.options[index].data,
                    style: GoogleFonts.raleway(
                        fontSize: ((context.height+context.width)*context.aspectRatio)*.028
                    )
                )
              ])),),
          ),
        );
      }),),
    ],);
  }
}
