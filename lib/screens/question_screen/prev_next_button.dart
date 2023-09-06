import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';

import '../../constants/constant.dart';
import '../../providers/quiz_manager_providers/current_question_provider.dart';

class PrevNdNextButton extends ConsumerStatefulWidget {
  final VoidCallback nextAction;
  final VoidCallback? previousAction;
  const PrevNdNextButton({super.key,required this.nextAction,required this.previousAction});

  @override
  ConsumerState<PrevNdNextButton> createState() => _PrevNdNextButtonState();
}

class _PrevNdNextButtonState extends ConsumerState<PrevNdNextButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.width,
      child:Stack(children: [
        GestureDetector(
          onTap: widget.previousAction,
          child: Container(
            transform: Matrix4.skewY(.35),
            height: context.height*.11,width: context.width*.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondaryContainer,),
          ),
        ),
        Positioned(right: 0.09,
          child: InkWell(
            onTap: widget.nextAction,
            child: Container(
              transformAlignment: Alignment.centerRight,
              transform: Matrix4.skewY(-.35),
              height: context.height*.11,width: context.width*.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surfaceTint.withOpacity(.7)),),
          ),
        ),
        Positioned.fill(
          bottom: -20,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: context.width*.04),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_sharp,size: context.height*.017,),
                  SizedBox(width: context.width*.02,),
                  Text("Previous",style: GoogleFonts.abyssinicaSil(
                      fontSize: ((context.height+context.width)*context.aspectRatio)*.028
                  )),
                ],
              ),
              Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Consumer(
                    builder: (context,ref,child) {
                      final currentQuestionNo = ref.watch(currentQuestionPProvider);
                      return Text(currentQuestionNo < Constants.maxQuestion ? "Next" : "Submit",style: GoogleFonts.abyssinicaSil(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          fontSize: ((context.height+context.width)*context.aspectRatio)*.03
                      ));
                    }
                  ),
                  SizedBox(width: context.width*.02,),
                  Icon(Icons.arrow_forward_ios,size: context.height*.017,color: Theme.of(context).colorScheme.secondaryContainer,
                  ),

                ],
              ),
            ],),
          ),
        )

      ],
      ),)
    ;
  }
}
