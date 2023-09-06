// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      answer: json['answer'] as String,
      cls: json['cls'] as String,
      subject: json['subject'] as String,
      chapter: json['chapter'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['question'] as String,
      questionId: json['questionId'] as int,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'cls': instance.cls,
      'subject': instance.subject,
      'chapter': instance.chapter,
      'questionId': instance.questionId,
      'question': instance.question,
      'answer': instance.answer,
      'options': instance.options,
    };
