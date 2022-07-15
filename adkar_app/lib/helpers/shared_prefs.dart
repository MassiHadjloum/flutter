import 'package:adkar_app/constants/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class SavePreferences {
  static SharedPreferences? _preferences; // = SharedPreferences.getInstance();

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setNightMode(bool nightMode) async {
    await _preferences!.setBool("night", nightMode);
  }

  static bool getNightMode() {
    return _preferences!.getBool("night") ?? false;
  }

  static Future setPrefsBool(bool value, String key) async {
    await _preferences!.setBool(key, value);
  }
  static Future setPrefsString(String value, String key) async {
    await _preferences!.setString(key, value);
  }
  static String getPrefsString(String key) {
    return _preferences!.getString(key) ?? "";
  }
  static bool getPrefsBool(String key) {
    return _preferences!.getBool(key) ?? false;
  }


  static Future setRefsParam(Map<String, Object> values) async {
    await _preferences!.setStringList(
      "refs",
      fromMap(values),
    );
  }

  static dynamic getRefsParamAsList() {
    return _preferences!.getStringList("refs") ?? fromMap(Data.defaultParams);
  }

  static Map<String, Object> getRefsParamAsMap() {
    return fromListToMap(_preferences!.getStringList("refs")) ??
        Data.defaultParams;
  }

  static List<String> fromMap(Map<String, Object> map) {
    return map.values.map((e) => e.toString()).toList();
  }

  static Map<String, Object>? fromListToMap(List<String>? list) {
    Map<String, Object> map = {
      "nightmode": '',
      "size": '',
      "color": '',
      "scrollDirection": '',
      "menuType": '',
      "backgroundColor": ''
    };
    final listkeys = map.keys.toList();
    list!.forEachIndexed((index, element) {
      map.update(listkeys[index], (value) => value = element);
    });
    return map;
  }
}
