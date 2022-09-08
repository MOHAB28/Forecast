import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/forcast_database_repo.dart';

class AddCityTodatabaseUsecase
    extends UseCase<void, AddCityTodatabaseUsecaseInput> {
  final ForcastDatabaseRepo _repo;
  AddCityTodatabaseUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(
      AddCityTodatabaseUsecaseInput input) async {
    return await _repo.addCitytoDatabase(
      DatebaseInput(
        cityName: input.cityName,
        icon: input.icon,
        description: input.description,
        temp: input.temp,
      ),
    );
  }
}

class AddCityTodatabaseUsecaseInput {
  final String cityName;
  final String icon;
  final int temp;
   final String description;
  const AddCityTodatabaseUsecaseInput({
    required this.cityName,
    required this.icon,
    required this.description,
    required this.temp,
  });
}
