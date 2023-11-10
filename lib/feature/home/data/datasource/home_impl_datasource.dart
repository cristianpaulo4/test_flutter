import 'package:test_flutter/core/db/db.dart';
import 'package:test_flutter/feature/home/domain/datasource/home_datasource.dart';

class HomeImplDatasource implements HomeDatasource {
  HomeImplDatasource({
    required this.db,
  });

  final Db db;

  @override
  Future<bool> add({
    required String key,
    required List<String> tasks,
  }) async {
    return db.setList(key: key, data: tasks);
  }

  @override
  Future<List<String>?> getList({required String key}) async {
    return await db.getList(key: key);
  }
}
