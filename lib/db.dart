import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:testing_run/test_pages.dart';

class LocalStorage {
  static final Box _db = Hive.box("user_data");

  static String hasTopic = "hasTopic";
  static String hasText = "userText";
  static String hasMessage = "hasMessage";
  static String hasScriptures = "hasScripture";
  static String theMessages = "allMessages";
  static String refreshToken = "refreshToken";
  static String userLoanData = "userLoanData";
  static String tokenCreationTime = "createdAt";
  static String mobileNumber = "mobileNumber";
  static String nok = "nextOfKin";
  static String address = "contact";
  static String profileInfo = "profileInfo";
  static String statusWithEmployment = "statusAndEmploy";
  static String idVerification = "idVerification";

  // static bool get isFirstTimeUser {
  //   final db = Hive.box("app_data");
  //   final topicData = db.get(hasTopic, defaultValue: true);
  //   final textData = db.get(hasText, defaultValue: true);
  //   final messageData = db.get(hasMessage, defaultValue: true);
  //   final scripturesdata = db.get(hasScriptures, defaultValue: true);

  //   return data == true;
  // }

  // static void markAsExistingUser() {
  //   final db = Hive.box("app_data");
  //   db.put(firstTimeUser, false);
  // }

  static FutureOr<bool> removeItem(String key) async {
    try {
      await _db.delete(key);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<dynamic> getItem(String key, {dynamic defaultValue}) {
    try {
      final value = _db.get(key, defaultValue: defaultValue);
      return value;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<bool> setItem(
      {@required String key, @required dynamic value}) async {
    try {
      await _db.put(key, value);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<bool> setItems(Map<String, dynamic> data) async {
    try {
      await _db.putAll(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static FutureOr<bool> removeItems(List<String> keys) async {
    try {
      await _db.deleteAll(keys);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // static ValueListenable<Box> get userDataListener {
  //   return _db.listenable(keys: [theMessages]);
  // }

  // static ValueListenable<Box> get profileDataListener {
  //   return _db.listenable(keys: [profileInfo]);
  // }
}
