# Environment Variables Setup Guide

This guide explains how to use `.env` files in your Flutter app and how to add new API keys.

## 📋 Current Setup

Your app is now configured to use environment variables for:
- ✅ **TMDB API Key** - Used in `SecurityInterceptor`
- ✅ **Firebase Configuration** - All platform keys (Web, Android, iOS, macOS)

## 🔧 How to Add New API Keys

### Step 1: Add to `.env` File

Open the `.env` file in your project root and add your new key:

```env
# Your existing keys...
TMDB_API_KEY=23e981c4511a42f47649472bd8b1bd50

# Add your new key here
YOUR_NEW_API_KEY=your_actual_api_key_value
ANOTHER_SERVICE_KEY=another_key_value
```

### Step 2: Add to `.env.example` File

Add the same key (with placeholder value) to `.env.example`:

```env
# Your existing keys...
TMDB_API_KEY=your_tmdb_api_key_here

# Add your new key here
YOUR_NEW_API_KEY=your_new_api_key_here
ANOTHER_SERVICE_KEY=your_another_service_key_here
```

### Step 3: Use in Your Code

Import `flutter_dotenv` and access the variable:

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Get the value
String apiKey = dotenv.env['YOUR_NEW_API_KEY'] ?? '';

// With default value
String apiKey = dotenv.env['YOUR_NEW_API_KEY'] ?? 'default_value';

// Check if exists
if (dotenv.env.containsKey('YOUR_NEW_API_KEY')) {
  // Use it
  String apiKey = dotenv.env['YOUR_NEW_API_KEY']!;
}
```

### Step 4: Example - Adding a Google Maps API Key

1. **Add to `.env`:**
```env
GOOGLE_MAPS_API_KEY=AIzaSyExample123456789
```

2. **Add to `.env.example`:**
```env
GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
```

3. **Use in code:**
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapService {
  String get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  
  void initializeMap() {
    if (googleMapsApiKey.isEmpty) {
      throw Exception('Google Maps API key not found');
    }
    // Use the key...
  }
}
```

## 📁 File Structure

```
cinemax_app/
├── .env                 # Your actual keys (NOT committed to git)
├── .env.example         # Template file (committed to git)
├── .gitignore          # Ensures .env is ignored
└── lib/
    └── main.dart       # Loads .env on app start
```

## 🔒 Security Best Practices

1. **Never commit `.env` to git** - It's already in `.gitignore`
2. **Always commit `.env.example`** - This helps other developers
3. **Use descriptive variable names** - e.g., `TMDB_API_KEY` not `KEY1`
4. **Add comments in `.env`** - Group related keys together
5. **Validate required keys** - Check if keys exist before using them

## 🚀 Usage Examples

### Example 1: Simple API Key
```dart
// In your service class
class ApiService {
  final String apiKey = dotenv.env['MY_API_KEY'] ?? '';
  
  Future<void> makeRequest() async {
    if (apiKey.isEmpty) {
      throw Exception('API key not configured');
    }
    // Use apiKey...
  }
}
```

### Example 2: Multiple Keys
```dart
class ConfigService {
  static String get tmdbKey => dotenv.env['TMDB_API_KEY'] ?? '';
  static String get firebaseKey => dotenv.env['FIREBASE_WEB_API_KEY'] ?? '';
  static String get mapsKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  
  static bool validateKeys() {
    return tmdbKey.isNotEmpty && 
           firebaseKey.isNotEmpty && 
           mapsKey.isNotEmpty;
  }
}
```

### Example 3: With Error Handling
```dart
String getApiKey(String keyName) {
  final key = dotenv.env[keyName];
  if (key == null || key.isEmpty) {
    throw Exception('Required environment variable $keyName is missing');
  }
  return key;
}

// Usage
final apiKey = getApiKey('TMDB_API_KEY');
```

## ⚠️ Important Notes

1. **Restart Required**: After changing `.env`, you must **restart** your app (hot reload won't reload `.env`)

2. **Case Sensitive**: Variable names are case-sensitive
   - ✅ `TMDB_API_KEY`
   - ❌ `tmdb_api_key` (different variable)

3. **No Quotes Needed**: Don't use quotes in `.env` file
   - ✅ `TMDB_API_KEY=abc123`
   - ❌ `TMDB_API_KEY="abc123"` (quotes will be part of the value)

4. **No Spaces**: Don't put spaces around the `=` sign
   - ✅ `KEY=value`
   - ❌ `KEY = value` (space will be part of the key name)

5. **Comments**: Use `#` for comments
   ```env
   # This is a comment
   API_KEY=value  # Inline comment
   ```

## 🔍 Troubleshooting

### Problem: Variable returns null
- **Solution**: Check spelling (case-sensitive)
- **Solution**: Ensure `.env` is in project root
- **Solution**: Restart the app after adding to `.env`

### Problem: App crashes on startup
- **Solution**: Check that `.env` file exists
- **Solution**: Verify `.env` is in `pubspec.yaml` assets
- **Solution**: Check for syntax errors in `.env` (no spaces around `=`)

### Problem: Changes not reflected
- **Solution**: Restart the app (not just hot reload)
- **Solution**: Run `flutter clean` and rebuild

## 📝 Current Environment Variables

Your `.env` file currently contains:

- `TMDB_API_KEY` - The Movie Database API key
- `FIREBASE_WEB_*` - Firebase web platform configuration
- `FIREBASE_ANDROID_*` - Firebase Android platform configuration
- `FIREBASE_IOS_*` - Firebase iOS platform configuration
- `FIREBASE_MACOS_*` - Firebase macOS platform configuration

## 🎯 Quick Reference

| Task | Action |
|------|--------|
| Add new key | Add to `.env` and `.env.example` |
| Use in code | `dotenv.env['KEY_NAME']` |
| Check if exists | `dotenv.env.containsKey('KEY_NAME')` |
| Default value | `dotenv.env['KEY_NAME'] ?? 'default'` |
| After changes | Restart the app |

---

**Need help?** Check the code examples in:
- `lib/main.dart` - How `.env` is loaded
- `lib/core/network/Interceptors/security_interceptor.dart` - TMDB key usage
- `lib/firebase_options.dart` - Firebase keys usage

