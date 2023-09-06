

import 'dart:math';

import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:quiz_app/interface/quiz_manager_interface.dart';
import 'package:quiz_app/models/question/question_model.dart';
import 'package:quiz_app/models/submit_quiz_models/answer_collection_model.dart';
import 'package:quiz_app/providers/quiz_manager_providers/current_question_provider.dart';
import 'package:quiz_app/providers/quiz_manager_providers/get_question_provider.dart';
import 'package:quiz_app/providers/quiz_manager_providers/get_total_question_count_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'quiz_manager.g.dart';
@Riverpod(keepAlive: true)
class QuizManager extends _$QuizManager implements QuizManagerInterface{

  List<int> _totalQuestionGeneratedIds = [];

  final _random = Random();

  int _totalQuestionCount = 0;

  // int get _totalQuestionCount {
  //
  //   final count = ref.watch(getTotalQuestionCountPProvider);
  //   print("Count $count");
  //   return count.value ?? 0;
  // }

  @override
  List<AnswerCollectionModel> build() {
    _totalQuestionGeneratedIds = [];
    return [];
  }


 int _randomQuestionId (int totalQuestionCount){
    var id = _random.nextInt(totalQuestionCount);
    while(_totalQuestionGeneratedIds.contains(id) == true && id != 0){
      id = _random.nextInt(totalQuestionCount);
    }
    _totalQuestionGeneratedIds.add(id);
    return id;
 }


  @override
  void addAnswer({required QuestionModel question, required String answer}) {
    state = [
      for(var q in state)
        if(q.question != question)
          q
    ];
    state = [...state,AnswerCollectionModel(question: question, selectedAnswer: answer)];

    print("TOtal Question ${state.length}");

  }

  @override
  Future<void> getQuestion({required String subject}) async{
    await _getTotalQuestionCount();
    final id = _randomQuestionId(_totalQuestionCount);
    final question = await ref.read(getQuestionPProvider.notifier).getQuestion(subject: subject, questionId: id);

    if(question != null){
      addAnswer(question: question, answer: "");
    }

    currentQuestionNo();

  }

  @override
  Future<void> submitAnswer() {
    // TODO: implement submitAnswer
    throw UnimplementedError();
  }

  Future<void> _getTotalQuestionCount()async{
    if(_totalQuestionCount == 0 ){
      final db = MongoConnect().database!;
      final count = await db.collection("Questions").count();
      _totalQuestionCount = count;
    }

  }

  @override
  void currentQuestionNo() {
    final currentQuestion = _totalQuestionGeneratedIds.length;
    ref.read(currentQuestionPProvider.notifier).changeCurrentQuestion(currentQuestion);
  }

}