
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/enums/screens_enum.dart';
import 'package:quiz_app/loding_indicators/in_processing_indicator.dart';
import 'package:quiz_app/loding_indicators/process_failed_indicator.dart';
import 'package:quiz_app/providers/quiz_manager_providers/quiz_manager.dart';
import 'package:quiz_app/providers/quiz_manager_providers/save_quiz_provider.dart';
import 'package:quiz_app/screens/quiz_result_screen/quiz_result_screen.dart';

import '../../loding_indicators/process_succeed_indicator.dart';

class DatabaseResponseHandler extends ConsumerWidget {
  static const routeAddress = "/databaseResponseHandler";
  final ScreensEnum screens;
  const DatabaseResponseHandler({
    required this.screens,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Consumer(builder: (context,ref,child){
        if(screens == ScreensEnum.questionScreen){
          final status = ref.watch(saveQuizPProvider);
          return status.when(data: (success){
            return ProcessSucceed(
              action: () {
                Navigator.pop(context);
                Navigator.pop(context);

                Future((){
                  final answerData = ref.read(quizManagerProvider.notifier).answerData;
                  Navigator.pushNamed(context, QuizResultScreen.routeAddress,
                      arguments: answerData!
                  );
                });

              }, actionTitle: 'View Score',
              optionalButtons: [
                FilledButton.tonal(onPressed: (){

                }, child:  const Text("View History")),
              ],

            );
          }, error: (e,st){
            return ProcessFailedIndicator(failedReason: e.toString(),
                action: (){
                  Navigator.pop(context);
                });
          }, loading: ()=> const InProcessingIndicator());
        }

        return const SizedBox();
      },),
    );
  }
}
