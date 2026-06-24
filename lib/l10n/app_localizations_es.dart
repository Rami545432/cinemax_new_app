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

  @override
  String get seeAll => 'Ver todo';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get sortPopularityDesc => 'Más popular';

  @override
  String get sortPopularityAsc => 'Menos popular';

  @override
  String get sortRatingDesc => 'Mejor valorado';

  @override
  String get sortRatingAsc => 'Menos valorado';

  @override
  String get sortReleaseDateDesc => 'Más reciente';

  @override
  String get sortReleaseDateAsc => 'Más antiguo';

  @override
  String get sortRevenueDesc => 'Mayor ingreso';

  @override
  String get sortRevenueAsc => 'Menor ingreso';

  @override
  String get sortVoteCountDesc => 'Más votos';

  @override
  String get sortVoteCountAsc => 'Menos votos';

  @override
  String get sortFirstAirDateDesc => 'Más reciente';

  @override
  String get sortFirstAirDateAsc => 'Más antiguo';

  @override
  String get sortVoteAverageDesc => 'Mejor valorado';

  @override
  String get sortVoteAverageAsc => 'Menos valorado';

  @override
  String get home => 'Inicio';

  @override
  String get applyFilters => 'Aplicar';

  @override
  String get clearFilters => 'Limpiar';

  @override
  String get collections => 'Colecciones';

  @override
  String get cartoons => 'Dibujos animados';

  @override
  String get anime => 'Anime';

  @override
  String get maifa => 'Mafia';

  @override
  String get marvel => 'Marvel';

  @override
  String get year => 'Año';

  @override
  String get rating => 'Valoración';

  @override
  String get min => 'min';

  @override
  String get cartoonDescreption =>
      'Diversión colorida, risas acogedoras y vibraciones puras.';

  @override
  String get mafiaDescreption =>
      'Poder, lealtad, traición: historias del inframundo.';

  @override
  String get animeDescreption =>
      'Mundos épicos, emociones profundas y batallas inolvidables.';

  @override
  String get marvelDescreption =>
      'Héroes, villanos y locura multiversal: todo en un solo lugar.';

  @override
  String get logoutSuccessfully => 'Se cerró la sesión correctamente';

  @override
  String get backOnline => 'Conectado a internet';

  @override
  String durationFormat(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String get duration => 'Duración';

  @override
  String noFavoritesContentType(String type) {
    return 'No hay $type en favoritos';
  }

  @override
  String get statusReleased => 'Estrenada';

  @override
  String get statusEnded => 'Finalizada';

  @override
  String get statusReturningSeries => 'En emisión';

  @override
  String get statusInProduction => 'En producción';

  @override
  String get statusCanceled => 'Cancelada';

  @override
  String get statusUnknown => 'Desconocido';

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
  String get onboardingTitle1 => 'Encuentra Tu Próxima Obsesión';

  @override
  String get onboardingDesc1 =>
      'Descubre películas en tendencia y series adictivas en segundos.';

  @override
  String get onboardingTitle2 => 'Mantén Tus Favoritos Cerca';

  @override
  String get onboardingDesc2 =>
      'Guarda las películas y series que amas en tu lista personal.';

  @override
  String get onboardingTitle3 => 'Mira Antes de Decidir';

  @override
  String get onboardingDesc3 =>
      'Consulta tráilers, calificaciones y reseñas antes de darle play.';

  @override
  String get onboardingTitle0 =>
      'Tu próxima obsesión cinematográfica comienza aquí.';

  @override
  String get loginSuccessfully => 'Se cerró la sesión correctamente';

  @override
  String get loginFailed => 'Fallo al iniciar sesión';

  @override
  String get loginTagline =>
      'Inicia sesión para mantener tu lista de favoritos';

  @override
  String get signWithGoogle => 'Inicia sesión con Google';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get removeFromFavorites => 'Eliminar de favoritos';

  @override
  String get share => 'Compartir';

  @override
  String get unknown => 'Desconocido';

  @override
  String get guestStars => 'Estrellas Invitadas';

  @override
  String get lastEpisode => 'Último Episodio';

  @override
  String get nextEpisode => 'Próximo Episodio';

  @override
  String get firstAirDate => 'Fecha de Emisión';

  @override
  String get lastAirDate => 'Fecha de Emisión';

  @override
  String get totalTime => 'Tiempo Total';

  @override
  String get noHistoryFound => 'No hay Historial';

  @override
  String get noActors => 'No hay Actores';

  @override
  String get noEpisodes => 'No hay Episodios';

  @override
  String get noSeasons => 'No hay Temporadas';

  @override
  String get episode => 'Episodio';

  @override
  String get pushNotifications => 'Push Notifications';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get startExplore => 'Explorar';

  @override
  String get continueButton => 'Continuar';
}
