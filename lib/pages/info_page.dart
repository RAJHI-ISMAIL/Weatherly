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
    // Access theme colors
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: colorScheme.background,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: theme.iconTheme.color,
                size: 30,
              ),
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
                color: colorScheme.onBackground,
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
              Icon(
                Icons.location_on_outlined,
                size: 34,
                color: theme.iconTheme.color,
              ),

              const SizedBox(height: 8),

              // City Name
              Text(
                weatherData['cityName'],
                style: TextStyle(
                  fontFamily: GoogleFonts.vt323().fontFamily,
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onBackground,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 40),

              // Weather Animation
              Lottie.asset(
                _getWeatherAnimation(weatherData['condition']),
                width: 297,
                height: 297,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // Weather Details Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Temperature Column
                    Column(
                      children: [
                        Text(
                          'Temperature',
                          style: TextStyle(
                            fontFamily: GoogleFonts.vt323().fontFamily,
                            fontSize: 20,
                            color: colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${weatherData['temperature'].round()}°',
                          style: TextStyle(
                            fontFamily: GoogleFonts.vt323().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    // Humidity Column
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(
                            fontFamily: GoogleFonts.vt323().fontFamily,
                            fontSize: 20,
                            color: colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${weatherData['humidity']}%',
                          style: TextStyle(
                            fontFamily: GoogleFonts.vt323().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    // Condition Column
                    Column(
                      children: [
                        Text(
                          'Condition',
                          style: TextStyle(
                            fontFamily: GoogleFonts.vt323().fontFamily,
                            fontSize: 20,
                            color: colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          weatherData['condition'],
                          style: TextStyle(
                            fontFamily: GoogleFonts.vt323().fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
