import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //Singleton DatabseHelper
  static Database _database; //Singleton Databse
  String noteTable = 'note_table';
  String colId = 'id';
  String colMinister = 'minister';
  String colTopic = 'topic';
  String colScripture = 'scripture';
  String colMessage = 'message';
  String colPriority = 'priority';
  String colDate = 'date';
  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var noteDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return noteDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colMinister TEXT,,$colTopic TEXT,$colScripture TEXT,$colMessage TEXT,$colPriority INTEGER,$colDate TEXT,)');
  }

//GetAllNotes
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    // var result =
    //     await db.rawQuery('SELECT*FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

//Insert Notes
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

//Update Notes
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(
      noteTable,
      note.toMap(),
      where: '$colId = ?',
      whereArgs: [note.id],
    );
    return result;
  }

//Delete Notes
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    var result = await db.delete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Count Notes
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
