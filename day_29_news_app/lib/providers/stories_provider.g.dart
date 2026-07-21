// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Stories)
final storiesProvider = StoriesProvider._();

final class StoriesProvider
    extends $StreamNotifierProvider<Stories, List<int>> {
  StoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storiesHash();

  @$internal
  @override
  Stories create() => Stories();
}

String _$storiesHash() => r'9818b1e6f9e8ff0b06a79d3eea3db8e9188d167a';

abstract class _$Stories extends $StreamNotifier<List<int>> {
  Stream<List<int>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<int>>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<int>>, List<int>>,
              AsyncValue<List<int>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
