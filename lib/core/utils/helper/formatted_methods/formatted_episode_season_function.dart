String formattedEpisodeSeason(int? episodeNumber, int? seasonNumber) {
  return episodeNumber! > 0 || seasonNumber! > 0
      ? 'S${seasonNumber.toString().padLeft(2, '0')} E${episodeNumber.toString().padLeft(2, '0')}'
      : 'S$seasonNumber E$episodeNumber';
}
