import '../../../../core/error/exception.dart';
import '../../domain/entities/forcast_database_entity.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/forcast_database_repo.dart';
import '../datasources/forcast_database_local_data_source.dart';

class ForcastDatabaseRepoImpl implements ForcastDatabaseRepo {
  final ForcastdatabaseLocalDataSource _localDataSource;
  const ForcastDatabaseRepoImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> addCitytoDatabase(DatebaseInput input) async {
    try {
      final localWeather = await _localDataSource.addCitytoDatabase(input);
      return Right(localWeather);
    } on CacheException {
      throw Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCityFromDatabase(String cityName) async {
    try {
      final localWeather =
          await _localDataSource.deleteCityFromDatabase(cityName);
      return Right(localWeather);
    } on CacheException {
      throw Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<ForcastDatabaseEntity>>>
      getAllStoredWeather() async {
    try {
      final localWeather = await _localDataSource.getAllStoredWeather();
      return Right(localWeather);
    } on CacheException {
      throw Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> updateCityInDatabase(DatebaseInput input) async {
    try {
      final localWeather = await _localDataSource.uppateCityInDatabase(input);
      return Right(localWeather);
    } on CacheException {
      throw Left(CacheFailure());
    }
  }
}
