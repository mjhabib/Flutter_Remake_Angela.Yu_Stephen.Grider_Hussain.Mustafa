// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchUserData)
final fetchUserDataProvider = FetchUserDataProvider._();

final class FetchUserDataProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  FetchUserDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchUserDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchUserDataHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return fetchUserData(ref);
  }
}

String _$fetchUserDataHash() => r'c24795133d14e11c7b158882b21a453114d3394d';
