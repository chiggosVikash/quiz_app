
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'option_model.dart';
part 'question_model.g.dart';

/// A model class representing a quiz question.
///
/// The [QuestionModel] class holds information about a quiz question, including its class [cls],
/// subject, chapter, unique identifier [questionId], question text [question], correct answer [answer],
/// and a list of available options [options].
@JsonSerializable()
@immutable
class QuestionModel {
  /// The class of the question.
  final String cls;

  /// The subject to which the question belongs.
  final String subject;

  /// The chapter or topic related to the question.
  final String chapter;

  /// The unique identifier for this question.
  final int questionId;

  /// The text of the question.
  final String question;

  /// The correct answer to the question.
  final String answer;

  /// A list of available options for the question.
  final List<OptionModel> options;

  /// Creates a [QuestionModel] instance.
  ///
  /// The [answer], [cls], [subject], [chapter], [options], [question], and [questionId]
  /// parameters are required.
  const QuestionModel({
    required this.answer,
    required this.cls,
    required this.subject,
    required this.chapter,
    required this.options,
    required this.question,
    required this.questionId,
  });

  /// Creates a [QuestionModel] instance from a JSON map.
  ///
  /// The [json] parameter is a Map containing JSON data to deserialize.
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  /// Converts this [QuestionModel] instance to a JSON map.
  ///
  /// This method is used to serialize the object for storage or transmission.
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  /// Overrides the equality operator to compare questions by their [questionId].
  ///
  /// Two questions are considered equal if they have the same [questionId].
  @override
  bool operator ==(covariant QuestionModel other) {
    return other.questionId == questionId;
  }

  /// Overrides the hashCode to use the [questionId] as the hash code.
  @override
  int get hashCode => questionId;
}
