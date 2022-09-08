import 'package:dartz/dartz.dart';
import '../repositories/get_forcast_details.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_forcast_entity.dart';

class GetForcastByCityName extends UseCase<Forcast,String> {
  final GetForcastRepo _repo;
  GetForcastByCityName(this._repo);

  @override
  Future<Either<Failure, Forcast>> call(String input) async {
    return await _repo.getForcastByCityName(input);
  }
}