part of 'forcastdatabase_cubit.dart';

abstract class ForcastDatabaseState extends Equatable {
  const ForcastDatabaseState();

  @override
  List<Object> get props => [];
}

class ForcastDatabaseInitial extends ForcastDatabaseState {}

class AddCityToDatabaseLoading extends ForcastDatabaseState {}

class AddCityToDatabaseSuccess extends ForcastDatabaseState {}

class AddCityToDatabaseError extends ForcastDatabaseState {}

class UpdateCityInfoLoading extends ForcastDatabaseState {}

class UpdateCityInfoSuccess extends ForcastDatabaseState {}

class UpdateCityInfoError extends ForcastDatabaseState {}

class GetAllWeatherLoading extends ForcastDatabaseState {}

class GetAllWeatherSuccess extends ForcastDatabaseState {}

class GetAllWeatherError extends ForcastDatabaseState {}

class DeleteCityLoading extends ForcastDatabaseState {}

class DeleteCitySuccess extends ForcastDatabaseState {}

class DeleteCityError extends ForcastDatabaseState {}
