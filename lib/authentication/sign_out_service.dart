
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// A utility class for managing sign-out from Firebase and Google accounts.
class FirebaseSignOutService {
  /// Completes the sign-out process for Firebase and Google accounts.
  ///
  /// This method clears the authentication cache for the current Google user,
  /// deletes the Firebase user (if one is present), and signs out from both
  /// Firebase and Google. After signing out, any debug messages are printed.
  ///
  /// Throws: If an error occurs during the sign-out process and kDebugMode is enabled,
  /// the error is rethrown for further analysis.
  static Future<void> completeSignOut() async {
    try {
      /// Check if a Firebase user is currently signed in.
      if (FirebaseAuth.instance.currentUser != null) {
        /// Clear the authentication cache for the current Google user.
        await GoogleSignIn().currentUser?.clearAuthCache();

        /// Delete the Firebase user.
        await FirebaseAuth.instance.currentUser?.delete();

        /// Print a debug message if debugging is enabled.
        if (kDebugMode) {
          print("Firebase auth is deleted");
        }
      }

      /// Sign out from Firebase.
      await FirebaseAuth.instance.signOut();

      /// Disconnect and sign out from the Google account.
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
    } catch (e) {
      /// Handle any errors that occur during sign-out.
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}
