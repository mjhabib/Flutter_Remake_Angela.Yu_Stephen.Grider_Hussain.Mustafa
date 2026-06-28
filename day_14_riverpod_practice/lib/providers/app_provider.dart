import 'package:flutter_riverpod/flutter_riverpod.dart';

// We're creating one global provider, just like "final pi = 3.14;"
// and we use 'final' because the provider object itself (not its value/state) should never change .
final appNameProvider = Provider<String>((Ref ref) {
  return 'Riverpod App';
});
