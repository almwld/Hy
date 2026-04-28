import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

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
  
  void dispose() {
    _db?.close();
  }
}
