// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_title_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appTitle)
final appTitleProvider = AppTitleProvider._();

final class AppTitleProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  AppTitleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appTitleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appTitleHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return appTitle(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$appTitleHash() => r'a83d88b0cd691b958663db597085ae52a4eb820e';
