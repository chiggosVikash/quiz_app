import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/providers/splash_screen_providers/splash_screen_provider.dart';
import 'package:quiz_app/screens/homepage/homepage.dart';
import 'package:quiz_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:quiz_app/screens/subjects_screen/subjects_view.dart';



class SplashScreen extends ConsumerWidget {
  static const routeAddress = "/";
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusValue = ref.watch(splashScreenPProvider);
    Future((){
      statusValue.whenData((isNewUser) {

        if(isNewUser == 1){
          Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeAddress, (route) => false);
        }else{
          Navigator.pushNamedAndRemoveUntil(context, SubjectsView.routeAddress, (route) => false);
        }
      });
    });

    return const Scaffold(
      body: Center(child: Text("Splash Screen"),),
    );
  }
}
