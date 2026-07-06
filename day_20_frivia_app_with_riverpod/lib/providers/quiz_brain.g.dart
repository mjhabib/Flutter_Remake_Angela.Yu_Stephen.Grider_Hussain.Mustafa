// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_brain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizBrain)
final quizBrainProvider = QuizBrainFamily._();

final class QuizBrainProvider
    extends $AsyncNotifierProvider<QuizBrain, List<dynamic>> {
  QuizBrainProvider._({
    required QuizBrainFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'quizBrainProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$quizBrainHash();

  @override
  String toString() {
    return r'quizBrainProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QuizBrain create() => QuizBrain();

  @override
  bool operator ==(Object other) {
    return other is QuizBrainProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$quizBrainHash() => r'f06e25f9f133d885891f5b4fb409c039894d06ad';

final class QuizBrainFamily extends $Family
    with
        $ClassFamilyOverride<
          QuizBrain,
          AsyncValue<List<dynamic>>,
          List<dynamic>,
          FutureOr<List<dynamic>>,
          String
        > {
  QuizBrainFamily._()
    : super(
        retry: null,
        name: r'quizBrainProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QuizBrainProvider call(String difficulty) =>
      QuizBrainProvider._(argument: difficulty, from: this);

  @override
  String toString() => r'quizBrainProvider';
}

abstract class _$QuizBrain extends $AsyncNotifier<List<dynamic>> {
  late final _$args = ref.$arg as String;
  String get difficulty => _$args;

  FutureOr<List<dynamic>> build(String difficulty);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<dynamic>>, List<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<dynamic>>, List<dynamic>>,
              AsyncValue<List<dynamic>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
