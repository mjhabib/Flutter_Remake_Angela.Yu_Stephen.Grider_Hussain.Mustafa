import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:geolocator/geolocator.dart';

import '/services/networking.dart';

// Important NOTE
// Geolocator Web is only available in secure_contexts (HTTPS), so it MIGHT not gonna work when I'm testing it on my localhost browser!

class LiveLocation {
  /// Determines the current position of the device.
  /// Handles both mobile (Android/iOS) and web platforms.
  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. Mobile-specific: Check if the device's location service (GPS) is turned on.
    // Web does not have a global "GPS toggle" in the same way, so we skip this on web
    // to avoid the MissingPluginException.
    if (!kIsWeb) {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // GPS is turned off in the OS settings.
        return Future.error('Location services are disabled.');
      }
    }

    // 2. Check for existing permissions.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // If denied, request permission.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    // 3. Handle cases where permissions were permanently denied.
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // 4. Get the current position.
    // The browser will automatically trigger the "Allow/Block" permission popup
    // the first time this is called on Web.
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
      distanceFilter: 100,
    );

    try {
      return await Geolocator.getCurrentPosition(
        // Use 'best' for mobile, 'high' or 'best' for web works fine.
        locationSettings: locationSettings,
      );
    } catch (e) {
      debugPrint("Error fetching location: $e");
      return null;
    }
  }

  // for test and debug
  Future<void> getLiveLocation() async {
    Position? position = await LiveLocation.getCurrentLocation();
    if (position != null) {
      print(position.latitude);
      print(position.longitude);
    } else {
      print("Something went wrong!");
    }
  }
}

// since the helper above might fail during test on a web-browser, this class was designed to always return a fixed location (Najafabad)
class FixedLocation {
  double latitude = 32.6329872;
  double longitude = 51.3655016;

  // access .env variable using dotenv package
  final owmAPIKey = dotenv.get('OPENWEATHERMAP_API_KEY');
  late String owmEndpoint =
      "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$owmAPIKey&units=metric";

  // pass on the API endpoint to get a respond
  Future<Map<String, dynamic>> getDecodedData() {
    late NetworkHelper networkHelper = NetworkHelper(url: owmEndpoint);
    return networkHelper.getJsonData();
  }
}

// get WeatherData based on a city name not lat & lon
class CityLocation {
  late String cityName;
  CityLocation({required this.cityName});

  // access .env variable using dotenv package
  final owmAPIKey = dotenv.get('OPENWEATHERMAP_API_KEY');
  late String owmEndpoint =
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$owmAPIKey&units=metric";

  // pass on the API endpoint to get a respond
  Future<Map<String, dynamic>> getDecodedData() {
    late NetworkHelper networkHelper = NetworkHelper(url: owmEndpoint);
    return networkHelper.getJsonData();
  }
}
