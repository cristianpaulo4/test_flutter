import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/core/db/db.dart';

class DbSharedPreferences implements Db {
  @override
  Future<bool> setList({
    required String key,
    required List<String> data,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setStringList(key, data);
  }

  @override
  Future<List<String>?> getList({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key);
  }
}
