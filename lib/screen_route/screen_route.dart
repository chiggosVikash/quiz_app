
import 'package:flutter/material.dart';
import 'package:quiz_app/screen_route/custom_route.dart';
import 'package:quiz_app/screens/question_screen/question_view.dart';
import 'package:quiz_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:quiz_app/screens/splash_screen/splash_screen.dart';

import '../screens/homepage/homepage.dart';
import '../screens/subjects_screen/subjects_view.dart';

class ScreenRoute{
  final _pageOpenDirection = const Offset(0,1);
  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return CustomRoute(page: const SplashScreen(), offset: _pageOpenDirection);
      case SubjectsView.routeAddress:
        return CustomRoute(page: const SubjectsView(), offset: _pageOpenDirection);
      case SignInScreen.routeAddress:
        return CustomRoute(page: const SignInScreen(), offset: _pageOpenDirection);

      case QuestionView.routeAddress:
        final args = settings.arguments as String;
        return CustomRoute(page: QuestionView(subject: args,), offset: _pageOpenDirection);

      default:
       return CustomRoute(page: Scaffold(body: Center(child:
         Text("Screen Not found ${settings.name}")
         ,),), offset: _pageOpenDirection);
    }
  }
}