// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String welcomeUser(String username) {
    return 'مرحباً، $username !';
  }

  @override
  String get authLogin => 'تسجيل الدخول';

  @override
  String get authRegister => 'إنشاء حساب';

  @override
  String get authEmail => 'البريد الإلكتروني';

  @override
  String get authPassword => 'كلمة المرور';

  @override
  String get authForgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get authResetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get authResetPasswordSuccess => 'تمت إعادة تعيين كلمة المرور بنجاح';

  @override
  String get authResetPasswordError => 'فشل في إعادة تعيين كلمة المرور';

  @override
  String get authSignInWith => 'أو تسجيل الدخول بواسطة';

  @override
  String get authLogout => 'تسجيل الخروج';

  @override
  String get popular => 'الأكثر شهرة';

  @override
  String get nowPlaying => 'قيد العرض';

  @override
  String get topRated => 'الأعلى تقييماً';

  @override
  String get upcoming => 'قريباً';

  @override
  String get trending => 'الشائع';

  @override
  String get search => 'بحث';

  @override
  String get searchHint => 'ابحث عن فيلم أو مسلسل...';

  @override
  String get searchHistory => 'سجل البحث';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get about => 'حول';

  @override
  String get cast => 'طاقم التمثيل';

  @override
  String get similar => 'مماثل';

  @override
  String get recommended => 'موصى به';

  @override
  String get reviews => 'المراجعات';

  @override
  String get seasons => 'المواسم';

  @override
  String get episodes => 'الحلقات';

  @override
  String get network => 'الشبكة';

  @override
  String get productionCompany => 'شركة الإنتاج';

  @override
  String get movieGenres => 'أنواع الأفلام';

  @override
  String get tvGenres => 'أنواع المسلسلات';

  @override
  String get all => 'الكل';

  @override
  String get movies => 'الأفلام';

  @override
  String get tvShows => 'المسلسلات';

  @override
  String get originalTitle => 'العنوان الأصلي';

  @override
  String get releaseDate => 'تاريخ الإصدار';

  @override
  String get runtime => 'المدة الزمنية';

  @override
  String get status => 'الحالة';

  @override
  String get language => 'اللغة';

  @override
  String get budget => 'الميزانية';

  @override
  String get revenue => 'الإيرادات';

  @override
  String get overview => 'الوصف';

  @override
  String get storyLine => 'القصة';

  @override
  String get noDescriptionAvailable => 'لا يوجد وصف متاح';

  @override
  String get less => 'أقل';

  @override
  String get more => 'أكثر';

  @override
  String get geners => 'الفئات';

  @override
  String get countries => 'الدول المنتجة';

  @override
  String get informations => 'المعلومات';

  @override
  String get trailers => 'المقاطع الترويجية';

  @override
  String get profile => 'الحساب';

  @override
  String get theme => 'السمة';

  @override
  String get system => 'النظام';

  @override
  String get light => 'وضع الاضاءة ';

  @override
  String get dark => 'الوضع الليلي';

  @override
  String get favorites => 'المفضلة';

  @override
  String get myProfile => 'حسابي';

  @override
  String get noItemsFound => 'لا يوجد عناصر متاحة';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String nofavorites(String type) {
    return 'لا يوجد $type في المفضلة';
  }

  @override
  String startAddingYourFavorite(String type) {
    return 'ابدأ بإضافة $type المفضلة';
  }

  @override
  String get noTrailersAvailable => 'لا يوجد مقاطع ترويجية متاحة';

  @override
  String get noSeasonsAvailable => 'لا يوجد مواسم متاحة';

  @override
  String get noEpisodesAvailable => 'لا يوجد حلقات متاحة';

  @override
  String get noReviewsAvailable => 'لا يوجد مراجعات متاحة';

  @override
  String get signInHint =>
      'سجل الدخول لمزامنة المفضلة والمسلسلات والاستخدام المزيد من الميزات';

  @override
  String get airingToday => 'يعرض اليوم';

  @override
  String get discover => 'اكتشف';

  @override
  String get genreAction => 'حركة';

  @override
  String get genreAdventure => 'مغامرة';

  @override
  String get genreAnimation => 'رسوم متحركة';

  @override
  String get genreComedy => 'كوميديا';

  @override
  String get genreCrime => 'جريمة';

  @override
  String get genreDocumentary => 'وثائقي';

  @override
  String get genreDrama => 'دراما';

  @override
  String get genreFamily => 'عائلي';

  @override
  String get genreFantasy => 'خيالي';

  @override
  String get genreHistory => 'تاريخي';

  @override
  String get genreHorror => 'رعب';

  @override
  String get genreMusic => 'موسيقي';

  @override
  String get genreMystery => 'غموض';

  @override
  String get genreRomance => 'رومانسي';

  @override
  String get genreSciFi => 'خيال علمي';

  @override
  String get genreTvMovie => 'فيلم تلفزيوني';

  @override
  String get genreThriller => 'اثارة';

  @override
  String get genreWar => 'حربي';

  @override
  String get genreWestern => 'غربي';

  @override
  String get genreActionAdventure => 'اكشن و مغامرة';

  @override
  String get genreKids => 'أطفال';

  @override
  String get genreNews => 'أخبار';

  @override
  String get genreReality => 'واقعي';

  @override
  String get genreSciFiFantasy => 'خيال علمي و فانتازيا';

  @override
  String get genreSoap => 'سوب';

  @override
  String get genreTalk => 'حوار';

  @override
  String get genreWarPolitics => 'حرب و سياسة';

  @override
  String get parts => 'الأجزاء';
}
