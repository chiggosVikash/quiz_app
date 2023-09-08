
import 'package:flutter/material.dart';
import 'package:quiz_app/enums/screens_enum.dart';
import 'package:quiz_app/screen_route/custom_route.dart';
import 'package:quiz_app/screens/database_response_handler/database_response_handler.dart';
import 'package:quiz_app/screens/leader_board_screen/leader_board_screen.dart';
import 'package:quiz_app/screens/question_screen/question_view.dart';
import 'package:quiz_app/screens/quiz_result_screen/quiz_result_screen.dart';
import 'package:quiz_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:quiz_app/screens/splash_screen/splash_screen.dart';

import '../models/submit_quiz_models/quiz_answer_model.dart';
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

      case DatabaseResponseHandler.routeAddress:
        final args = settings.arguments as ScreensEnum;
        return CustomRoute(page: DatabaseResponseHandler(screens: args,), offset: _pageOpenDirection);
        
      case QuizResultScreen.routeAddress:
        final args = settings.arguments as QuizAnswerModel ;
        return CustomRoute(page: QuizResultScreen(resultData: args,), offset: _pageOpenDirection);

      case LeaderBoardScreen.routeAddress:
        return CustomRoute(page: const LeaderBoardScreen(), offset: _pageOpenDirection);

      default:
       return CustomRoute(page: Scaffold(body: Center(child:
         Text("Screen Not found ${settings.name}")
         ,),), offset: _pageOpenDirection);
    }
  }
}