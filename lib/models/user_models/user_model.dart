import 'package:isar/isar.dart';
part 'user_model.g.dart';

/// A model class representing a user in the Isar database.
///
/// The [UserModel] class defines the structure of user data stored in the database,
/// including the user's [id], [email], [name], and [imageUrl].
@Collection()
class UserModel {
  /// An auto-incremented identifier for the user.
  final id = Isar.autoIncrement;

  /// The email address of the user.
  final String email;

  /// The name of the user.
  final String name;

  /// The URL of the user's profile image.
  final String imageUrl;

  /// Creates a [UserModel] instance.
  ///
  /// The [email], [name], and [imageUrl] parameters are required.
  UserModel({
    required this.email,
    required this.name,
    required this.imageUrl,
  });

  /// Converts this [UserModel] instance to a JSON map.
  ///
  /// This method is used to serialize the object for storage or transmission.
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "imageUrl": imageUrl,
  };
}
