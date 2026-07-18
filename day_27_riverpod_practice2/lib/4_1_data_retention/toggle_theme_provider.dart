import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_theme_provider.g.dart';

/* By default, every provider created via the Riverpod code generator uses the autoDispose strategy under the hood. This means as soon as the user leaves the screen and the UI stops watching the provider, the state is completely destroyed to save memory.
However, for persistent global states—like user authentication sessions, localized settings, or deeply cached home feed data—you want to prevent this cleanup. We achieve this in modern Riverpod by passing keepAlive: true directly into the @Riverpod annotation. */

// By passing keepAlive: true, Riverpod will never clear this state out of memory,
// even if zero widgets are actively watching it.
@Riverpod(keepAlive: true)
class AppSettings extends _$AppSettings {
  @override
  bool build() {
    return false; // Default: Dark Mode is disabled
  }

  void toggleTheme() {
    state = !state;
  }
}
