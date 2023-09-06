// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithGoogleHash() => r'2a91fc1be2e039d059f76aee7355207e7be0e618';

/// A [StateNotifier] for handling Google sign-in functionality and user validation.
///
/// This class manages the Google sign-in process, validates the user's email
/// in the database, and sets the app state accordingly.
///
///
/// Copied from [SignInWithGoogle].
@ProviderFor(SignInWithGoogle)
final signInWithGoogleProvider =
    AutoDisposeAsyncNotifierProvider<SignInWithGoogle, String>.internal(
  SignInWithGoogle.new,
  name: r'signInWithGoogleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInWithGoogleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInWithGoogle = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
