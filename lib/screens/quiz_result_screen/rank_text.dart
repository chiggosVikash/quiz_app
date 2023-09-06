import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';

class RankText extends ConsumerWidget {
  final String name;
  final int correctCount;
  const RankText({super.key,required this.name,required this.correctCount});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Card(elevation: 3,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          SizedBox(width: context.width*.4,height: context.height*.15,
            child: LayoutBuilder(
                builder: (context,constraints) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your Score:",style:GoogleFonts.abyssinicaSil(
                          color: Colors.grey,
                          fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.09
                      ),),
                      Text(name,style:GoogleFonts.bodoniModa(
                          fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.16
                      ),),
                    ],
                  );
                }
            ),
          ),
          SizedBox(height: context.height*.15,width: context.width*.4,
            child: LayoutBuilder(
                builder: (context,constraints) {
                  return Stack(
                    children: [
                      Image.asset("assets/leaf.png",),
                      SizedBox(height: context.height*.13,width: context.width*.32,
                        child: Center(
                          child: Text("$correctCount",style: GoogleFonts.bodoniModa(
                              fontSize: ((constraints.biggest.height+constraints.biggest.width)*context.aspectRatio)*.14
                          ),),
                        ),
                      )
                    ],
                  );
                }
            ),
          ),

        ],)
      ],),
    );
  }
}
