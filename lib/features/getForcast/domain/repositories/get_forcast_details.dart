import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_forcast_entity.dart';

abstract class GetForcastRepo {
  Future<Either<Failure, Forcast>> getForcastByCurrentLocation();
  Future<Either<Failure, Forcast>> getForcastByCityName(String input);
  Future<Either<Failure, CityDetails>> getCityDetailsByCurrentLocation();
  Future<Either<Failure, CityDetails>> getCityDetailsByCityName(String input);
}
