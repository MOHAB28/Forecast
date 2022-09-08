import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/forcast_database_repo.dart';
import 'add_city_to_database.dart';

class UpdateCityIndatabaseUsecase
    extends UseCase<void, AddCityTodatabaseUsecaseInput> {
  final ForcastDatabaseRepo _repo;
  UpdateCityIndatabaseUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(
      AddCityTodatabaseUsecaseInput input) async {
    return await _repo.updateCityInDatabase(
      DatebaseInput(
        cityName: input.cityName,
        icon: input.icon,
        description: input.description,
        temp: input.temp,
      ),
    );
  }
}