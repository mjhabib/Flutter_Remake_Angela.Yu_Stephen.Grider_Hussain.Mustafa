// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topStoryIds)
final topStoryIdsProvider = TopStoryIdsProvider._();

final class TopStoryIdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<int>>,
          List<int>,
          FutureOr<List<int>>
        >
    with $FutureModifier<List<int>>, $FutureProvider<List<int>> {
  TopStoryIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topStoryIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topStoryIdsHash();

  @$internal
  @override
  $FutureProviderElement<List<int>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<int>> create(Ref ref) {
    return topStoryIds(ref);
  }
}

String _$topStoryIdsHash() => r'aafa81eda31a563cd6390c10914dda84d05248d0';

@ProviderFor(story)
final storyProvider = StoryFamily._();

final class StoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ItemModel?>,
          ItemModel?,
          FutureOr<ItemModel?>
        >
    with $FutureModifier<ItemModel?>, $FutureProvider<ItemModel?> {
  StoryProvider._({
    required StoryFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'storyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storyHash();

  @override
  String toString() {
    return r'storyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ItemModel?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ItemModel?> create(Ref ref) {
    final argument = this.argument as int;
    return story(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storyHash() => r'68ec913d474d256eb9c0a89b7bef350cf1266b85';

final class StoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ItemModel?>, int> {
  StoryFamily._()
    : super(
        retry: null,
        name: r'storyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoryProvider call(int id) => StoryProvider._(argument: id, from: this);

  @override
  String toString() => r'storyProvider';
}
