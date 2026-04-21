// shared/data/cache/in_memory_cache.dart
class InMemoryCache<T> {
  final Duration duration;
  final Map<String, _CacheEntry<T>> _store = {};

  InMemoryCache({required this.duration});

  T? get(String key) {
    final entry = _store[key];
    if (entry == null) {
      return null;
    }
    if (DateTime.now().difference(entry.cachedAt) > duration) {
      _store.remove(key);
      return null;
    }
    return entry.data;
  }

  void set(String key, T value) {
    _store[key] = _CacheEntry(data: value, cachedAt: DateTime.now());
  }

  void remove(String key) => _store.remove(key);
  void clear() => _store.clear();
  void clearExpired() {
    _store.removeWhere(
      (_, e) => DateTime.now().difference(e.cachedAt) > duration,
    );
  }
}

class _CacheEntry<T> {
  final T data;
  final DateTime cachedAt;
  _CacheEntry({required this.data, required this.cachedAt});
}
