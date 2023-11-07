import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static get(String key) {
    return prefs.getString(key);
  }

  static set(String key, String value) {
    return prefs.setString(key, value);
  }
}
