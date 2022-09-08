import 'package:dartz/dartz.dart';
import '../repositories/get_forcast_details.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_forcast_entity.dart';

class GetCityDetailsByCurrentLocation extends UseCase<CityDetails, NoInputs> {
  final GetForcastRepo _repo;
  GetCityDetailsByCurrentLocation(this._repo);

  @override
  Future<Either<Failure, CityDetails>> call(NoInputs input) async {
    return await _repo.getCityDetailsByCurrentLocation();
  }
}
