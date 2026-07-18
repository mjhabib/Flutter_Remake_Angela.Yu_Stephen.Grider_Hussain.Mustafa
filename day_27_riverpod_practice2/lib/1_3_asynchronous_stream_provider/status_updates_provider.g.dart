// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_updates_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(statusUpdates)
final statusUpdatesProvider = StatusUpdatesProvider._();

final class StatusUpdatesProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  StatusUpdatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statusUpdatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statusUpdatesHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return statusUpdates(ref);
  }
}

String _$statusUpdatesHash() => r'd43fbf949ae12d5acf2cf6eded5862f9ee3a4eae';
