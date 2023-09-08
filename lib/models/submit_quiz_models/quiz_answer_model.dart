
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quiz_answer_model.g.dart';


/// A model class representing a user's answers to a quiz along with additional information.
///
/// The [QuizAnswerModel] class holds information about a user's quiz answers, including details
/// such as the class [cls], unique identifier [id], total questions attempted [totalQuestion],
/// user's email [email], quiz subject, chapter, number of correct questions [correctQuestions],
/// number of wrong questions [wrongQuestions], user's name [name], and the date [date] when the quiz was answered.
@JsonSerializable()
@immutable
class QuizAnswerModel {
  /// The class of the quiz.
  final String cls;

  /// A unique identifier for the quiz answer, generated based on the current timestamp.
  @JsonKey(includeFromJson: true, includeToJson: true)
  final int id = DateTime.now().millisecondsSinceEpoch;

  /// The total number of questions attempted in the quiz.
  final int totalQuestion;

  /// The email of the user who answered the quiz.
  final String email;

  /// The subject of the quiz.
  final String subject;

  /// The chapter or topic related to the quiz.
  @JsonKey(includeFromJson: true, includeToJson: true)
  final String chapter = "";

  /// The number of correct questions in the quiz.
  final int correctQuestions;

  /// The number of wrong questions in the quiz.
  final int wrongQuestions;

  /// The name of the user who answered the quiz.
  final String name;

  /// The date and time when the quiz was answered, represented in ISO 8601 format.
  @JsonKey(includeFromJson: true, includeToJson: true)
  final String date = DateTime.now().toIso8601String();

  /// Creates a [QuizAnswerModel] instance.
  ///
  /// The [subject], [cls], [email], [correctQuestions], [totalQuestion], [wrongQuestions], and [name]
  /// parameters are required.
  QuizAnswerModel({
    required this.subject,
    required this.cls,
    required this.email,
    required this.correctQuestions,
    required this.totalQuestion,
    required this.wrongQuestions,
    required this.name,
  });

  /// Converts this [QuizAnswerModel] instance to a JSON map.
  ///
  /// This method is used to serialize the object for storage or transmission.
  Map<String, dynamic> toJson() => _$QuizAnswerModelToJson(this);
}
