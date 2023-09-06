
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_question_provider.g.dart';
@riverpod
class CurrentQuestionP extends _$CurrentQuestionP{

  @override
  int build(){
    return 0;
  }

  void changeCurrentQuestion(int questionNo){
    state = questionNo;
  }



  int backCurrentQuestionNo(){
    if(state <= 0) return 0;
    state = state - 1;
    return state;
  }

  int nextQuestionNo(){
    state = state += 1;
    return state;
  }
}