import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;
  CacheManager._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> cacheData(String key, dynamic data, {Duration? expiry}) async {
    final cacheEntry = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'expiry': expiry?.inMilliseconds,
    };
    await _prefs?.setString(key, jsonEncode(cacheEntry));
  }

  dynamic getCachedData(String key) {
    final cached = _prefs?.getString(key);
    if (cached == null) return null;

    final cacheEntry = jsonDecode(cached);
    final expiry = cacheEntry['expiry'];

    if (expiry != null) {
      final timestamp = cacheEntry['timestamp'];
      final now = DateTime.now().millisecondsSinceEpoch;
      if (now - timestamp > expiry) {
        _prefs?.remove(key);
        return null;
      }
    }

    return cacheEntry['data'];
  }

  Future<void> clearCache() async {
    await _prefs?.clear();
  }
}
