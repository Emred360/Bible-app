import 'dart:developer';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:testing_run/models/sqlflite_messageDB.dart';

class DatabaseHelperM {
  static DatabaseHelperM _databaseMHelperM; //Singleton DatabseHelper
  static Database _databaseM; //Singleton Databse
  String messageTable = 'message_table';
  String colIdM = 'idM';
  String colMinisterM = 'ministerM';
  String colTopicM = 'topicM';
  String colScriptureM = 'scriptureM';
  String colMessageM = 'messageM';
  String colPriorityM = 'priorityM';
  String colDateM = 'dateM';
  DatabaseHelperM._createInstance(); // Named constructor to create instance of DatabaseHelperM
  factory DatabaseHelperM() {
    if (_databaseMHelperM == null) {
      _databaseMHelperM = DatabaseHelperM._createInstance();
    }
    return _databaseMHelperM;
  }
  Future<Database> get databaseM async {
    if (_databaseM == null) {
      _databaseM = await initializeDatabase();
    }
    return _databaseM;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'messages.dbM';
    var messageDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return messageDatabase;
  }

  void _createDb(Database dbM, int newVersionM) async {
    await dbM.execute(
        'CREATE TABLE $messageTable($colIdM INTEGER PRIMARY KEY AUTOINCREMENT,$colMinisterM TEXT,$colTopicM TEXT,$colScriptureM TEXT,$colMessageM TEXT,$colPriorityM INTEGER,$colDateM TEXT)');
  }

//GetAllMessageMs
  Future<List<Map<String, dynamic>>> getMessageMapList() async {
    print(
        "ALLLLLLLLLLLLLLLLLLLLL MEEEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSSSSSAAAAAAAAAAAAAAAAAAAAAAAEGEEE HERRRRRRRRRRREEEEEEEEEEEE");
    Database dbM = await this.databaseM;
    // var resultM =
    //     await dbM.rawQuery('SELECT*FROM $messageTable order by $colPriority ASC');
    var resultM = await dbM.query(messageTable, orderBy: '$colPriorityM ASC');
    return resultM;
  }

//Insert MessageMs
  Future<int> insertMessageM(MessageM message) async {
    Database dbM = await this.databaseM;
    var resultM = await dbM.insert(messageTable, message.toMap());
    return resultM;
  }

//Update MessageMs
  Future<int> updateMessageM(MessageM message) async {
    var dbM = await this.databaseM;
    var resultM = await dbM.update(
      messageTable,
      message.toMap(),
      where: '$colIdM = ?',
      whereArgs: [message.idM],
    );
    return resultM;
  }

//Delete Notes
  Future<int> deleteMessageM(int idM) async {
    var dbM = await this.databaseM;
    var resultM = await dbM.delete(messageTable, where: "$colIdM = $idM");
    return resultM;
  }

  // Count MessageMs
  Future<int> getCount() async {
    Database dbM = await this.databaseM;
    List<Map<String, dynamic>> x =
        await dbM.rawQuery('SELECT COUNT (*) from $messageTable');
    int resultM = Sqflite.firstIntValue(x);
    return resultM;
  }

//Get The 'MapList'
  Future<List<MessageM>> getMessageList() async {
    var messageMapList = await getMessageMapList();
    int count = messageMapList.length;
    List<MessageM> messageList = [];
    for (int i = 0; i < count; i++) {
      messageList.add(MessageM.fromMapObject(messageMapList[i]));
    }
    return messageList;
  }
}
