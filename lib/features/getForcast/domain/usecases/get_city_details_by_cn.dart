import 'package:dartz/dartz.dart';
import '../repositories/get_forcast_details.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_forcast_entity.dart';

class GetCityDetailsByCityName extends UseCase<CityDetails,String> {
  final GetForcastRepo _repo;
  GetCityDetailsByCityName(this._repo);

  @override
  Future<Either<Failure, CityDetails>> call(String input) async {
    return await _repo.getCityDetailsByCityName(input);
  }
}