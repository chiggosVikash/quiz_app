import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:quiz_app/authentication/sign_out_service.dart';
import 'package:quiz_app/databases/local_db/local_db_query.dart';
import 'package:quiz_app/models/user_models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../databases/mongo_db/mongo_connect.dart';
part 'google_auth.g.dart';


/// A [StateNotifier] for handling Google sign-in functionality and user validation.
///
/// This class manages the Google sign-in process, validates the user's email
/// in the database, and sets the app state accordingly.
///
@riverpod
class SignInWithGoogle extends _$SignInWithGoogle with LocalDbQuery{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  FutureOr<String> build(){
    return "";
  }

  String get email => _email;
  String _email = "";

  // UserModel? _user;
  // UserModel? get user => _user;

  /// Initiates the sign-in process with Google authentication.
  ///
  /// This method sets the state to "Signing In", then attempts to sign in with
  /// Google credentials using [_signInWithGoogle]. If successful, it retrieves
  /// the user's email, validates it against the database using [_validateUserFromDb],
  /// and updates the state accordingly. If the email is invalid, it displays a message,
  /// logs the user out, and returns. If any errors occur, the state is updated to
  /// indicate that sign-in failed.
  ///
  /// Throws: If an error occurs during the sign-in process and kDebugMode is enabled,
  /// the error is rethrown.
  Future<void> signIn() async {
    /// Set the state to indicate that the sign-in process is in progress.
    state = const AsyncValue.data("Signing In");

    try {
      /// Sign in with Google credentials and get the user's credential.
      final userCredential = await _signInWithGoogle();

      /// If the user's credential is not null, proceed with processing.
      if (userCredential.user != null) {
        /// Retrieve the user's email from the credential.
        _email = userCredential.user!.email!;

        /// If debugging is enabled, print the email for verification.
        if (kDebugMode) {
          print("email in sign in $_email");
        }

        /// Validate the user against the database.
        final status = await _validateUserFromDb(userCredential.user!);

        /// If the email is invalid, display a message, log out the user, and return.
        if (status == "invalid") {
          state = const AsyncValue.data("Please use valid email id");
          await FirebaseSignOutService.completeSignOut();
          return;
        }

        /// Update the state with the validated email.
        state = AsyncValue.data(_email);
        // Call navigatorFunc(_user) to potentially navigate to a different screen.
        // (Assuming the code for navigatorFunc is elsewhere in your codebase.)
      }
    } catch (e) {
      /// If an error occurs during sign-in, update the state to indicate failure.
      state = const AsyncValue.data("sign in failed");

      /// If debugging is enabled, rethrow the error for further analysis.
      if (kDebugMode) {
        rethrow;
      }
    }
  }


  /// This method for Sign in with google
  /// Signs in the user using Google credentials.
  ///
  /// This method initiates the Google sign-in process using [GoogleSignIn].
  /// It retrieves the Google authentication credentials for the signed-in account.
  /// These credentials are then used to create a [GoogleAuthProvider] credential,
  /// containing the access token and ID token. The `_auth.signInWithCredential`
  /// method is called to sign in the user using the Google credentials.
  ///
  /// Returns: A [UserCredential] object representing the result of the sign-in process.
  ///
  /// Throws: If an error occurs during the sign-in process, it is rethrown for handling.
  Future<UserCredential> _signInWithGoogle() async {
    try {
      /// Start the Google sign-in process and retrieve the account.
      final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();

      /// Get the authentication credentials for the signed-in account.
      final GoogleSignInAuthentication googleAuth =
      await googleSignInAccount!.authentication;

      /// Create a GoogleAuthProvider credential using the access token and ID token.
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      /// Sign in the user using the Google credentials and return the result.
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      /// If an error occurs during the sign-in process, rethrow the error for handling.
      rethrow;
    }
  }


  /// Validates the user's email against the database.
  ///
  /// This method takes an [email] as input, retrieves the FCM token, and sends
  /// a PUT request to the [Api.validTeacher] endpoint with the user's email and token
  /// in the request body. The response is analyzed, and if the response body is empty,
  /// it indicates an invalid user, and the state is updated accordingly.
  ///
  /// If the response is not empty, the JSON response body is decoded into a [TeacherModel],
  /// and the user's information is extracted from it. The user's information is then saved
  /// using the [saveUser] function.
  ///
  /// Returns: A [String] value indicating whether the user is "valid" or "invalid".
  ///
  /// Throws: If an error occurs during the validation process and kDebugMode is enabled,
  /// the error is rethrown for further analysis.
  Future<String> _validateUserFromDb(User user) async {
    try {
      // /// Retrieve the FCM token.
      // final token = await FirebaseMessaging.instance.getToken();
      final userModel = UserModel(email: user.email!, name: user.displayName!, imageUrl: user.photoURL!);

      final database = MongoConnect().database;

      final response = await database!.collection("Users").updateOne(where.eq("email",user.email),
          ModifierBuilder().set("details", userModel.toJson())
          ,upsert: true);

      /// save User to local database
      if(response.isSuccess){
        final response = await saveUser(userModel: userModel);
        if(kDebugMode){
          print("login confirmation $response");
        }
      }

      return "valid";
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
      /// If an error occurs during validation, handle it.
      if (kDebugMode) {
        rethrow;
      }
      return "invalid";
    }
  }

}
