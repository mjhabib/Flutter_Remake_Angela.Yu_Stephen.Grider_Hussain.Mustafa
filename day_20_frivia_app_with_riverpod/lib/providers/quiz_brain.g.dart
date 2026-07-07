// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_brain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Difficulty)
final difficultyProvider = DifficultyProvider._();

final class DifficultyProvider extends $NotifierProvider<Difficulty, String> {
  DifficultyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'difficultyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$difficultyHash();

  @$internal
  @override
  Difficulty create() => Difficulty();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$difficultyHash() => r'c6b0c675889711e9d77e6d65c2639b649ee42b63';

abstract class _$Difficulty extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(QuizBrain)
final quizBrainProvider = QuizBrainProvider._();

final class QuizBrainProvider
    extends $AsyncNotifierProvider<QuizBrain, List<dynamic>?> {
  QuizBrainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizBrainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizBrainHash();

  @$internal
  @override
  QuizBrain create() => QuizBrain();
}

String _$quizBrainHash() => r'5c4ebf5aabcd81c8395bb4fe35fd411debf3b75e';

abstract class _$QuizBrain extends $AsyncNotifier<List<dynamic>?> {
  FutureOr<List<dynamic>?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<dynamic>?>, List<dynamic>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<dynamic>?>, List<dynamic>?>,
              AsyncValue<List<dynamic>?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
