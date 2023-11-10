abstract interface class Db {
  Future<bool> setList({required String key, required List<String> data});
  Future<List<String>?> getList({required String key});
}
