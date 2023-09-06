
import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/question/question_model.dart';
part 'get_question_provider.g.dart';

@riverpod
class GetQuestionP extends _$GetQuestionP {

  @override
  FutureOr<QuestionModel?> build(){
      return null;
  }

  Future<QuestionModel?> getQuestion({required String subject,required int questionId})async{
    state = const AsyncValue.loading();
    try{
      final db = MongoConnect().database!;
      final questionData = await db.collection("Questions").findOne({"subject":subject,"questionId":questionId});
      if(questionData == null || questionData.isEmpty){
        state = const AsyncValue.data(null);
        return null;
      }
      final model = QuestionModel.fromJson(questionData);
      state = AsyncValue.data(model);
      return model;
    }catch(e,st){
      state = AsyncValue.error(e, st);
      return null;
    }


  }

  Future<QuestionModel?> changeQuestion(QuestionModel question)async{
    state = AsyncValue.data(question);
    return state.value;
  }
}