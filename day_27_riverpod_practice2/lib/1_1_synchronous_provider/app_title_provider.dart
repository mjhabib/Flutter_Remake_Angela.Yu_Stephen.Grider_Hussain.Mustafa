import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_title_provider.g.dart';

// Annotating a simple function creates a read-only synchronous provider.
// The name "appTitle" means the generator creates "appTitleProvider".
@riverpod
String appTitle(Ref ref) {
  return 'An example of a Synchronous Provider';
}
