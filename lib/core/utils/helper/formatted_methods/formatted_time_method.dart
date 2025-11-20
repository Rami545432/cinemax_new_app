String formmatTime(int minutes) {
  final hours = minutes ~/ 60;
  final remaingTime = minutes % 60;
  if (hours > 0) {
    return '$hours h $remaingTime m';
  } else {
    return '$remaingTime m';
  }
}
