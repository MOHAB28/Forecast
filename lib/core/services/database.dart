import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/forcastDatabase/data/models/forcast_database_model.dart';
import '../../features/forcastDatabase/domain/repositories/forcast_database_repo.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;

  DbHelper.internal();
  static Database? _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db!;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'forcast.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int v) async {
        //create tables
         db
            .execute(
              '''CREATE TABLE weather(id INTEGER PRIMARY KEY AUTOINCREMENT,
              icon STRING,
               cityName STRING,
                 description STRING,
                  temp INTEGER)''',
            )
            .then((value) => debugPrint('database created'))
            .catchError((error) {
              debugPrint('database error => ${error.toString()}');
            });
      },
    );
    return _db!;
  }

  Future<void> addCity(DatebaseInput input) async {
    ForcastDatabaseModel model = ForcastDatabaseModel(
      cityName: input.cityName,
      description: input.description,
      temp: input.temp,
      icon: input.icon,
    );
    Database db = await createDatabase();
    await db.insert(
      'weather',
      model.toJson(),
    );
  }

  Future<void> weahterUpdate(DatebaseInput input) async {
    ForcastDatabaseModel model = ForcastDatabaseModel(
      cityName: input.cityName,
      description: input.description,
      temp: input.temp,
      icon: input.icon,
    );
    Database db = await createDatabase();
    await db.update(
      'weather',
      model.toJson(),
      where: 'cityName = ?',
      whereArgs: [input.cityName],
    );
  }

  Future<List<Map<String, dynamic>>> allStoredWeather() async {
    Database db = await createDatabase();
    return await db.rawQuery('SELECT * FROM weather ORDER BY cityName');
  }

  Future<void> delete(String cityName) async {
    Database db = await createDatabase();

    await db.delete(
      'weather',
      where: 'cityName = ?',
      whereArgs: [cityName],
    );
  }
}
