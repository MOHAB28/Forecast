import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/forcast_database_entity.dart';
import '../repositories/forcast_database_repo.dart';

class GetAllStoredWeatherUsecase extends UseCase<List<ForcastDatabaseEntity>,NoInputs> {
  final ForcastDatabaseRepo _repo;
  GetAllStoredWeatherUsecase(this._repo);

  @override
  Future<Either<Failure, List<ForcastDatabaseEntity>>> call(NoInputs input) async {
    return await _repo.getAllStoredWeather();
  }
}