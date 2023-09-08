// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardModel _$LeaderBoardModelFromJson(Map<String, dynamic> json) =>
    LeaderBoardModel(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      emailId: json['emailId'] as String,
      correctCount: json['correctCount'] as int,
    );

Map<String, dynamic> _$LeaderBoardModelToJson(LeaderBoardModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'emailId': instance.emailId,
      'correctCount': instance.correctCount,
    };
