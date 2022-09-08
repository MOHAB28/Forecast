import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/get_forcast_entity.dart';
import '../../domain/usecases/get_city_details_by_cn.dart';
import '../../domain/usecases/get_city_details_by_curr_loc.dart';
import '../../domain/usecases/get_forcast_by_cn.dart';
import '../../domain/usecases/get_forcast_by_curr_loca.dart';
part 'getforcast_state.dart';

const String serverFailureMessage = 'SERVER_ERROR';
const String cacheFailureMessage = 'CACHE_ERROR';

class GetForcastCubit extends Cubit<GetForcastState> {
  final GetCityDetailsByCityName getCityDetailsByCityNameUsecase;
  final GetCityDetailsByCurrentLocation getCityDetailsByCurrentLocationUsecase;
  final GetForcastByCityName getForcastByCityNameUsecase;
  final GetForcastByCurrentLocation getForcastByCurrentLocationUsecase;
  GetForcastCubit({
    required this.getCityDetailsByCityNameUsecase,
    required this.getCityDetailsByCurrentLocationUsecase,
    required this.getForcastByCityNameUsecase,
    required this.getForcastByCurrentLocationUsecase,
  }) : super(GetforcastInitial());

  static GetForcastCubit get(context, {bool listen = true}) =>
      BlocProvider.of(context, listen: listen);

  Forcast? forcastData;
  CityDetails? cityDetails;

  Future<void> getForcastByCurrentLocation() async {
    emit(ForcastLoading());
    final failureOrForcast =
        await getForcastByCurrentLocationUsecase(NoInputs());
    failureOrForcast.fold(
      (failure) async {
        emit(ForcastError(message: _mapFailureToMessage(failure)));
      },
      (forcast) async {
        forcastData = forcast;
        emit(ForcastLoaded());
      },
    );
  }

  Future<void> getCitydetailsByCurrentLocation() async {
    emit(CityDetailsLoading());
    final failureOrForcast =
        await getCityDetailsByCurrentLocationUsecase(NoInputs());
    failureOrForcast.fold(
      (failure) async {
        emit(CityDetailsError(message: _mapFailureToMessage(failure)));
      },
      (city) async {
        cityDetails = city;
        emit(CityDetailsLoaded());
      },
    );
  }

  Forcast? forcastDataByName;
  Future<void> getForcastByCityName(String cityName) async {
    emit(ForcastByNameLoading());
    final failureOrForcast =
        await getForcastByCityNameUsecase(cityName);
    failureOrForcast.fold(
      (failure) async {
        emit(ForcastByNameError(message: _mapFailureToMessage(failure)));
      },
      (forcast) async {
        forcastDataByName = forcast;
        emit(ForcastByNameLoaded());
      },
    );
  }

  



  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
