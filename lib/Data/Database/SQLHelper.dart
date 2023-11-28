import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase('courses.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
      create table videos (
        id TEXT PRIMARY KEY NOT NULL,
        video_id INTEGER NOT NULL,
        course_id INTEGER NOT NULL,
        module_id INTEGER NOT NULL,
        watched INTEGER NOT NULL DEFAULT 0,
        bookmarks TEXT)
      ''');
  }

  static Future<int> createItem(
      String id, int v_id, c_id, m_id, int isWatched, String bookmarks) async {
    final db = await SQLHelper.db();
    final data = {
      'id': id,
      'video_id': v_id,
      'course_id': c_id,
      'module_id': m_id,
      'watched': isWatched,
      'bookmarks': bookmarks,
    };
    return await db.insert('videos', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future getItem(List values, String where) async {
    final db = await SQLHelper.db();
    return db.query('videos', where: where, whereArgs: values);
  }

  static Future getAllItem() async {
    final db = await SQLHelper.db();
    return db.query(
      'videos',
    );
  }

  static Future update(Map<String, dynamic> data, String id) async {
    final db = await SQLHelper.db();
    return await db.update('videos', data, where: 'id = ?', whereArgs: [id]);
  }

  static Future delete() async {
    final db = await SQLHelper.db();
    return db.delete('videos');
  }

  static Future close() async {
    final db = await SQLHelper.db();
    db.close();
  }
}
