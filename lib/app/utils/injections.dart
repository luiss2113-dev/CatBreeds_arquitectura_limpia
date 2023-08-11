import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/helpers/constants.dart';
import '../data/helpers/database_helper.dart';
import '../data/http/http_app.dart';
import '../data/repositories_implementation/cats_repository_impl.dart';
import '../data/repositories_implementation/connectivity_repository_impl.dart';
import '../data/services/local/local_db.dart';
import '../data/services/remote/catsbreeds_api.dart';
import '../data/services/remote/internet_checker.dart';
import '../domain/repositories/catsbreeds_repository.dart';
import '../domain/repositories/connectivity_repository.dart';

final getSl = GetIt.instance;

Future<void> initInjection() async {
  initRepository();
  initHttp();
  initRepositoryDatasource();
  initExternalLibraries();
  initLocalDatasource();
}

Future<void> initRepository() async {
  getSl.registerLazySingleton<CatsBreedsRepository>(
      () => CatsRepositoryImpl(getSl()));
  getSl.registerLazySingleton<ConnectivityRepository>(
      () => ConnectivityRepositoryImpl(getSl(), getSl()));
}

Future<void> initHttp() async {
  getSl.registerLazySingleton(() => HttpApp(
      client: getSl(), apiKey: Constants.API_KEY, baseUrl: Constants.BASE_URL));
}

Future<void> initRepositoryDatasource() async {
  getSl.registerLazySingleton(() => CatBreedsAPI(getSl()));
}

Future<void> initExternalLibraries() async {
  getSl.registerLazySingleton(() => Client());
  getSl.registerLazySingleton(() => Connectivity());
  getSl.registerLazySingleton(() => InternetChecker());
}

///
/// Inject local datasource
///
Future<void> initLocalDatasource() async {
  getSl.registerLazySingleton(() => CatBreedsLocalDataSource());
  getSl.registerLazySingleton(() => DatabaseHelper());
}
