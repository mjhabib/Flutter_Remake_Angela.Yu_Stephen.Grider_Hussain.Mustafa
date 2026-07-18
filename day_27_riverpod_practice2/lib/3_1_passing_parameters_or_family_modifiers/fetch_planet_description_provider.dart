import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_planet_description_provider.g.dart';

/* This pattern is used when your provider needs external runtime input to calculate its value—such as passing a user ID to a profile fetch query, or an index value to a specific data model filter.
With Riverpod code generation, you don't use the classic .family modifier anymore. Instead, you simply add extra arguments to your annotated provider function. The generator automatically modifies the constructor so you can pass those values when watching the provider in the UI. */

// Adding arguments after 'Ref ref' turns this into a parametrized provider.
// This function generates "fetchPlanetDescriptionProvider".
@riverpod
Future<String> fetchPlanetDescription(Ref ref, String planetName) async {
  // Simulate an asynchronous API fetch delay based on the parameter input
  await Future.delayed(const Duration(seconds: 5));

  if (planetName.toLowerCase() == 'mars') {
    return 'Mars is the fourth planet from the Sun and the second-smallest.';
  } else if (planetName.toLowerCase() == 'jupiter') {
    return 'Jupiter is the fifth planet from the Sun and the largest in the Solar System.';
  }

  return 'Unknown celestial planet.';
}
