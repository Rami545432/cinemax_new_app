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
  String get popular => 'Popular';

  @override
  String get nowPlaying => 'En cartelera';

  @override
  String get topRated => 'Mejor valoradas';

  @override
  String get upcoming => 'Próximamente';

  @override
  String get trending => 'Tendencias';

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
}
