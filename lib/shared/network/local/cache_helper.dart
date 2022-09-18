import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {

  static SharedPreferences? sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool?> setBool({required key, required value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static getBool({required key}){
    return sharedPreferences?.getBool(key);
  }
}
