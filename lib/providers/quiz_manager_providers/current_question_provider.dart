
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
}