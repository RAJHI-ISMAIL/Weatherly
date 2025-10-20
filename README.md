# 🌤️ Weatherly

**Discover the world's weather, simply.**

Weatherly is a beautiful and intuitive weather app built with Flutter that provides live weather forecasts for any location. With stunning Lottie animations and a clean, modern interface, Weatherly makes checking the weather a delightful experience.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

- 📍 **Auto-Location Detection** - Automatically detects your current location and displays weather information
- 🌡️ **Real-Time Weather Data** - Fetches live weather data from OpenWeather API
- 🎨 **Beautiful Animations** - Smooth Lottie animations for different weather conditions (sunny, cloudy, rainy, snowy, thunderstorm)
- 🔍 **Search Functionality** - Search weather for any city worldwide
- 🎯 **Clean UI Design** - Minimalist and user-friendly interface
- 🌐 **Location Permissions** - Smart permission handling for location access
- 🔤 **Custom Typography** - Uses VT323 Google Font for temperature display

## 📱 Screenshots

### Welcome Screen
A welcoming introduction to the app with a clean call-to-action button.

### Home Screen
- Location icon and city name at the top
- Dynamic weather animation based on current conditions
- Large temperature display with custom font
- Search icon for exploring other locations

## 🛠️ Technologies Used

- **Flutter** - UI framework
- **Dart** - Programming language
- **OpenWeather API** - Weather data provider
- **Lottie** - Animated weather icons
- **Geolocator** - Location services
- **Geocoding** - Convert coordinates to city names
- **Permission Handler** - Manage app permissions
- **Google Fonts** - Custom typography (VT323)
- **HTTP** - API calls
- **Flutter Dotenv** - Environment variable management

## 📦 Packages Used

```yaml
dependencies:
  lottie: ^3.1.3
  geolocator: ^13.0.2
  permission_handler: ^11.3.1
  http: ^1.2.2
  geocoding: ^3.0.0
  google_fonts: ^6.2.1
  flutter_dotenv: ^5.1.0
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/RAJHI-ISMAIL/Weatherly.git
cd Weatherly
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure Environment Variables**
   - Copy the `.env.example` file to `.env`:
   ```bash
   cp .env.example .env
   ```
   
4. **Get OpenWeather API Key**
   - Go to [OpenWeather API](https://openweathermap.org/api)
   - Sign up for a free account
   - Get your API key

5. **Add your API Key**
   - Open the `.env` file in the project root
   - Replace `your_api_key_here` with your actual API key:
   ```env
   OPENWEATHER_API_KEY=your_actual_api_key_here
   ```
   - ⚠️ **Important**: Never commit the `.env` file to version control! It's already in `.gitignore`.

6. **Run the app**
```bash
flutter run
```

## 🔧 Configuration

### Android Permissions

The app requires location permissions. These are already configured in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS Permissions

For iOS, add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs your location to show weather information</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs your location to show weather information</string>
```

## 📂 Project Structure

```
lib/
├── main.dart                 # App entry point
├── pages/
│   ├── welcome_page.dart    # Welcome/splash screen
│   ├── home_page.dart       # Main weather display screen
│   ├── search_page.dart     # City search screen
│   └── info_page.dart       # Detailed weather info screen
└── services/
    └── weather_service.dart # Weather API service

.env                         # Environment variables (API keys) - NOT committed
.env.example                 # Template for environment variables
```

## 🌈 Weather Conditions & Animations

Weatherly displays different Lottie animations based on weather conditions:

- ☀️ **Clear/Sunny** - `sunny.json`
- ☁️ **Cloudy** - `cloudy.json`
- 🌧️ **Rainy** - `rainy.json`
- ❄️ **Snowy** - `snowy.json`
- ⛈️ **Thunderstorm** - `thunder.json`

## 🎨 Design Features

- **Gradient Background** on welcome page
- **Minimalist UI** with white background
- **Custom Typography** using VT323 font for temperature
- **Smooth Navigation** between screens
- **Responsive Layout** for different screen sizes

## 🔐 Permissions

The app requires the following permissions:

- **Location** - To detect your current location
- **Internet** - To fetch weather data from the API

The app will prompt for these permissions on first launch.

## � Security

This app uses environment variables to keep API keys secure:

- API keys are stored in `.env` file (not tracked by git)
- `.env` file is listed in `.gitignore` to prevent accidental commits
- `.env.example` provides a template for collaborators
- Never commit your actual API keys to version control

## �🐛 Known Issues

- Ensure your device has internet connectivity for fetching weather data
- First-time font loading requires internet connection
- Location accuracy depends on device GPS capabilities
- Make sure to set up your `.env` file before running the app

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

**RAJHI ISMAIL**

- GitHub: [@RAJHI-ISMAIL](https://github.com/RAJHI-ISMAIL)

## 🙏 Acknowledgments

- Weather data provided by [OpenWeather](https://openweathermap.org/)
- Lottie animations for beautiful weather icons
- Flutter community for amazing packages and support

## 📞 Support

If you have any questions or need help, feel free to open an issue or contact the maintainer.

---

**Made with ❤️ using Flutter**
