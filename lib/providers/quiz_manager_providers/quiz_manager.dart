

import 'dart:math';

import 'package:quiz_app/databases/local_db/local_db_query.dart';
import 'package:quiz_app/databases/mongo_db/mongo_connect.dart';
import 'package:quiz_app/interface/quiz_manager_interface.dart';
import 'package:quiz_app/models/question/question_model.dart';
import 'package:quiz_app/models/submit_quiz_models/answer_collection_model.dart';
import 'package:quiz_app/models/submit_quiz_models/quiz_answer_model.dart';
import 'package:quiz_app/providers/quiz_manager_providers/current_question_provider.dart';
import 'package:quiz_app/providers/quiz_manager_providers/get_question_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'save_quiz_provider.dart';
part 'quiz_manager.g.dart';


@Riverpod(keepAlive: true)
class QuizManager extends _$QuizManager with LocalDbQuery implements QuizManagerInterface {

  List<int> _totalQuestionGeneratedIds = [];

  final _random = Random();

  int _totalQuestionCount = 0;

  QuizAnswerModel? _answerData;

  int get totalQuestion{
    return _totalQuestionGeneratedIds.length;
  }

  QuizAnswerModel? get answerData{
    return _answerData;
  }


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
  Future<void> submitAnswer({required String subject,}) async{
    final correctCount = _totalCorrectAnswer();
    final data = await userEmailName();
    final totalInCorrectCount = totalQuestion - correctCount;
    final quizAnswer = QuizAnswerModel(name:data.name,subject: subject, cls: "BCA", email: data.email, correctQuestions: correctCount,
        totalQuestion: totalQuestion, wrongQuestions: totalInCorrectCount);
    _answerData = quizAnswer;
    ref.read(saveQuizPProvider.notifier).saveQuiz(_answerData!);
  }

  int _totalCorrectAnswer(){
    final correctAnswers = state.where((element) => element.isCorrect).length;
    return correctAnswers;
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

  @override
  Future<void> nextQuestion({required String subject})async{
    final totalQuestionIndex = _totalQuestionGeneratedIds.length - 1;
    final nextQuestionIndex = ref.read(currentQuestionPProvider.notifier).nextQuestionNo();

    if(totalQuestionIndex <= nextQuestionIndex - 1){
      await getQuestion(subject: subject);
    }else{
      /// get current question from list
      final currentQuestion = state[nextQuestionIndex].question;
      ref.read(getQuestionPProvider.notifier).changeQuestion(currentQuestion);

    }

  }

  @override
  void backQuestion(){

    final currentQuestionIndex = ref.read(currentQuestionPProvider.notifier).backCurrentQuestionNo();
    if(currentQuestionIndex <= 0) return;
    final answer = state[currentQuestionIndex-1];
    ref.read(getQuestionPProvider.notifier).changeQuestion(answer.question);
  }


}