
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'option_model.g.dart';
@JsonSerializable()
@immutable
class OptionModel{
  final String id;
  final String data;
  const OptionModel({required this.id,required this.data});

  factory OptionModel.fromJson(Map<String,dynamic> json)=>_$OptionModelFromJson(json);
  Map<String,dynamic> toJson()=>_$OptionModelToJson(this);
}