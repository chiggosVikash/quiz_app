
import 'package:flutter/foundation.dart';
import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:quiz_app/models/submit_quiz_models/quiz_answer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'save_quiz_provider.g.dart';
@riverpod
class SaveQuizP extends _$SaveQuizP{

  @override
  FutureOr<int> build(){
    return -1;
  }

  Future<void> saveQuiz(QuizAnswerModel answerModel)async{
    state = const AsyncValue.loading();
    try{
      final db = MongoConnect().database!;
      final status = db.collection("quizResult").insert(answerModel.toJson());
      if(kDebugMode){
        print("Save status $status");
      }
      state = const AsyncValue.data(1);
    }catch(error,stackTrace){
      state = AsyncValue.error(error, stackTrace);
    }
  }

}