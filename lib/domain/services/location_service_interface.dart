/// Model class for location data
class LocationData {
  final double latitude;
  final double longitude;
  final double? altitude;
  final double? accuracy;
  final double? speed;
  final double? heading;
  final DateTime timestamp;

  LocationData({
    required this.latitude,
    required this.longitude,
    this.altitude,
    this.accuracy,
    this.speed,
    this.heading,
    required this.timestamp,
  });

  @override
  String toString() {
    return 'LocationData(lat: $latitude, lng: $longitude, alt: $altitude, accuracy: $accuracy, speed: $speed, heading: $heading, time: $timestamp)';
  }
}

/// Enum representing the status of location services
enum LocationServiceStatus {
  disabled,
  enabled,
  permissionDenied,
  permissionGranted,
  permissionDeniedForever
}

abstract class LocationServiceInterface {
  /// Initializes the location service.
  /// Returns [true] if initialization is successful, [false] otherwise.
  Future<bool> initialize();

  /// Requests location permission from the user.
  /// Returns the current [LocationServiceStatus] after the request.
  Future<LocationServiceStatus> requestPermission();

  /// Checks the current status of location services and permissions.
  /// Returns the current [LocationServiceStatus].
  Future<LocationServiceStatus> checkPermission();

  /// Gets the current location of the device.
  /// Returns [LocationData] containing current coordinates and related information.
  /// Throws an exception if location services are not available or permitted.
  Future<LocationData> getCurrentLocation();

  /// Starts listening for location updates.
  /// [onLocationChanged] is called whenever the location changes.
  /// [distanceFilter] specifies the minimum distance (in meters) the device
  /// must move before triggering a location update.
  /// Returns a subscription ID that can be used to stop listening.
  Future<String> startLocationUpdates({
    required Function(LocationData) onLocationChanged,
    double distanceFilter = 0.0,
  });

  /// Stops listening for location updates for the given subscription ID.
  /// Returns [true] if successfully stopped, [false] otherwise.
  Future<bool> stopLocationUpdates(String subscriptionId);

  /// Calculates the distance between two locations in meters.
  /// [startLocation] is the starting location.
  /// [endLocation] is the ending location.
  /// Returns the distance in meters.
  double calculateDistance(LocationData startLocation, LocationData endLocation);

  /// Gets the last known location of the device.
  /// Returns [LocationData] or [null] if no location is available.
  Future<LocationData?> getLastKnownLocation();

  /// Checks if location services are enabled on the device.
  /// Returns [true] if enabled, [false] otherwise.
  Future<bool> isLocationServiceEnabled();
}