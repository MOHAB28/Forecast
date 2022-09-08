import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/forcast_database_entity.dart';
import '../../domain/usecases/add_city_to_database.dart';
import '../../domain/usecases/delete_city_from_database.dart';
import '../../domain/usecases/get_all_stored_weather.dart';
import '../../domain/usecases/update_city_info.dart';

part 'forcastdatabase_state.dart';

class CubitInput {
  final String cityName;
  final String icon;
  final int temp;
  final String description;
  const CubitInput({
    required this.cityName,
    required this.icon,
    required this.description,
    required this.temp,
  });
}

class ForcastDatabaseCubit extends Cubit<ForcastDatabaseState> {
  final AddCityTodatabaseUsecase addCityTodatabaseUsecase;
  final DeleteCityFromdatabaseUsecase deleteCityFromdatabaseUsecase;
  final GetAllStoredWeatherUsecase getAllStoredWeatherUsecase;
  final UpdateCityIndatabaseUsecase updateCityIndatabaseUsecase;
  ForcastDatabaseCubit({
    required this.addCityTodatabaseUsecase,
    required this.deleteCityFromdatabaseUsecase,
    required this.getAllStoredWeatherUsecase,
    required this.updateCityIndatabaseUsecase,
  }) : super(ForcastDatabaseInitial());

  static ForcastDatabaseCubit get(context, {bool listen = true}) =>
      BlocProvider.of(context, listen: listen);

  List<ForcastDatabaseEntity>? cities = [];
  Future<void> getAllCities() async {
    cities = [];
    emit(GetAllWeatherLoading());
    final successOrFailure = await getAllStoredWeatherUsecase(NoInputs());
    successOrFailure.fold(
      (failure) => emit(GetAllWeatherError()),
      (citiesList) {
        cities!.addAll(citiesList);
        debugPrint(cities.toString());
        emit(GetAllWeatherSuccess());
      },
    );
  }

  Future<void> addOrUpdateCity(CubitInput input) async {
    if (cities!.isNotEmpty) {
      if (cities!.firstWhere(
            (element) =>
                element ==
                ForcastDatabaseEntity(
                  cityName: input.cityName,
                  description: input.description,
                  icon: input.icon,
                  temp: input.temp,
                ),
            orElse: () {
              return const ForcastDatabaseEntity(
                cityName: '',
                icon: '',
                description: '',
                temp: 0,
              );
            },
          ) ==
          ForcastDatabaseEntity(
            cityName: input.cityName,
            icon: input.icon,
            description: input.description,
            temp: input.temp,
          )) {
        emit(UpdateCityInfoLoading());
        final successOrFailureUpdate = await updateCityIndatabaseUsecase(
          AddCityTodatabaseUsecaseInput(
            cityName: input.cityName,
            icon: input.icon,
            description: input.description,
            temp: input.temp,
          ),
        );
        successOrFailureUpdate.fold(
          (failure) => emit(UpdateCityInfoError()),
          (done) => emit(UpdateCityInfoSuccess()),
        );
      } else {
        emit(AddCityToDatabaseLoading());
        final successOrFailureAdd = await addCityTodatabaseUsecase(
          AddCityTodatabaseUsecaseInput(
            cityName: input.cityName,
            icon: input.icon,
            description: input.description,
            temp: input.temp,
          ),
        );
        successOrFailureAdd.fold(
          (failure) => emit(AddCityToDatabaseError()),
          (done) => emit(AddCityToDatabaseSuccess()),
        );
      }
    } else {
      emit(AddCityToDatabaseLoading());
      final successOrFailureAdd = await addCityTodatabaseUsecase(
        AddCityTodatabaseUsecaseInput(
          cityName: input.cityName,
          icon: input.icon,
          description: input.description,
          temp: input.temp,
        ),
      );
      successOrFailureAdd.fold(
        (failure) => emit(AddCityToDatabaseError()),
        (done) => emit(AddCityToDatabaseSuccess()),
      );
    }
  }

  Future<void> deleteCity(String cityName) async {
    emit(DeleteCityLoading());
    final successOrFailure = await deleteCityFromdatabaseUsecase(cityName);
    successOrFailure.fold(
      (failure) => emit(DeleteCityError()),
      (done) => emit(DeleteCitySuccess()),
    );
  }
}
