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
  String get light => 'الوضع النهاري';

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

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get sortBy => 'ترتيب حسب';

  @override
  String get sortPopularityDesc => 'الأكثر شهرة';

  @override
  String get sortPopularityAsc => 'الأقل شهرة';

  @override
  String get sortRatingDesc => 'الأعلى تقييماً';

  @override
  String get sortRatingAsc => 'الأقل تقييماً';

  @override
  String get sortReleaseDateDesc => 'الأحدث';

  @override
  String get sortReleaseDateAsc => 'الأقدم';

  @override
  String get sortRevenueDesc => 'الأعلى إيراداً';

  @override
  String get sortRevenueAsc => 'الأقل إيراداً';

  @override
  String get sortVoteCountDesc => 'الأكثر تصويتاً';

  @override
  String get sortVoteCountAsc => 'الأقل تصويتاً';

  @override
  String get sortFirstAirDateDesc => 'الأحدث';

  @override
  String get sortFirstAirDateAsc => 'الأقدم';

  @override
  String get sortVoteAverageDesc => 'الأعلى تقييماً';

  @override
  String get sortVoteAverageAsc => 'الأقل تقييماً';

  @override
  String get home => 'الرئيسية';

  @override
  String get applyFilters => 'تطبيق';

  @override
  String get clearFilters => 'مسح';

  @override
  String get collections => 'المجموعات';

  @override
  String get cartoons => 'رسوم متحركة';

  @override
  String get anime => 'أنمي';

  @override
  String get maifa => 'مافيا';

  @override
  String get marvel => 'مارفل';

  @override
  String get year => 'سنة';

  @override
  String get rating => 'تقييم';

  @override
  String get min => 'دقيقة';

  @override
  String get cartoonDescreption => 'مرح ملون وضحكات مريحة وأجواء مبهجة';

  @override
  String get mafiaDescreption => 'قوة وولاء وخيانة - قصص العالم السفلي.';

  @override
  String get animeDescreption => 'عوالم ملحمية ومشاعر عميقة ومعارك لا تُنسى.';

  @override
  String get marvelDescreption =>
      'أبطال وأشرار وجنون الأكوان المتعددة - كل شيء في مكان واحد.';

  @override
  String get logoutSuccessfully => 'تم تسجيل الخروج بنجاح';

  @override
  String get backOnline => 'متصل بالإنترنت';

  @override
  String durationFormat(int hours, int minutes) {
    return '$hoursس $minutesد';
  }

  @override
  String get duration => 'المدة';

  @override
  String noFavoritesContentType(String type) {
    return 'لا يوجد في المفضلة $type';
  }

  @override
  String get statusReleased => 'تم الاصدار';

  @override
  String get statusEnded => 'تم الانتهاء';

  @override
  String get statusReturningSeries => 'يعرض حاليا';

  @override
  String get statusInProduction => 'قيد الانتاج';

  @override
  String get statusCanceled => 'تم الالغاء';

  @override
  String get statusUnknown => 'غير معروف';

  @override
  String numberFormat(int number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      decimalDigits: 0,
      symbol: '\$',
    );
    final String numberString = numberNumberFormat.format(number);

    return '$numberString';
  }

  @override
  String get onboardingTitle1 => 'اكتشف هوسك القادم';

  @override
  String get onboardingDesc1 =>
      'اكتشف الأفلام الرائجة والمسلسلات التي تستحق المشاهدة في ثوانٍ.';

  @override
  String get onboardingTitle2 => 'احتفظ بمفضلاتك قريبًا';

  @override
  String get onboardingDesc2 =>
      'احفظ الأفلام والمسلسلات التي تحبها في قائمة المشاهدة الخاصة بك.';

  @override
  String get onboardingTitle3 => 'شاهد قبل أن تقرر';

  @override
  String get onboardingDesc3 =>
      'تحقق من الإعلانات الترويجية والتقييمات والمراجعات قبل البدء بالمشاهدة.';

  @override
  String get onboardingTitle0 => 'هوسك السينمائي القادم يبدأ من هنا';

  @override
  String get loginSuccessfully => 'تم تسجيل الدخول بنجاح';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get loginTagline => 'سجل دخولك للحفاظ على قائمتك المفضلة';

  @override
  String get signWithGoogle => 'تسجيل الدخول باستخدام جوجل';

  @override
  String get noResultsFound => 'لا يوجد نتائج';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get removeFromFavorites => 'إزالة من المفضلة';

  @override
  String get share => 'مشاركة';

  @override
  String get unknown => 'غير معروف';

  @override
  String get guestStars => 'ضيوف';

  @override
  String get lastEpisode => 'اخر حلقة';

  @override
  String get nextEpisode => 'الحلقة القادمة';

  @override
  String get firstAirDate => 'اول حلقة';

  @override
  String get lastAirDate => 'اخر حلقة';

  @override
  String get totalTime => 'الوقت الاجمالي';

  @override
  String get noHistoryFound => 'لا يوجد سجل';

  @override
  String get noActors => 'لا يوجد ممثلين';

  @override
  String get noEpisodes => 'لا يوجد حلقات';

  @override
  String get noSeasons => 'لا يوجد مواسم';

  @override
  String get episode => 'الحلقة';

  @override
  String get pushNotifications => 'تفعيل الاشعارات';

  @override
  String get getStarted => 'ابدأ';

  @override
  String get startExplore => 'ابدأ الاستكشاف';

  @override
  String get continueButton => 'التالي';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get areYouSureYouWantToDelete =>
      'هل انت متأكد من رغبتك في حذف الحساب؟';

  @override
  String get thisActionCannotBeUndone => 'هذا الإجراء لا يمكن التراجع عنه';

  @override
  String get loginAgainToContinue =>
      'يرجى تسجيل الدخول مرة أخرى لمتابعة العملية';

  @override
  String get cancel => 'إلغاء';

  @override
  String get accountDeleted => 'تم حذف الحساب بنجاح';

  @override
  String get delete => 'حذف';
}
