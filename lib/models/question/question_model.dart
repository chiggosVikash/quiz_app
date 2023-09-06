
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'option_model.dart';
part 'question_model.g.dart';
@JsonSerializable()
@immutable
class QuestionModel{
  final String cls;
  final String subject;
  final String chapter;
  final int questionId;
  final String question;
  final String answer;
  final List<OptionModel> options;

  const QuestionModel({required this.answer,required this.cls,
  required this.subject,
    required this.chapter,
    required this.options,
    required this.question,
    required this.questionId
  });

  factory QuestionModel.fromJson(Map<String,dynamic> json) => _$QuestionModelFromJson(json);

  Map<String,dynamic> toJson() => _$QuestionModelToJson(this);

  @override
  bool operator ==(covariant QuestionModel other) {
    return other.questionId == questionId;
  }

  @override
  int get hashCode => questionId;
}