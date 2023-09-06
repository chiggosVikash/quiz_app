
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'leader_board_model.g.dart';
@JsonSerializable()
@immutable
class LeaderBoardModel{
  final String imageUrl;
  final String name;
  final String emailId;
  final int correctCount;

  const LeaderBoardModel({required this.imageUrl,
  required this.name,
    required this.correctCount,
    required this.emailId
  });

  factory LeaderBoardModel.fromJson(Map<String,dynamic> json) => _$LeaderBoardModelFromJson(json);

  Map<String,dynamic> toJson() => _$LeaderBoardModelToJson(this);



}