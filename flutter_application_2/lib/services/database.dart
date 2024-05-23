import 'dart:ffi';

import 'package:flutter_application_2/models/index.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static Database? db;

  /// first time intialization
  static Future<Database> initializeDataBase() async {
    /// get the path of database

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'weather.db');

    //// open the data base and create enteries into database
    Database database =
        await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Weather (id INTEGER PRIMARY KEY,  currentTemp INTEGER, maxTemp REAL,minTemp REAL,windSpeed REAL,Humidity REAL)');
    });
    return database;
  }

  static Future insert(Models models, Forecast forecast) async {
    db = await initializeDataBase();
    int recordid = await db!.insert('Weather', {
      'currentTemp': models.temp_c,
      'maxTemp': forecast.maxtemp_c,
      'minTemp': forecast.mintemp_c,
      'windSpeed': models.wind_kph,
      'Humidity': models.humidity
    });
  }

  static Future<List<Map>> getWeatherData() async {
    db = await initializeDataBase();
    List<Map> maps = await db!
        .query('Weather', columns: ['currentTemp', 'maxTemp', 'minTemp', 'windSpeed', 'Humidity']);
    print(maps);

    return maps;
  }

  static Future clearUserTable() async {
    db = await initializeDataBase();
    return await db!.rawDelete("DELETE FROM Weather");
  }
}

class WeatherData {
  num currentTemp;
  num maxTemp;
  num minTemp;
  num windSpeed;
  num humidity;

  WeatherData(
      {required this.currentTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.windSpeed,
      required this.humidity});
}
