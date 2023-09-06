import 'package:flutter/material.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';

class QuestionCountContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  const QuestionCountContainer({super.key,required this.color,required this.child});
  final double borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(width: context.width*.92/3,height: context.height*.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
                topRight: Radius.circular(context.width*.2)),

            gradient: LinearGradient(
                stops: const [.2,.8],
                begin: Alignment.topRight,end: Alignment.bottomLeft,
                colors: [
                  color.withOpacity(.15),
                  color.withOpacity(.35)
                ])
        ),
        padding: EdgeInsets.symmetric(vertical: context.height*.01,horizontal: context.width*.02),
        child: child);
    ;
  }
}
