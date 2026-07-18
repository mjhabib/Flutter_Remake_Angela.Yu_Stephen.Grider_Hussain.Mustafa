// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_planet_description_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchPlanetDescription)
final fetchPlanetDescriptionProvider = FetchPlanetDescriptionFamily._();

final class FetchPlanetDescriptionProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  FetchPlanetDescriptionProvider._({
    required FetchPlanetDescriptionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchPlanetDescriptionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchPlanetDescriptionHash();

  @override
  String toString() {
    return r'fetchPlanetDescriptionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return fetchPlanetDescription(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPlanetDescriptionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchPlanetDescriptionHash() =>
    r'406eef3b57b8694a0ea5e82943a6b83e91d79b42';

final class FetchPlanetDescriptionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  FetchPlanetDescriptionFamily._()
    : super(
        retry: null,
        name: r'fetchPlanetDescriptionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchPlanetDescriptionProvider call(String planetName) =>
      FetchPlanetDescriptionProvider._(argument: planetName, from: this);

  @override
  String toString() => r'fetchPlanetDescriptionProvider';
}
