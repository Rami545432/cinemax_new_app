// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String welcomeUser(String username) {
    return '¡Bienvenido, $username !';
  }

  @override
  String get authLogin => 'Iniciar sesión';

  @override
  String get authRegister => 'Crear cuenta';

  @override
  String get authEmail => 'Correo electrónico';

  @override
  String get authPassword => 'Contraseña';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authResetPassword => 'Restablecer contraseña';

  @override
  String get authResetPasswordSuccess =>
      'La contraseña se ha restablecido correctamente';

  @override
  String get authResetPasswordError => 'Error al restablecer la contraseña';

  @override
  String get authSignInWith => 'O iniciar sesión con';

  @override
  String get authLogout => 'Cerrar sesión';

  @override
  String get popular => 'POPULAR';

  @override
  String get nowPlaying => 'EN CARTELERA';

  @override
  String get topRated => 'MEJOR VALORADAS';

  @override
  String get upcoming => 'PRÓXIMAMENTE';

  @override
  String get trending => 'TEDENCIAS';

  @override
  String get search => 'Buscar';

  @override
  String get searchHint => 'Busca una película o serie...';

  @override
  String get searchHistory => 'Historial de búsqueda';

  @override
  String get clearHistory => 'Borrar historial';

  @override
  String get about => 'Acerca de';

  @override
  String get cast => 'Reparto';

  @override
  String get similar => 'Similar';

  @override
  String get recommended => 'Recomendado';

  @override
  String get reviews => 'Reseñas';

  @override
  String get seasons => 'Temporadas';

  @override
  String get episodes => 'Episodios';

  @override
  String get network => 'Cadena';

  @override
  String get productionCompany => 'Productora';

  @override
  String get movieGenres => 'Géneros de películas';

  @override
  String get tvGenres => 'Géneros de series';

  @override
  String get all => 'Todo';

  @override
  String get movies => 'Películas';

  @override
  String get tvShows => 'Series';

  @override
  String get originalTitle => 'Título original';

  @override
  String get releaseDate => 'Fecha de estreno';

  @override
  String get runtime => 'Duración';

  @override
  String get status => 'Estado';

  @override
  String get language => 'Idioma';

  @override
  String get budget => 'Presupuesto';

  @override
  String get revenue => 'Ingresos';

  @override
  String get overview => 'Descripción';

  @override
  String get storyLine => 'Historia';

  @override
  String get noDescriptionAvailable => 'No hay descripción disponible';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Más';

  @override
  String get geners => 'Géneros';

  @override
  String get countries => 'Países';

  @override
  String get informations => 'Información';

  @override
  String get trailers => 'Trailers';

  @override
  String get profile => 'Perfil';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get favorites => 'Favoritos';

  @override
  String get myProfile => 'Mi perfil';

  @override
  String get noItemsFound => 'No hay elementos disponibles';

  @override
  String get retry => 'Reintentar';

  @override
  String get noInternetConnection => 'No hay conexión a internet';

  @override
  String nofavorites(String type) {
    return 'No hay $type en favoritos';
  }

  @override
  String startAddingYourFavorite(String type) {
    return 'Comienza a agregar tu $type favorita';
  }

  @override
  String get noTrailersAvailable => 'No hay trailers disponibles';

  @override
  String get noSeasonsAvailable => 'No hay temporadas disponibles';

  @override
  String get noEpisodesAvailable => 'No hay episodios disponibles';

  @override
  String get noReviewsAvailable => 'No hay reseñas disponibles';

  @override
  String get signInHint =>
      'Inicia sesión para sincronizar tus películas y series favoritas y usar más características';

  @override
  String get airingToday => 'EN EMISIÓN HOY';

  @override
  String get discover => 'Descubrir';

  @override
  String get genreAction => 'Acción';

  @override
  String get genreAdventure => 'Aventura';

  @override
  String get genreAnimation => 'Animación';

  @override
  String get genreComedy => 'Comedia';

  @override
  String get genreCrime => 'Crimen';

  @override
  String get genreDocumentary => 'Documental';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Familiar';

  @override
  String get genreFantasy => 'Fantasía';

  @override
  String get genreHistory => 'Historia';

  @override
  String get genreHorror => 'Horroría';

  @override
  String get genreMusic => 'Música';

  @override
  String get genreMystery => 'Misterio';

  @override
  String get genreRomance => 'Romántico';

  @override
  String get genreSciFi => 'Ciencia Ficción';

  @override
  String get genreTvMovie => 'Película de TV';

  @override
  String get genreThriller => 'Suspense';

  @override
  String get genreWar => 'Guerra';

  @override
  String get genreWestern => 'Western';

  @override
  String get genreActionAdventure => 'Acción y Aventura';

  @override
  String get genreKids => 'Niños';

  @override
  String get genreNews => 'Noticias';

  @override
  String get genreReality => 'Realidad';

  @override
  String get genreSciFiFantasy => 'Ciencia Ficción y Fantasía';

  @override
  String get genreSoap => 'Soap Opera';

  @override
  String get genreTalk => 'Conversación';

  @override
  String get genreWarPolitics => 'Guerra y Política';

  @override
  String get parts => 'Partes';
}
