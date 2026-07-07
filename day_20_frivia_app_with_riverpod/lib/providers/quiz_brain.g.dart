// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_brain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(difficulty)
final difficultyProvider = DifficultyProvider._();

final class DifficultyProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
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
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return difficulty(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$difficultyHash() => r'8de64b1f3b6f0b55bc225beb7e14311ee93a96cd';

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

String _$quizBrainHash() => r'4da7c61fa21159ecaacccc0df04ca01306e73f39';

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
