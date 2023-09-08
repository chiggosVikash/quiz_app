
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'option_model.g.dart';

/// A model class representing an option for a quiz question.
///
/// The [OptionModel] class holds information about an option, including its unique identifier [id]
/// and the option text [data].
@JsonSerializable()
@immutable
class OptionModel {
  /// The unique identifier for this option.
  final String id;

  /// The text representing the option.
  final String data;

  /// Creates an [OptionModel] instance.
  ///
  /// The [id] and [data] parameters are required.
  const OptionModel({
    required this.id,
    required this.data,
  });

  /// Creates an [OptionModel] instance from a JSON map.
  ///
  /// The [json] parameter is a Map containing JSON data to deserialize.
  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  /// Converts this [OptionModel] instance to a JSON map.
  ///
  /// This method is used to serialize the object for storage or transmission.
  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
