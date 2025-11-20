class RoutePaths {
  // Root Routes
  static const String root = '/';

  // Auth Routes
  static const String initialAuth = '/auth';
  static const String signUp = '/auth/signup';
  static const String signIn = '/auth/signIn';
  static const String resetPassword = '/auth/resetpassword';
  static const String newPassword = '/auth/newpassword';
  static const String verification = '/auth/verification';
  static const String verficationPasswordEmail = '/auth/verficationPassword';

  // Main Routes
  static const String search = '/app/search';
  static const String home = '/app/home';
  static const String series = '/app/series';
  static const String favorite = '/app/favorite';
  static const String seeAll = '/app/seeAll';
  static const String profile = '/app/profile';
  static const String editProfile = '/app/editProfile';
  static const String navigation = '/app/navigation';
  static const String categorySeeAll = '/app/categorySeeAll';
  // Details Routes
  static const String detail = '/details/detail';

  static const String season = '/tv/season';
  static const String episode = '/tv/episode';
  // Onboarding Routes

  static const String onBoarding = '/onboarding';
  static const String splash = '/splashview';

  // Utility Routes
  static const String youtubePlayer = '/player/youtubePlayerVideo';
  static const String customWebView = '/customWebView';
  static const String discover = '/discover';
}
