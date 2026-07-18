import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_title_provider.g.dart';

/* This pattern is used to expose read-only values that do not involve async loops or future calculations (e.g., exposing a static configuration string, an API client utility, or simple calculated values). */
// Annotating a simple function creates a read-only synchronous provider.
// The name "appTitle" means the generator creates "appTitleProvider".
@riverpod
String appTitle(Ref ref) {
  return 'An example of a Synchronous Provider';
}
