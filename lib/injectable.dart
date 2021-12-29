import 'package:get_it/get_it.dart';

import 'package:eshot_clone/data/repositories/route_repository.dart';
import 'package:eshot_clone/data/sources/local/local_data_source.dart';
import 'package:eshot_clone/data/sources/remote/remote_data_source.dart';
import 'package:eshot_clone/services/eshot_api/eshot_api.dart';

final getIt = GetIt.instance;

void setupInjectable() {
  getIt.registerLazySingleton(() => EshotApi());
  getIt.registerLazySingleton(() => RouteRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => RouteLocalDataSource());
  getIt.registerLazySingleton(() =>
      RouteRepository(remoteDataSource: getIt(), localDataSource: getIt()));
}
