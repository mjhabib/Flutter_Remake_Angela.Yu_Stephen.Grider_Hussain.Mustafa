import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:geolocator/geolocator.dart';

// Important NOTE
// Geolocator Web is only available in secure_contexts (HTTPS), so it MIGHT not gonna work when I'm testing it on my localhost browser!

class Location {
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
}
