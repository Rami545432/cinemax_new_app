// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String welcomeUser(String username) {
    return 'Hoş geldin, $username !';
  }

  @override
  String get authLogin => 'Giriş Yap';

  @override
  String get authRegister => 'Kayıt Ol';

  @override
  String get authEmail => 'E-posta';

  @override
  String get authPassword => 'Şifre';

  @override
  String get authForgotPassword => 'Şifreni mi unuttun?';

  @override
  String get authResetPassword => 'Şifreyi Sıfırla';

  @override
  String get authResetPasswordSuccess => 'Şifre başarıyla sıfırlandı';

  @override
  String get authResetPasswordError => 'Şifre sıfırlama başarısız oldu';

  @override
  String get authSignInWith => 'Veya ile giriş yap';

  @override
  String get authLogout => 'Çıkış Yap';

  @override
  String get popular => 'Popüler';

  @override
  String get nowPlaying => 'Şu Anda Gösterimde';

  @override
  String get topRated => 'En Yüksek Puanlı';

  @override
  String get upcoming => 'Yakında';

  @override
  String get trending => 'Trend';

  @override
  String get search => 'Ara';

  @override
  String get searchHint => 'Film veya dizi ara...';

  @override
  String get searchHistory => 'Arama Geçmişi';

  @override
  String get clearHistory => 'Geçmişi Temizle';

  @override
  String get about => 'Hakkında';

  @override
  String get cast => 'Oyuncular';

  @override
  String get similar => 'Benzer';

  @override
  String get recommended => 'Önerilen';

  @override
  String get reviews => 'Yorumlar';

  @override
  String get seasons => 'Sezonlar';

  @override
  String get episodes => 'Bölümler';

  @override
  String get network => 'Yayıncı';

  @override
  String get productionCompany => 'Yapım Şirketi';

  @override
  String get movieGenres => 'Film Türleri';

  @override
  String get tvGenres => 'Dizi Türleri';

  @override
  String get all => 'Tümü';

  @override
  String get movies => 'Filmler';

  @override
  String get tvShows => 'Diziler';

  @override
  String get originalTitle => 'Orijinal Başlık';

  @override
  String get releaseDate => 'Yayın Tarihi';

  @override
  String get runtime => 'Süre';

  @override
  String get status => 'Durum';

  @override
  String get language => 'Dil';

  @override
  String get budget => 'Bütçe';

  @override
  String get revenue => 'Gelir';

  @override
  String get overview => 'Özet';

  @override
  String get storyLine => 'Konu';

  @override
  String get noDescriptionAvailable => 'Açıklama mevcut değil';

  @override
  String get less => 'Daha Az';

  @override
  String get more => 'Daha Fazla';

  @override
  String get geners => 'Türler';

  @override
  String get countries => 'Ülkeler';

  @override
  String get informations => 'Bilgiler';

  @override
  String get trailers => 'Trailerler';

  @override
  String get profile => 'Profil';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'Açık';

  @override
  String get dark => 'Koyu';

  @override
  String get favorites => 'Favoriler';

  @override
  String get myProfile => 'Benim Profilim';

  @override
  String get noItemsFound => 'No items found';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get noInternetConnection => 'İnternet bağlantısı yok';

  @override
  String nofavorites(String type) {
    return 'Favorilerde $type yok';
  }

  @override
  String startAddingYourFavorite(String type) {
    return 'Favorilere $type eklemeye başla';
  }

  @override
  String get noTrailersAvailable => 'Trailerler mevcut değil';

  @override
  String get noSeasonsAvailable => 'Sezonlar mevcut değil';

  @override
  String get noEpisodesAvailable => 'Bölümler mevcut değil';

  @override
  String get noReviewsAvailable => 'Yorumlar mevcut değil';

  @override
  String get signInHint =>
      'Giriş yapınızın Favori Filmlerinizi ve Dizilerinizi Senkronize Edin ve Daha Fazla Özellik Kullanın';
}
