
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@immutable
class QuizAnswerModel{
  final String cls;
  final int id = DateTime.now().millisecondsSinceEpoch;
  final int totalQuestion;
  final String email;
  final String subject;
  final String chapter = "";
  final int correctQuestions;
  final int wrongQuestions;

  QuizAnswerModel({
   required this.subject,
   required this.cls,
   required this.email,
   required this.correctQuestions,
   required this.totalQuestion,
   required this.wrongQuestions
});
}