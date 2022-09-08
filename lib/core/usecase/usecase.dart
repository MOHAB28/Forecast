import 'package:dartz/dartz.dart';
import '../error/failure.dart';

abstract class UseCase<Out,In> {
  Future<Either<Failure, Out>> call(In input);
}

class NoInputs {}
