import 'package:dartz/dartz.dart';
import '../repositories/get_forcast_details.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_forcast_entity.dart';

class GetForcastByCurrentLocation extends UseCase<Forcast,NoInputs> {
  final GetForcastRepo _repo;
  GetForcastByCurrentLocation(this._repo);

  @override
  Future<Either<Failure, Forcast>> call(NoInputs input) async {
    return await _repo.getForcastByCurrentLocation();
  }
}