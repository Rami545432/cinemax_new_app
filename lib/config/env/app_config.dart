import 'package:firebase_core/firebase_core.dart';

class AppConfig {
  final String environmentName;
  final String tmdbApiKey;
  final String baseUrl;
  final String geminiApiKey;
  final FirebaseOptions firebaseOptions; // Keeps your Firebase Dev/Prod databases separate!

  AppConfig({
    required this.environmentName,
    required this.tmdbApiKey,
    required this.baseUrl,
    required this.geminiApiKey,
    required this.firebaseOptions,
  });
}
