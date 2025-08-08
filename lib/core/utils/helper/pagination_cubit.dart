abstract class PaginationCubit {
  Future<void> fetchSeeAllData({
    required String title,
    required String type,
    required int page,
  });
  Future<void> fetchData({int page = 1, dynamic generId, String? type});
}
