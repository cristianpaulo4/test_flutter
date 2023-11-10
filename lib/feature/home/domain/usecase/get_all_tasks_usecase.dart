// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_flutter/feature/home/domain/repository/home_repository.dart';

class GetAllTasksUsecase {
  GetAllTasksUsecase({
    required this.repository,
  });

  final HomeRepository repository;
  Future<List<String>?> call({required String key}) async {
    return repository.getList(key: key);
  }
}
