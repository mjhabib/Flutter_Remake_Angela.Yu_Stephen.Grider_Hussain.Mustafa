// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginValidation)
final loginValidationProvider = LoginValidationProvider._();

final class LoginValidationProvider
    extends $NotifierProvider<LoginValidation, void> {
  LoginValidationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginValidationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginValidationHash();

  @$internal
  @override
  LoginValidation create() => LoginValidation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$loginValidationHash() => r'5a1caad84910fc0efe3b4484b4f5d700ea17849d';

abstract class _$LoginValidation extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
