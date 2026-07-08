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
  String get popular => 'POPÜLER';

  @override
  String get nowPlaying => 'ŞU ANDA GÖSTERİMDE';

  @override
  String get topRated => 'EN YÜKSEK PUANLI';

  @override
  String get upcoming => 'YAKINDA';

  @override
  String get trending => 'TREND';

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

  @override
  String get airingToday => 'BUGÜN GÖSTERİMDE';

  @override
  String get discover => 'Keşfet';

  @override
  String get genreAction => 'Eylem';

  @override
  String get genreAdventure => 'Macera';

  @override
  String get genreAnimation => 'Animasyon';

  @override
  String get genreComedy => 'Komedi';

  @override
  String get genreCrime => 'Suç';

  @override
  String get genreDocumentary => 'Belgesel';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Aile';

  @override
  String get genreFantasy => 'Fantasy';

  @override
  String get genreHistory => 'Tarih';

  @override
  String get genreHorror => 'Korku';

  @override
  String get genreMusic => 'Müzik';

  @override
  String get genreMystery => 'Gizem';

  @override
  String get genreRomance => 'Romantik';

  @override
  String get genreSciFi => 'Bilim Kurgu';

  @override
  String get genreTvMovie => 'TV Dizi';

  @override
  String get genreThriller => 'Suspans';

  @override
  String get genreWar => 'War';

  @override
  String get genreWestern => 'Batı';

  @override
  String get genreActionAdventure => 'Eylem ve Macera';

  @override
  String get genreKids => 'Çocuk';

  @override
  String get genreNews => 'Haber';

  @override
  String get genreReality => 'Gerçeklik';

  @override
  String get genreSciFiFantasy => 'Bilim Kurgu ve Fantastik';

  @override
  String get genreSoap => 'Soap Opera';

  @override
  String get genreTalk => 'Konuşma';

  @override
  String get genreWarPolitics => 'Savaş ve Politika';

  @override
  String get parts => 'Bölümler';

  @override
  String get seeAll => 'Tümünü Gör';

  @override
  String get sortBy => 'Sırala';

  @override
  String get sortPopularityDesc => 'En Popüler';

  @override
  String get sortPopularityAsc => 'En Az Popüler';

  @override
  String get sortRatingDesc => 'En Yüksek Puanlı';

  @override
  String get sortRatingAsc => 'En Düşük Puanlı';

  @override
  String get sortReleaseDateDesc => 'En Yeni';

  @override
  String get sortReleaseDateAsc => 'En Eski';

  @override
  String get sortRevenueDesc => 'En Yüksek Gelir';

  @override
  String get sortRevenueAsc => 'En Düşük Gelir';

  @override
  String get sortVoteCountDesc => 'En Çok Oy';

  @override
  String get sortVoteCountAsc => 'En Az Oy';

  @override
  String get sortFirstAirDateDesc => 'En Yeni';

  @override
  String get sortFirstAirDateAsc => 'En Eski';

  @override
  String get sortVoteAverageDesc => 'En Yüksek Puanlı';

  @override
  String get sortVoteAverageAsc => 'En Düşük Puanlı';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get applyFilters => 'Uygula';

  @override
  String get clearFilters => 'Temizle';

  @override
  String get collections => 'Koleksiyonlar';

  @override
  String get cartoons => 'Çizgi Filmler';

  @override
  String get anime => 'Anime';

  @override
  String get maifa => 'Mafya';

  @override
  String get marvel => 'Marvel';

  @override
  String get year => 'Yıl';

  @override
  String get rating => 'Puan';

  @override
  String get min => 'dk';

  @override
  String get cartoonDescreption =>
      'Renkli eğlence, rahat kahkahalar ve saf iyi hisler';

  @override
  String get mafiaDescreption =>
      'Güç, sadakat, ihanet - yeraltı dünyasının hikayeleri.';

  @override
  String get animeDescreption =>
      'Epik dünyalar, derin duygular ve unutulmaz savaşlar.';

  @override
  String get marvelDescreption =>
      'Kahramanlar, kötüler ve çoklu evren çılgınlığı - hepsi tek yerde.';

  @override
  String get logoutSuccessfully => 'Başarıyla çıkış yapıldı';

  @override
  String get backOnline => 'İnternete geri dönüldü';

  @override
  String durationFormat(int hours, int minutes) {
    return '${hours}sa ${minutes}dk';
  }

  @override
  String get duration => 'Süre';

  @override
  String noFavoritesContentType(String type) {
    return 'Favorilerde $type yok';
  }

  @override
  String get statusReleased => 'Yayınlandı';

  @override
  String get statusEnded => 'Bitti';

  @override
  String get statusReturningSeries => 'Devam Ediyor';

  @override
  String get statusInProduction => 'Yapım Aşamasında';

  @override
  String get statusCanceled => 'İptal Edildi';

  @override
  String get statusUnknown => 'Bilinmiyor';

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
  String get onboardingTitle1 => 'Bir Sonraki Tutkunu Keşfet';

  @override
  String get onboardingDesc1 =>
      'Trend filmleri ve bağımlılık yapan dizileri saniyeler içinde keşfet.';

  @override
  String get onboardingTitle2 => 'Favorilerini Yakınında Tut';

  @override
  String get onboardingDesc2 =>
      'Sevdiğin film ve dizileri kişisel izleme listene kaydet.';

  @override
  String get onboardingTitle3 => 'Karar Vermeden Önce İzle';

  @override
  String get onboardingDesc3 =>
      'Oynatmadan önce fragmanları, puanları ve yorumları kontrol et.';

  @override
  String get onboardingTitle0 => 'Bir Sonraki Tutkunu Keşfet';

  @override
  String get loginSuccessfully => 'Başarıyla giriş yapıldı';

  @override
  String get loginFailed => 'Giriş başarısız';

  @override
  String get loginTagline => 'Favori listenizi korumak için giriş yapın';

  @override
  String get signWithGoogle => 'Google ile giriş yap';

  @override
  String get noResultsFound => 'Sonuc bulunamadi';

  @override
  String get somethingWentWrong => 'Birseyler ters gitti';

  @override
  String get removeFromFavorites => 'Favorilerden Çıkar';

  @override
  String get share => 'Paylaş';

  @override
  String get unknown => 'Bilinmeyen';

  @override
  String get guestStars => 'Konuk Oyuncular';

  @override
  String get lastEpisode => 'Son Bölüm';

  @override
  String get nextEpisode => 'Sonraki Bölüm';

  @override
  String get firstAirDate => 'İlk Yayın Tarihi';

  @override
  String get lastAirDate => 'Son Yayın Tarihi';

  @override
  String get totalTime => 'Toplam Süre';

  @override
  String get noHistoryFound => 'Hiçbir tarih bulunamadı';

  @override
  String get noActors => 'Hiçbir aktör bulunamadı';

  @override
  String get noEpisodes => 'Hiçbir bölüm bulunamadı';

  @override
  String get noSeasons => 'Hiçbir sezon bulunamadı';

  @override
  String get episode => 'Bölüm';

  @override
  String get pushNotifications => 'Push Bildirimleri';

  @override
  String get getStarted => 'Başla';

  @override
  String get startExplore => 'Keşfetmeye Başla';

  @override
  String get continueButton => 'Devam Et';

  @override
  String get deleteAccount => 'Hesabı Sil';

  @override
  String get areYouSureYouWantToDelete => 'Hesabınızı Silmek istiyorsunuz?';

  @override
  String get thisActionCannotBeUndone =>
      'Sileceksiniz! Tüm favori film ve dizilerinizi kalıcı olarak sileceksiniz.';

  @override
  String get loginAgainToContinue =>
      'İşleme devam etmek için lütfen tekrar giriş yapın';

  @override
  String get cancel => 'İptal';

  @override
  String get accountDeleted => 'Hesap başarıyla silindi';

  @override
  String get delete => 'Sil';

  @override
  String get privacySettings => 'Gizlilik Ayarları';

  @override
  String get byContinue => 'Devam ederek, kabul etmiş olursunuz ';

  @override
  String get terms => 'Şartlar';

  @override
  String get and => 've';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get lightOut => 'Karanlık';

  @override
  String get dim => 'Loş';
}
