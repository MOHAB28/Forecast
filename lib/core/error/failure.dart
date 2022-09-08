import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class LocationDisabledFailure extends Failure {}

class LocationPermessionFailure extends Failure {}