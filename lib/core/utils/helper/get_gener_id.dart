dynamic getGenreId(String genre) {
  switch (genre) {
    case "All":
      return '';
    case "Action":
      return 28;
    case "Adventure":
      return 12;
    case "Animation":
      return 16;
    case "Comedy":
      return 35;
    case "Crime":
      return 80;
    case "Documentary":
      return 99;
    case "Drama":
      return 18;
    case "Family":
      return 10751;
    case "Fantasy":
      return 14;
    case "History":
      return 36;
    case "Horror":
      return 27;
    case "Music":
      return 10402;
    case "Mystery":
      return 9648;
    case "Romance":
      return 10749;
    case "Science Fiction":
      return 878;
    case "TV Movie":
      return 10770;
    case "Thriller":
      return 53;
    case "War":
      return 10752;
    case "Western":
      return 37;
    default:
      return -1; // Unknown Genre
  }
}
