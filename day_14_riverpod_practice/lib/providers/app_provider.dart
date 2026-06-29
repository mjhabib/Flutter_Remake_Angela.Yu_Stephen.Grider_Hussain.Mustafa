import 'package:flutter_riverpod/flutter_riverpod.dart';

// We're creating one global provider, just like "final pi = 3.14;"
// and we use 'final' because the provider object itself (not its value/state) should never change .
final appNameProvider = Provider<String>((Ref ref) {
  return 'Riverpod App';
});

// Provider Composition:
// Note: I didn't need to use 'ref' for this provider simply because my app doesn't need it. But in some cases, one provider can depends on another provider and this is when we need to use 'ref'.

// Ex: the fullNameProvider depends on both firstName and lastName provider to return a name.

// final fullNameProvider = Provider<String>((ref) {
//   final firstName = ref.watch(firstNameProvider);
//   final lastName = ref.watch(lastNameProvider);
//   return '$firstName $lastName';
// });

// Now, if either name or family changes, the fullName will change too.

// These types of things or certain calculations usually lives inside the provider because:
// A: Widgets should mostly display data.
// B: Providers should prepare data.

// -------------------------------------------------------------------------------------------

// FutureProvider

// FutureProvider is for asynchronous data.
// It returns an AsyncValue<T>, not a T.
// AsyncValue can be:
// A. Loading
// B. Data
// C. Error
// .when() is the easiest and most idiomatic way to handle all three states.
