// lib/core/constants/welcome_assets.dart

/// Welcome screen background posters
/// Mix of iconic movies and popular series across different genres and eras
class WelcomeAssets {
  static const String imageBase = 'https://image.tmdb.org/t/p/w300';
  // ========================================
  // COLUMN 1: Mix of Classic & Modern Movies + Series
  // ========================================
  static const List<String> column1Posters = [
    // Movies
    '$imageBase/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg', // Interstellar (2014) - Sci-Fi
    '$imageBase/h4Ag0p2q4AQggidw9qiYg8M7Vw7.jpg', // Fight Club (1999) - Drama
    '$imageBase/rTc7ZXdroqjkKivFPvCPX0Ru7uw.jpg', //Sopranos (2019) - Crime
    // Series
    '$imageBase/32P0WuBjXrAyCPF3As96RlSuYUW.jpg', // chernobyl - Drama
    // Movies
    '$imageBase/36xXlhEpQqVVPuiZhfoQuaY4OlA.jpg', // Wednesday (2014) - Comedy
    '$imageBase/dmo6TYuuJgaYinXBPjrgG9mB5od.jpg', // The Last of Us (2017) - Sci-Fi
    // Series
    '$imageBase/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg', // Game of Thrones - Post-Apocalyptic
    // Movies
    '$imageBase/1E5baAaEse26fej7uHcjOgEE2t2.jpg', // Joker (2019) - Drama/Thriller
    '$imageBase/ym1dxyOk4jFcSl4Q2zmRrA5BEEN.jpg', // The Prestige (2006) - Mystery
    // Series
    '$imageBase/6kbAMLteGO8yyewYau6bJ683sw7.jpg', //the falcon and the winter soldier - Fantasy
  ];

  // ========================================
  // COLUMN 2: Blockbusters & Popular Series
  // ========================================
  static const List<String> column2Posters = [
    // Movies
    '$imageBase/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg', // Oppenheimer (2023) - Biography
    '$imageBase/3bhkrj58Vtu7enYsRolD1fZdja1.jpg', // The Godfather (1972) - Crime
    // Series
    '$imageBase/4EYPN5mVIhKLfxGruy7Dy41dTVn.jpg', // Stranger Things - Sci-Fi/Horror
    // Movies
    '$imageBase/d5NXSklXo0qyIYkgV94XAgMIckC.jpg', // Dune (2021) - Sci-Fi
    '$imageBase/oU7Oq2kFAAlGqbU4VoAE36g4hoI.jpg', // The Matrix (1999) - Sci-Fi
    // Series
    '$imageBase/kuf6dutpsT0vSVehic3EZIqkOBt.jpg', // Puss in Boots - Mystery
    // Movies
    '$imageBase/qJ2tW6WMUDux911r6m7haRef0WH.jpg', // The Dark Knight (2008) - Action
    // Series
    '$imageBase/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg', // Deadpool - Historical Drama
    // Movies
    '$imageBase/uWpG7GqfKGQqX4YMAo3nv5OrglV.jpg', // the simpsons - Comedy
    // Series
    '$imageBase/wwbHr8MPErMbmiYNaxDgTWyewOX.jpg', // Arcane - Animated/Action
  ];

  // ========================================
  // COLUMN 3: Cult Classics & Modern Hits
  // ========================================
  static const List<String> column3Posters = [
    '$imageBase/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg', // Pulp Fiction (1994) - Crime
    '$imageBase/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg', // Schindler's List (1993) - Drama
    // Series
    '$imageBase/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg', // The Witcher - Fantasy
    // Movies
    '$imageBase/wTnV3PCVW5O92JMrFvvrRcV39RU.jpg', // Gladiator (2000) - Action/Drama
    '$imageBase/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg', // Inception (2010) - Sci-Fi
    // Series
    '$imageBase/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg', // Wednesday - Comedy/Mystery
    // Movies
    '$imageBase/eYzbGcYnOUlvj2fa76pTgIXogd7.jpg', // Goodfellas (1990) - Crime
    // Series
    '$imageBase/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg', // Peaky Blinders - Crime
    // Movies
    '$imageBase/wcaDIAG1QdXQLRaj4vC1EFdBT2.jpg', // The 100 (2014) - Action
    // Series
    '$imageBase/8o8kiBkWFK3gVytHdyzEWUBXVfK.jpg', // Family Guy - Comedy
  ];

  // ========================================
  // HELPER METHODS
  // ========================================

  /// Get all posters as a single list (for cubit if needed)
  static List<String> getAllPosters() => [
    ...column1Posters,
    ...column2Posters,
    ...column3Posters,
  ];

  /// Get posters for a specific column
  static List<String> getColumnPosters(int columnIndex) {
    switch (columnIndex) {
      case 0:
        return column1Posters;
      case 1:
        return column2Posters;
      case 2:
        return column3Posters;
      default:
        return column1Posters;
    }
  }

  /// Get first N posters from each column (for your current implementation)
  static List<String> getPostersForWelcomeScreen({int postersPerColumn = 4}) =>
      [
        ...column1Posters.take(postersPerColumn),
        ...column2Posters.take(postersPerColumn),
        ...column3Posters.take(postersPerColumn),
      ];

  // ========================================
  // METADATA (Optional - for reference)
  // ========================================

  /// Poster distribution stats
  static const int totalPosters = 30;
  static const int postersPerColumn = 10;
  static const int movieCount = 20; // Approximately 66%
  static const int seriesCount = 10; // Approximately 33%
}
