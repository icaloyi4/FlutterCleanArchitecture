import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/bloc_dependency_injection/core/database/movies_dao.dart';
import 'package:movieapp/bloc_dependency_injection/feature/home_page/domain/models/db/movies_entity.dart';

part 'database_module.g.dart';

@UseMoor(tables: [Movies], daos: [MoviesDao])
class DatabaseModule extends _$DatabaseModule {
  DatabaseModule()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
