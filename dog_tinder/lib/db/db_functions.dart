import 'package:dog_tinder/db/db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBFunctions {
  static const int _version = 1;
  static const String _dbName = "Dogs.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE Dog(id INTEGER PRIMARY KEY, dogName TEXT NOT NULL, dogBreed TEXT NOT NULL, dogAge INTEGER NOT NULL, dogBio TEXT NOT NULL);"),
        version: _version);
  }

  static Future<int> addDog(DBModel dog) async {
    final db = await _getDB();
    return await db.insert("Dog", dog.toDB(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateDog(DBModel dog) async {
    final db = await _getDB();
    return await db.update("Dog", dog.toDB(),
        where: 'id = ?',
        whereArgs: [dog.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteDog(DBModel dog) async {
    final db = await _getDB();
    return await db.delete(
      "Dog",
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  static Future<List<DBModel>?> getDogs() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Dog");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => DBModel.fromDB(maps[index]));
  }
}
