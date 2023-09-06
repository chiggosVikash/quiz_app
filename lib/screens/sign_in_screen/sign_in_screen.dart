import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/homepage/homepage.dart';
import 'package:quiz_app/screens/subjects_screen/subjects_view.dart';

import '../../authentication/google_auth.dart';

class SignInScreen extends ConsumerWidget {
  static const routeAddress = "/signInScreen";
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(body: Stack(children: [
      Container(color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),),
      Positioned(right: 0,
        child: Container(
            transformAlignment:Alignment.topRight ,transform: Matrix4.skewY(0.4),
          height: MediaQuery.of(context).size.height*.15,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer),),
      ),


      Container(transform: Matrix4.skewY(-0.3),transformAlignment: Alignment.bottomLeft,
      height: MediaQuery.of(context).size.height*.13,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withOpacity(0.7)),),
      
      Positioned(bottom: MediaQuery.of(context).size.height*.002,
        child: Container(
            transform: Matrix4.skewY(0.4),alignment: Alignment.topRight,
          height: MediaQuery.of(context).size.height*.15,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer),),
      ),

      Positioned(left: MediaQuery.of(context).size.width*.02,top: MediaQuery.of(context).size.height,
        child: Container(color: Theme.of(context).canvasColor,
          child: Container(
            transform: Matrix4.skewY(-0.3),alignment: Alignment.bottomRight,
          height: MediaQuery.of(context).size.height*.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            // color: Theme.of(context).colorScheme.secondaryContainer
            ),),
        ),
      ),

      // Positioned(left: (MediaQuery.of(context).size.width-(context.width*.3))/2,top: MediaQuery.of(context).size.height*.22,child: Container(
      //   padding: EdgeInsets.all(MediaQuery.of(context).size.width*.01),
      //   decoration: BoxDecoration(border: Border.all(width: 0.5,color: Theme.of(context).colorScheme.secondaryContainer),shape: BoxShape.circle),
      //   child: Image.asset("assets/mountliteralogo.png",height: context.width*.3,),)),
      

      Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.36,right: MediaQuery.of(context).size.width*.02,left:    MediaQuery.of(context).size.width*.02),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.03,vertical: MediaQuery.of(context).size.height*.02),
      decoration: const BoxDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
         Center(child: Text("Quiz App",style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: ((MediaQuery.of(context).size.height+MediaQuery.of(context).size.width)*MediaQuery.of(context).size.aspectRatio)*.034),)),
         SizedBox(height: MediaQuery.of(context).size.height*.02,),

        Consumer(
          builder: (context,ref,child) {
            // final status = ref.watch(acceptPolicyPProvider);
            return Column(
              children: [
                // AcceptPrivacyPolicy(status: status,),
                Container(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.04),width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Theme.of(context).canvasColor),child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
                    ElevatedButton.icon(style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(MediaQuery.of(context).size.width*.7, MediaQuery.of(context).size.height*.055),backgroundColor: Theme.of(context).colorScheme.secondaryContainer,elevation: 3),
                        onPressed: true ? (){
                          ref.read(signInWithGoogleProvider.notifier).signIn();

                        }:null, icon: const CircleAvatar(backgroundImage: AssetImage("assets/googleicon.png")),
                        label: Text("Sign in with Google",style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer)),)),

                  ],),),
              ],
            );
          }
        ),



        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Consumer(
            builder: (context,ref,child) {
              final signInStatus = ref.watch(signInWithGoogleProvider);
              return signInStatus.when(data: (data){
                if(data.contains(".com")){
                  Future((){
                    // ref.invalidate(googleSignInStateNotifierProvider);
                    Navigator.pushReplacementNamed(context, SubjectsView.routeAddress);
                  });
                  return const Text("Sign in successful");
                }
                if(data.contains("Signing In")){
                  return Text(data,);
                }
                return Text(data,style: const TextStyle(color: Colors.red),);


              }, error: (e,st)=> const Text("Sign in failed"),
                  loading: ()=> const CircularProgressIndicator());
            }
          )),
        )
      ],),),
    ],),);
  }
}