import 'package:test_flutter/feature/home/domain/repository/home_repository.dart';

class AddTaskUsecase {
  final HomeRepository repository;
  AddTaskUsecase({
    required this.repository,
  });

  Future<bool> call({
    required String key,
    required List<String> tasks,
  }) async {
    return await repository.add(key: key, tasks: tasks);
  }
}
