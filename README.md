# 🌤️ Weatherly

**Discover the world's weather, simply.**

Weatherly is a beautiful and intuitive weather app built with Flutter that provides live weather forecasts for any location. With stunning Lottie animations and a clean, modern interface, Weatherly## 🐛 Known Issues

- Ensure your device has internet connectivity for fetching weather data
- First-time font loading requires internet connection
- Location accuracy depends on device GPS capabilities
- Make sure to set up your `.env` file before running the app
- Dark mode follows system settings (Android 10+, iOS 13+)

## 📝 Recent Updates

### v1.0.0 (Latest)
- ✨ Added automatic dark mode support with system theme detection
- 🎭 Changed app icon to custom Weatherly logo
- 🎨 Implemented centralized theme system with ColorScheme
- 📊 Enhanced weather display with 3-column layout (Temperature, Humidity, Condition)
- 🔧 Refactored all pages to use Theme.of(context) for consistent styling
- 🎯 Improved UI consistency between Home and Info pages
- 🔐 Secured API keys with environment variables
- 🚀 Updated to Material Design 3 checking the weather a delightful experience.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## ✨ Features

- 📍 **Auto-Location Detection** - Automatically detects your current location and displays weather information
- 🌡️ **Real-Time Weather Data** - Fetches live weather data from OpenWeather API
- 🎨 **Beautiful Animations** - Smooth Lottie animations for different weather conditions (sunny, cloudy, rainy, snowy, thunderstorm)
- 🔍 **Search Functionality** - Search weather for any city worldwide
- � **Dark Mode Support** - Automatic theme switching based on system preferences (Light/Dark mode)
- 📊 **Detailed Weather Info** - Temperature, Humidity, and Condition displayed in a clean 3-column layout
- �🎯 **Clean UI Design** - Minimalist and user-friendly interface with consistent theming
- 🌐 **Location Permissions** - Smart permission handling for location access
- 🔤 **Custom Typography** - Uses VT323 Google Font throughout the app
- 🔐 **Secure API Key Management** - Environment variables protect sensitive data
- 🎭 **Custom App Icon** - Beautiful Weatherly logo as app icon

## 📱 Screenshots

### Welcome Screen
A welcoming introduction to the app with:
- Weatherly logo (custom app icon)
- Clean call-to-action button
- Adaptive theming (works in light and dark mode)

### Home Screen
- Location icon and city name at the top
- Dynamic weather animation based on current conditions
- Weather details in 3-column layout:
  - **Temperature** (Label: 20px, Value: 16px)
  - **Humidity** (Label: 20px, Value: 16px)
  - **Condition** (Label: 20px, Value: 16px)
- Search icon for exploring other locations
- Automatic dark/light mode based on system settings

### Search Screen
- Search bar with city name input
- Live search results with weather preview
- Card-based layout showing:
  - Weather emoji icons
  - City name
  - Weather description
  - Current temperature
- Tap any result to view detailed information

### Info Page
- Detailed weather information for searched city
- Same layout as Home page for consistency
- Location icon and city name
- Weather animation
- Temperature, Humidity, and Condition display

## 🛠️ Technologies Used

- **Flutter** - UI framework (SDK 3.8.1+)
- **Dart** - Programming language
- **OpenWeather API** - Weather data provider
- **Lottie** - Animated weather icons
- **Geolocator** - Location services
- **Geocoding** - Convert coordinates to city names
- **Permission Handler** - Manage app permissions
- **Google Fonts** - Custom typography (VT323)
- **HTTP** - API calls
- **Flutter Dotenv** - Environment variable management
- **Flutter Launcher Icons** - Custom app icon generation
- **Material Design 3** - Modern UI components with theming

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

dev_dependencies:
  flutter_launcher_icons: ^0.13.1
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

## 🎨 Customization

### Change App Icon

The app icon is already set to use the Weatherly logo. To change it:

1. Replace `assests/Weatherly.png` with your desired icon (1024x1024 recommended)
2. Run the icon generator:
```bash
dart run flutter_launcher_icons
```
3. Rebuild the app

### Theme Customization

The app uses a centralized theme system located in `lib/theme/app_theme.dart`:

- **Light Theme**: White background, black text/icons
- **Dark Theme**: Black background, white text/icons
- Automatically switches based on system preferences

To customize colors, edit the `ColorScheme` in `app_theme.dart`:

```dart
ColorScheme.light(
  primary: Colors.black,        // Button backgrounds in light mode
  onPrimary: Colors.white,      // Button text in light mode
  background: Colors.white,     // Screen background
  onBackground: Colors.black,   // Text color
  // ... more customization options
)
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
├── main.dart                 # App entry point with theme configuration
├── pages/
│   ├── welcome_page.dart    # Welcome/splash screen
│   ├── home_page.dart       # Main weather display screen
│   ├── search_page.dart     # City search screen
│   └── info_page.dart       # Detailed weather info screen
├── services/
│   └── weather_service.dart # Weather API service
└── theme/
    └── app_theme.dart       # Centralized theme configuration

assests/
├── Weatherly.png            # App logo and icon
└── Weather conditions/      # Lottie animation files
    ├── sunny.json
    ├── cloudy.json
    ├── rainy.json
    ├── snowy.json
    └── thunder.json

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

- **Adaptive Theming** - Automatic light/dark mode based on system preferences
- **Material Design 3** - Modern UI components with useMaterial3
- **Centralized Theme System** - Consistent colors across all screens
- **Custom App Icon** - Weatherly logo with adaptive icons for Android
- **Minimalist UI** - Clean, distraction-free design
- **Custom Typography** - VT323 font for weather data (20px labels, 16px values)
- **Smooth Navigation** - Seamless transitions between screens
- **Responsive Layout** - Works on different screen sizes
- **Consistent Layout** - Home page and Info page share the same design
- **Color Harmony** - Colors automatically adjust for readability in both themes

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
