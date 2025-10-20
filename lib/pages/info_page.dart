import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const InfoPage({super.key, required this.weatherData});

  String _getWeatherAnimation(String condition) {
    switch (condition.toLowerCase()) {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Weather Details',
              style: TextStyle(
                fontFamily: GoogleFonts.vt323().fontFamily,
                fontSize: 32,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Location Icon
              const Icon(
                Icons.location_on_outlined,
                size: 34,
                color: Colors.black,
              ),

              const SizedBox(height: 5),

              // City Name
              Text(
                weatherData['cityName'],
                style: TextStyle(
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 30),

              // Weather Animation
              Lottie.asset(
                _getWeatherAnimation(weatherData['condition']),
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // Temperature
              Text(
                '${weatherData['temperature'].round()}°',
                style: TextStyle(
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  fontSize: 60,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
