
import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question/question_model.dart';

@immutable
class AnswerCollectionModel{

  final QuestionModel question;
  final String selectedAnswer;

  const AnswerCollectionModel({required this.question,
  required this.selectedAnswer
  });

  bool  get isCorrect {
    return question.answer == selectedAnswer;
}

}