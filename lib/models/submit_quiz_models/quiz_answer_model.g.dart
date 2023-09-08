// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizAnswerModel _$QuizAnswerModelFromJson(Map<String, dynamic> json) =>
    QuizAnswerModel(
      subject: json['subject'] as String,
      cls: json['cls'] as String,
      email: json['email'] as String,
      correctQuestions: json['correctQuestions'] as int,
      totalQuestion: json['totalQuestion'] as int,
      wrongQuestions: json['wrongQuestions'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$QuizAnswerModelToJson(QuizAnswerModel instance) =>
    <String, dynamic>{
      'cls': instance.cls,
      'id': instance.id,
      'totalQuestion': instance.totalQuestion,
      'email': instance.email,
      'subject': instance.subject,
      'chapter': instance.chapter,
      'correctQuestions': instance.correctQuestions,
      'wrongQuestions': instance.wrongQuestions,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'date': instance.date,
    };
