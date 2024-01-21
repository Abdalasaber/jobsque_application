import 'package:shared_preferences/shared_preferences.dart';
import 'package:jobsque/enums.dart';

class CashHelper{

  static SharedPreferences? preferences;

 static Future<void> init() async{
    preferences= await SharedPreferences.getInstance();
  }

  static putString({required MyKeyCache key, required dynamic value}) async{
   await preferences?.setString(key.name, value);
  }
  static putDouble({required MyKeyCache key, required double value}) async{
    await preferences?.setDouble(key.name, value);
  }
  static putBool({required MyKeyCache key, required bool value}) async{
    await preferences?.setBool(key.name, value);
  }


  static getString({required MyKeyCache key}) {
     return preferences?.getString(key.name)?? "";
  }
  static getDouble({required MyKeyCache key}) {
    return preferences?.getDouble(key.name)?? 0.0;
  }
  static getBoolean({required MyKeyCache key}) {
    return preferences?.getBool(key.name)?? false;
  }

  static Future<void> removeCacheKey({required MyKeyCache key}) async{
    await preferences?.remove(key.name);
  }
  static Future<void> clearCache() async{
    await preferences?.clear();
  }
}