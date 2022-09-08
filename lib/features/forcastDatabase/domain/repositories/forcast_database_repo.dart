import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/forcast_database_entity.dart';

abstract class ForcastDatabaseRepo {
  Future<Either<Failure, List<ForcastDatabaseEntity>>> getAllStoredWeather();
  Future<Either<Failure, void>> updateCityInDatabase(DatebaseInput input);
  Future<Either<Failure, void>> addCitytoDatabase(DatebaseInput input);
  Future<Either<Failure, void>> deleteCityFromDatabase(String cityName);
}

class DatebaseInput {
  final String cityName;
  final String icon;
  final int temp;
  final String description;
  const DatebaseInput({
    required this.cityName,
    required this.icon,
    required this.description,
    required this.temp,
  });
}
