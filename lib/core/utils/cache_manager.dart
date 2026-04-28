import 'dart:collection';

class CacheManager<K, V> {
  final int maxSize;
  final LinkedHashMap<K, V> _cache = LinkedHashMap();
  
  CacheManager({this.maxSize = 100});
  
  V? get(K key) {
    if (!_cache.containsKey(key)) return null;
    final value = _cache.remove(key);
    if (value != null) {
      _cache[key] = value;
    }
    return value;
  }
  
  void set(K key, V value) {
    if (_cache.containsKey(key)) {
      _cache.remove(key);
    } else if (_cache.length >= maxSize) {
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = value;
  }
  
  void remove(K key) => _cache.remove(key);
  void clear() => _cache.clear();
  bool contains(K key) => _cache.containsKey(key);
  int get size => _cache.length;
}
