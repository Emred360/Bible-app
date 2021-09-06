import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

 static Future<void> saved(hash) async {
    final SharedPreferences prefs = await _prefs;
    hash = (prefs.setString("hash", hash));
  }

  static Future<String> getHash() async{
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('hash') ?? '';
  }
}
