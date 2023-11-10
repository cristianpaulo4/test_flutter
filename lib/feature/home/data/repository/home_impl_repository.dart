import 'package:test_flutter/feature/home/domain/datasource/home_datasource.dart';
import 'package:test_flutter/feature/home/domain/repository/home_repository.dart';

class HomeImplRepository implements HomeRepository {
  HomeImplRepository({
    required this.datasource,
  });

  final HomeDatasource datasource;

  @override
  Future<bool> add({
    required String key,
    required List<String> tasks,
  }) async {
    return await datasource.add(key: key, tasks: tasks);
  }

  @override
  Future<List<String>?> getList({required String key}) async {
    return await datasource.getList(key: key);
  }
}
