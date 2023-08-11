import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() => instance;

  DatabaseHelper._internal();

  Future<Database> get databaseCf async {
    if (_database != null) return _database!;
    _database = await _openDB(Constants.confiadoradb); //Asignación de db
    return _database!;
  }

  Future<Database> _openDB(String nameDB) async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        nameDB,
      ),
      version: 1,
      onCreate: onCreateDatabase,
    );
  }

  Future onCreateDatabase(Database db, int version) async {
    await _createdMaster(db);
  }

  Future _createdMaster(Database db) async {
    ///credits logged
    await db.execute(''' 
      CREATE TABLE ${Constants.catBreedsTableName} (
        id TEXT PRIMARY KEY,
        name TEXT,
        temperament TEXT,
        origin TEXT,
        description TEXT,
        dog_friendly INTEGER,
        energy_level INTEGER,
        intelligence INTEGER,
        social_needs INTEGER,
        wikipedia_url TEXT,
        reference_image_id TEXT
      )
     ''');
  }

  Future<int> create(String tableName, Map<String, dynamic> entity) async {
    final db = await instance.databaseCf;
    return await db.transaction((trasaction) async {
      final bath = trasaction.batch();
      int dbResult = 0;

      bath.insert(tableName, entity,
          conflictAlgorithm: ConflictAlgorithm.replace);

      await bath.commit(continueOnError: false).then((value) {
        if (value.isNotEmpty) dbResult = int.parse(value.first.toString());
      });

      return dbResult;
    });
  }

  Future<int> delete(String tableName, {String? where, List? whereArg}) async {
    final db = await instance.databaseCf;
    return await db.transaction((trasaction) async {
      final bath = trasaction.batch();
      int dbResult = 0;

      bath.delete(tableName, where: where, whereArgs: whereArg);

      await bath.commit(continueOnError: false).then((value) {
        if (value.isNotEmpty) dbResult = int.parse(value.first.toString());
      });

      return dbResult;
    });
  }

  Future<int> update(String tableName, Map<String, dynamic> entity,
      {String? where, List? whereArg}) async {
    final db = await instance.databaseCf;
    return await db.transaction((trasaction) async {
      final bath = trasaction.batch();
      int dbResult = 0;

      bath.update(tableName, entity, where: where, whereArgs: whereArg);

      await bath.commit(continueOnError: false).then((value) {
        if (value.isNotEmpty) dbResult = int.parse(value.first.toString());
      });

      return dbResult;
    });
  }

  Future<List<Map<String, dynamic>>> getEntities(String tableName) async {
    final db = await instance.databaseCf;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> searchCats(String matcher) async {
    final db = await instance.databaseCf;
    return await db.rawQuery('''
      SELECT * FROM ${Constants.catBreedsTableName} WHERE name LIKE '%$matcher%'
    ''');
  }
}
