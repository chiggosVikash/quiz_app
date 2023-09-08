// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$leaderBoardPHash() => r'f7a4fbd81ff6e2d7640bb500b535334535d80af7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LeaderBoardP
    extends BuildlessAutoDisposeAsyncNotifier<List<LeaderBoardModel>> {
  late final ScrollController scrollController;

  FutureOr<List<LeaderBoardModel>> build({
    required ScrollController scrollController,
  });
}

/// See also [LeaderBoardP].
@ProviderFor(LeaderBoardP)
const leaderBoardPProvider = LeaderBoardPFamily();

/// See also [LeaderBoardP].
class LeaderBoardPFamily extends Family<AsyncValue<List<LeaderBoardModel>>> {
  /// See also [LeaderBoardP].
  const LeaderBoardPFamily();

  /// See also [LeaderBoardP].
  LeaderBoardPProvider call({
    required ScrollController scrollController,
  }) {
    return LeaderBoardPProvider(
      scrollController: scrollController,
    );
  }

  @override
  LeaderBoardPProvider getProviderOverride(
    covariant LeaderBoardPProvider provider,
  ) {
    return call(
      scrollController: provider.scrollController,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'leaderBoardPProvider';
}

/// See also [LeaderBoardP].
class LeaderBoardPProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LeaderBoardP, List<LeaderBoardModel>> {
  /// See also [LeaderBoardP].
  LeaderBoardPProvider({
    required ScrollController scrollController,
  }) : this._internal(
          () => LeaderBoardP()..scrollController = scrollController,
          from: leaderBoardPProvider,
          name: r'leaderBoardPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$leaderBoardPHash,
          dependencies: LeaderBoardPFamily._dependencies,
          allTransitiveDependencies:
              LeaderBoardPFamily._allTransitiveDependencies,
          scrollController: scrollController,
        );

  LeaderBoardPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scrollController,
  }) : super.internal();

  final ScrollController scrollController;

  @override
  FutureOr<List<LeaderBoardModel>> runNotifierBuild(
    covariant LeaderBoardP notifier,
  ) {
    return notifier.build(
      scrollController: scrollController,
    );
  }

  @override
  Override overrideWith(LeaderBoardP Function() create) {
    return ProviderOverride(
      origin: this,
      override: LeaderBoardPProvider._internal(
        () => create()..scrollController = scrollController,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scrollController: scrollController,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LeaderBoardP, List<LeaderBoardModel>>
      createElement() {
    return _LeaderBoardPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LeaderBoardPProvider &&
        other.scrollController == scrollController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scrollController.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LeaderBoardPRef
    on AutoDisposeAsyncNotifierProviderRef<List<LeaderBoardModel>> {
  /// The parameter `scrollController` of this provider.
  ScrollController get scrollController;
}

class _LeaderBoardPProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LeaderBoardP,
        List<LeaderBoardModel>> with LeaderBoardPRef {
  _LeaderBoardPProviderElement(super.provider);

  @override
  ScrollController get scrollController =>
      (origin as LeaderBoardPProvider).scrollController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
