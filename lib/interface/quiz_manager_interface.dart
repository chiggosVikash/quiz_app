
import 'package:quiz_app/models/question/question_model.dart';

abstract class QuizManagerInterface{

  Future<void> getQuestion({required String subject});

  void addAnswer({required QuestionModel question, required String answer});

  Future<void> submitAnswer();

  void currentQuestionNo();



}