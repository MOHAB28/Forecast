part of 'getforcast_cubit.dart';

abstract class GetForcastState extends Equatable {
  const GetForcastState();

  @override
  List<Object> get props => [];
}

class GetforcastInitial extends GetForcastState {}

class ForcastLoading extends GetForcastState {}

class ForcastError extends GetForcastState {
  final String message;
  const ForcastError({required this.message});
}

class ForcastLoaded extends GetForcastState {}

class ForcastByNameLoading extends GetForcastState {}

class ForcastByNameError extends GetForcastState {
  final String message;
  const ForcastByNameError({required this.message});
}

class ForcastByNameLoaded extends GetForcastState {}

class CityDetailsLoading extends GetForcastState {}

class CityDetailsError extends GetForcastState {
  final String message;
  const CityDetailsError({required this.message});
}

class CityDetailsLoaded extends GetForcastState {}

class ChangeThemeMode extends GetForcastState {}
