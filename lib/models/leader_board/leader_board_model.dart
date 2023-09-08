
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'leader_board_model.g.dart';

/// A model class representing a leaderboard entry.
///
/// The [LeaderBoardModel] class holds information about a user's leaderboard position,
/// including their image URL, name, email ID, and correct answer count.
@JsonSerializable()
@immutable
class LeaderBoardModel {
  /// The URL of the user's profile image.
  final String imageUrl;

  /// The name of the user.
  final String name;

  /// The email ID of the user.
  final String emailId;

  /// The count of correct answers by the user.
  final int correctCount;

  /// Creates a [LeaderBoardModel] instance.
  ///
  /// The [imageUrl], [name], [emailId], and [correctCount] parameters are required.
  const LeaderBoardModel({
    required this.imageUrl,
    required this.name,
    required this.emailId,
    required this.correctCount,
  });

  /// Creates a [LeaderBoardModel] instance from a JSON map.
  ///
  /// The [json] parameter is a Map containing JSON data to deserialize.
  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardModelFromJson(json);

  /// Converts this [LeaderBoardModel] instance to a JSON map.
  ///
  /// This method is used to serialize the object for storage or transmission.
  Map<String, dynamic> toJson() => _$LeaderBoardModelToJson(this);
}
