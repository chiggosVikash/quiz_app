
import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question/question_model.dart';

/// A model class representing a collection of user answers to quiz questions.
///
/// The [AnswerCollectionModel] class holds information about a user's response to a quiz question,
/// including the [question] being answered and the [selectedAnswer] chosen by the user.
@immutable
class AnswerCollectionModel {
  /// The question being answered.
  final QuestionModel question;

  /// The answer chosen by the user for the [question].
  final String selectedAnswer;

  /// Creates an [AnswerCollectionModel] instance.
  ///
  /// The [question] and [selectedAnswer] parameters are required.
  const AnswerCollectionModel({
    required this.question,
    required this.selectedAnswer,
  });

  /// Determines if the selected answer is correct for the associated question.
  ///
  /// Returns `true` if the [selectedAnswer] matches the correct answer of the [question];
  /// otherwise, returns `false`.
  bool get isCorrect {
    return question.answer == selectedAnswer;
  }
}
