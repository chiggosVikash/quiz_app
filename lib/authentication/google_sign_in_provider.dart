// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'google_auth.dart';
//
// // final googleSignInProvider = FutureProvider.autoDispose<String>((ref) async {
// //   final createPlayerProvider =
// //       ref.read(createOrEditPlayerNotifierProvider.notifier);
// //   final googleSignIn = SignInWithGoogle();
// //   final credential = await googleSignIn.signInWithGoogle();
// //   if (credential.user != null) {
// //     createPlayerProvider.addEmail(credential.user!.email!);
// //     return Future.value(credential.user!.email);
// //   } else {
// //     throw "LoginFailed Exception";
// //   }
// // });
//
// final googleSignInStateNotifierProvider = StateNotifierProvider<SignInWithGoogle,String>((ref) {
//   return SignInWithGoogle();
// });
//
// final googleSignInProvider = Provider.autoDispose<String>((ref) {
//   final email = ref.watch(googleSignInStateNotifierProvider);
//   return email;
// });
