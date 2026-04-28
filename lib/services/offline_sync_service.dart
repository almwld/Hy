import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class OfflineSyncService {
  static final OfflineSyncService _instance = OfflineSyncService._internal();
  factory OfflineSyncService() => _instance;
  OfflineSyncService._internal();
  
  Database? _db;
  
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _db = await openDatabase(
      '${dir.path}/offline_queue.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE queue (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            endpoint TEXT,
            data TEXT,
            retry_count INTEGER,
            created_at INTEGER
          )
        ''');
      },
    );
  }
  
  Future<void> addToQueue(String endpoint, Map<String, dynamic> data) async {
    await _db?.insert('queue', {
      'endpoint': endpoint,
      'data': data.toString(),
      'retry_count': 0,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    });
  }
  
  Future<List<Map<String, dynamic>>> getPendingRequests() async {
    return await _db?.query('queue', orderBy: 'created_at ASC') ?? [];
  }
  
  Future<void> removeFromQueue(int id) async {
    await _db?.delete('queue', where: 'id = ?', whereArgs: [id]);
  }
  
  void dispose() {
    _db?.close();
  }
}
