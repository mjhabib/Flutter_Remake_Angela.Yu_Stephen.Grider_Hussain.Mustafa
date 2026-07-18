// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiveChat)
final liveChatProvider = LiveChatProvider._();

final class LiveChatProvider
    extends $StreamNotifierProvider<LiveChat, List<String>> {
  LiveChatProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveChatProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveChatHash();

  @$internal
  @override
  LiveChat create() => LiveChat();
}

String _$liveChatHash() => r'7c694b7f1f6e5bf0af6c8b3a46a2beaaf5c0ecae';

abstract class _$LiveChat extends $StreamNotifier<List<String>> {
  Stream<List<String>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
