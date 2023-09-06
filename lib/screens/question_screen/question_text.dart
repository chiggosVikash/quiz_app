import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';

class QuestionText extends ConsumerWidget {
  final String _question;
  const QuestionText({super.key,required String question}):_question = question;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Text("Question: ",style: GoogleFonts.abyssinicaSil(
          color: Colors.blueGrey,
          fontSize: ((context.height+context.width)*context.aspectRatio)*.025
      )),
      SizedBox(height: context.height*.01,),
      Text.rich(TextSpan(children: [
        TextSpan(text: "(Q. ",style: GoogleFonts.bodoniModa(
            fontWeight: FontWeight.w500,
            fontSize: ((context.height+context.width)*context.aspectRatio)*.033
        )),
        TextSpan(text: _question,style: GoogleFonts.abyssinicaSil(
            fontWeight: FontWeight.w500,
            fontSize: ((context.height+context.width)*context.aspectRatio)*.033
        ))
      ])),

    ],);
  }
}
