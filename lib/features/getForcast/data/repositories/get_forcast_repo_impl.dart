import '../../../../core/error/exception.dart';
import '../../domain/entities/get_forcast_entity.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_forcast_details.dart';
import '../datasources/get_forcast_local_data_sources.dart';
import '../datasources/get_forcast_remote_data_sources.dart';

class GetForcastRepoImpl implements GetForcastRepo {
  final ForcastLocalDataSources localDataSources;
  final ForcastRemoteDataSources remoteDataSources;
  final NetworkInfo networkInfo;
  GetForcastRepoImpl({
    required this.localDataSources,
    required this.networkInfo,
    required this.remoteDataSources,
  });

  @override
  Future<Either<Failure, CityDetails>> getCityDetailsByCityName(
      String input) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForcast =
            await remoteDataSources.getCityDetailsByCityName(input);
        localDataSources.cacheCityDetails(remoteForcast);
        return Right(remoteForcast);
      } on ServerException {
        throw Left(ServerFailure());
      }
    } else {
      try {
        final localForcast = await localDataSources.getLastCityDetails();
        return Right(localForcast);
      } on CacheException {
        throw Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CityDetails>> getCityDetailsByCurrentLocation() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForcast =
            await remoteDataSources.getCityDetailsByCurrentLocation();
        localDataSources.cacheCityDetails(remoteForcast);
        return Right(remoteForcast);
      } on ServerException {
        throw Left(ServerFailure());
      }
    } else {
      try {
        final localForcast = await localDataSources.getLastCityDetails();
        return Right(localForcast);
      } on CacheException {
        throw Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Forcast>> getForcastByCityName(String input) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForcast =
            await remoteDataSources.getForcastByCityName(input);
        localDataSources.cacheForcast(remoteForcast);
        return Right(remoteForcast);
      } on ServerException {
        throw Left(ServerFailure());
      }
    } else {
      try {
        final localForcast = await localDataSources.getLastForcast();
        return Right(localForcast);
      } on CacheException {
        throw Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Forcast>> getForcastByCurrentLocation() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForcast =
            await remoteDataSources.getForcastByCurrentLocation();
        localDataSources.cacheForcast(remoteForcast);
        return Right(remoteForcast);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localForcast = await localDataSources.getLastForcast();

        return Right(localForcast);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
