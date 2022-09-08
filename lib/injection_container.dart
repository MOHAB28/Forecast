import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/dio_factory.dart';
import 'core/network/network_info.dart';
import 'core/services/database.dart';
import 'features/forcastDatabase/data/datasources/forcast_database_local_data_source.dart';
import 'features/forcastDatabase/data/repositories/forcast_database_repo_impl.dart';
import 'features/forcastDatabase/domain/repositories/forcast_database_repo.dart';
import 'features/forcastDatabase/domain/usecases/add_city_to_database.dart';
import 'features/forcastDatabase/domain/usecases/delete_city_from_database.dart';
import 'features/forcastDatabase/domain/usecases/get_all_stored_weather.dart';
import 'features/forcastDatabase/domain/usecases/update_city_info.dart';
import 'features/forcastDatabase/presentation/cubit/forcastdatabase_cubit.dart';
import 'features/getForcast/data/datasources/get_forcast_local_data_sources.dart';
import 'features/getForcast/data/datasources/get_forcast_remote_data_sources.dart';
import 'features/getForcast/data/repositories/get_forcast_repo_impl.dart';
import 'features/getForcast/domain/repositories/get_forcast_details.dart';
import 'features/getForcast/domain/usecases/get_city_details_by_cn.dart';
import 'features/getForcast/domain/usecases/get_city_details_by_curr_loc.dart';
import 'features/getForcast/domain/usecases/get_forcast_by_cn.dart';
import 'features/getForcast/domain/usecases/get_forcast_by_curr_loca.dart';
import 'features/getForcast/presentation/cubit/getforcast_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await DioHelper.init();
  //! Features - NumberTrivia

  sl.registerFactory(
    () => GetForcastCubit(
      getCityDetailsByCityNameUsecase: sl(),
      getCityDetailsByCurrentLocationUsecase: sl(),
      getForcastByCityNameUsecase: sl(),
      getForcastByCurrentLocationUsecase: sl(),
    ),
  );

  sl.registerFactory(
    () => ForcastDatabaseCubit(
      addCityTodatabaseUsecase: sl(),
      deleteCityFromdatabaseUsecase: sl(),
      getAllStoredWeatherUsecase: sl(),
      updateCityIndatabaseUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCityDetailsByCityName(sl()));
  sl.registerLazySingleton(() => GetCityDetailsByCurrentLocation(sl()));
  sl.registerLazySingleton(() => GetForcastByCityName(sl()));
  sl.registerLazySingleton(() => GetForcastByCurrentLocation(sl()));

  sl.registerLazySingleton(() => AddCityTodatabaseUsecase(sl()));
  sl.registerLazySingleton(() => DeleteCityFromdatabaseUsecase(sl()));
  sl.registerLazySingleton(() => GetAllStoredWeatherUsecase(sl()));
  sl.registerLazySingleton(() => UpdateCityIndatabaseUsecase(sl()));
  // Repository
  sl.registerLazySingleton<GetForcastRepo>(
    () => GetForcastRepoImpl(
      localDataSources: sl(),
      remoteDataSources: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<ForcastDatabaseRepo>(
    () => ForcastDatabaseRepoImpl(
     sl()
    ),
  );
  // Data sources

  sl.registerLazySingleton<ForcastRemoteDataSources>(
    () => ForcastRemoteDataSourcesImpl(
      geolocator: sl(),
    ),
  );

  sl.registerLazySingleton<ForcastLocalDataSources>(
    () => ForcastLocalDataSourcesImpl(
      sl(),
    ),
  );

  DbHelper dbHelper = DbHelper();
  await dbHelper.createDatabase();
  sl.registerLazySingleton<ForcastdatabaseLocalDataSource>(
    () => ForcastdatabaseLocalDataSourceImpl(
      dbHelper,
    ),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  final geolocatorPlatform = GeolocatorPlatform.instance;
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => geolocatorPlatform);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
