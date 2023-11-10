import 'package:test_flutter/core/db/impl/db_shared_preferences.dart';
import 'package:test_flutter/feature/home/data/datasource/home_impl_datasource.dart';
import 'package:test_flutter/feature/home/data/repository/home_impl_repository.dart';
import 'package:test_flutter/feature/home/domain/repository/home_repository.dart';

class HomeFactory {
  static HomeRepository get repository => HomeImplRepository(
        datasource: HomeImplDatasource(
          db: DbSharedPreferences(),
        ),
      );
}
