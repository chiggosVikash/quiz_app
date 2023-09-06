import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';

import '../../constants/constant.dart';
import '../question_screen/question_view.dart';

class SubjectsView extends StatefulWidget {
  static const routeAddress = "/homepage";
  const SubjectsView({super.key});

  @override
  State<SubjectsView> createState() => _SubjectsViewState();
}

class _SubjectsViewState extends State<SubjectsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(title:  const Text("Subjects"),),
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