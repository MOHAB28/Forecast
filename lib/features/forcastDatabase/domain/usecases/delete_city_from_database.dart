import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/forcast_database_repo.dart';

class DeleteCityFromdatabaseUsecase extends UseCase<void, String> {
  final ForcastDatabaseRepo _repo;
  DeleteCityFromdatabaseUsecase(this._repo);

  @override
  Future<Either<Failure, void>> call(String input) async {
    return await _repo.deleteCityFromDatabase(input);
  }
}
