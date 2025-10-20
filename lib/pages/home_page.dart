import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/weather_service.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName = 'Loading...';
  String weatherCondition = 'sunny';
  double temperature = 0.0;
  bool isLoading = true;
  bool isNavigating = false;

  @override
  void initState() {
    super.initState();
    _checkLocationPermissionAndGetWeather();
  }

  Future<void> _checkLocationPermissionAndGetWeather() async {
    // Check if location permission is granted
    var status = await Permission.location.status;

    if (status.isDenied) {
      // Request permission
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      await _getCurrentLocationAndWeather();
    } else if (status.isPermanentlyDenied) {
      // Show dialog to open app settings
      _showPermissionDialog();
    } else {
      // Permission denied
      _showPermissionDialog();
    }
  }

  Future<void> _getCurrentLocationAndWeather() async {
    try {
      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get city name from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        setState(() {
          cityName = placemarks[0].locality ?? 'Unknown City';
        });
      }

      // Get weather data
      WeatherService weatherService = WeatherService();
      Map<String, dynamic> weatherData = await weatherService
          .getWeatherByCoordinates(position.latitude, position.longitude);

      setState(() {
        temperature = weatherData['temperature'];
        weatherCondition = weatherData['condition'];
        isLoading = false;
      });
    } catch (e) {
      print('Error getting location or weather: $e');
      setState(() {
        cityName = 'Error';
        isLoading = false;
      });
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text(
          'This app needs location permission to show weather information for your current location.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _checkLocationPermissionAndGetWeather();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  String _getWeatherAnimation() {
    switch (weatherCondition.toLowerCase()) {
      case 'clear':
        return 'assests/Weather conditions/sunny.json';
      case 'clouds':
        return 'assests/Weather conditions/cloudy.json';
      case 'rain':
      case 'drizzle':
        return 'assests/Weather conditions/rainy.json';
      case 'snow':
        return 'assests/Weather conditions/snowy.json';
      case 'thunderstorm':
        return 'assests/Weather conditions/thunder.json';
      default:
        return 'assests/Weather conditions/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : SafeArea(
              child: Column(
                children: [
                  // Search Icon (moved down with padding)
                  Padding(
                    padding: const EdgeInsets.only(top: 40, right: 16),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () async {
                          if (isNavigating) return; // Prevent multiple taps

                          setState(() {
                            isNavigating = true;
                          });

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );

                          setState(() {
                            isNavigating = false;
                          });
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Location Icon
                  const Icon(
                    Icons.location_on_outlined,
                    size: 34,
                    color: Colors.black,
                  ),

                  const SizedBox(height: 8),

                  // City Name
                  Text(
                    cityName,
                    style: TextStyle(
                      fontFamily: GoogleFonts.vt323().fontFamily,
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Weather Animation
                  Lottie.asset(
                    _getWeatherAnimation(),
                    width: 297,
                    height: 297,
                    fit: BoxFit.contain,
                  ),

                  const Spacer(),

                  // Temperature (stays at bottom)
                  Text(
                    '${temperature.round()}°',
                    style: TextStyle(
                      fontFamily: GoogleFonts.vt323().fontFamily,
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
    );
  }
}
