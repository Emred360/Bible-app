import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:testing_run/models/sqlflite_messageDB.dart';

class DatabaseHelperM {
  static DatabaseHelperM _databaseHelperM; //Singleton DatabseHelper
  static Database _databaseM; //Singleton Databse
  String messaageTable = 'message_table';
  String colIdM = 'idM';

  String colTopicM = 'topicM';
  String colScriptureM = 'scriptureM';
  String colMessageM = 'messageM';
  String colPriorityM = 'priorityM';
  String colDateM = 'dateM';
  DatabaseHelperM._createInstanceM(); // Named constructor to create instance of DatabaseHelper
  factory DatabaseHelperM() {
    if (_databaseHelperM == null) {
      _databaseHelperM = DatabaseHelperM._createInstanceM();
    }
    return _databaseHelperM;
  }
  Future<Database> get databaseM async {
    if (_databaseM == null) {
      _databaseM = await initializeDatabase();
    }
    return _databaseM;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'messaages.db';
    var messageDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return messageDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $messaageTable($colIdM INTEGER PRIMARY KEY AUTOINCREMENT,$colTopicM TEXT,$colScriptureM TEXT,$colMessageM TEXT,$colPriorityM INTEGER,$colDateM TEXT)');
  }

//GetAllMessage
  Future<List<Map<String, dynamic>>> getMessageMapList() async {
    Database db = await this.databaseM;
    // var result =
    //     await db.rawQuery('SELECT*FROM $messaageTable order by $colPriority ASC');
    var result = await db.query(messaageTable, orderBy: '$colPriorityM ASC');
    return result;
  }

//Insert Notes
  Future<int> insertMessage(Message messaage) async {
    Database db = await this.databaseM;
    var result = await db.insert(messaageTable, messaage.toMap());
    return result;
  }

//Update Notes
  Future<int> updateMessage(Message messaage) async {
    var db = await this.databaseM;
    var result = await db.update(
      messaageTable,
      messaage.toMap(),
      where: '$colIdM = ?',
      whereArgs: [messaage.idM],
    );
    return result;
  }

//Delete Notes
  Future<int> deleteMessage(int id) async {
    var db = await this.databaseM;
    var result = await db.delete(messaageTable, where: "$colIdM = $id");
    return result;
  }

  // Count Notes
  Future<int> getCountM() async {
    Database db = await this.databaseM;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $messaageTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

//Get The 'MapList'
  Future<List<Message>> getMessageList() async {
    var messaageMapList = await getMessageMapList();
    int countM = messaageMapList.length;
    List<Message> messaageList = [];
    for (int i = 0; i < countM; i++) {
      messaageList.add(Message.fromMapObject(messaageMapList[i]));
    }
    return messaageList;
  }
}
