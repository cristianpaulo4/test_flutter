abstract interface class HomeRepository {
  Future<bool> add({
    required String key,
    required List<String> tasks,
  });
  Future<List<String>?> getList({required String key});
}
