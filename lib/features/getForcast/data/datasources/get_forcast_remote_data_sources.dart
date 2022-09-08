import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/network/dio_factory.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/location.dart';
import '../models/get_forcast_model.dart';


abstract class ForcastRemoteDataSources {
  /// Calls the https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=,minutely&appid=6ff048a453fc48c976b7351aac7e6b32&units=metric endpoint
  /// Throws a [ServerException] for all error codes.
  Future<ForcastModel> getForcastByCurrentLocation();

  /// Calls the https://api.openweathermap.org/data/2.5/forecast?q=london&appid=6ff048a453fc48c976b7351aac7e6b32&units=metric endpoint
  /// Throws a [ServerException] for all error codes.
  Future<ForcastModel> getForcastByCityName(String cityName);

  /// Calls the https://api.openweathermap.org/data/2.5/weather?lat=30.626&lon=31.2497&appid=6ff048a453fc48c976b7351aac7e6b32&units=metric endpoint
  /// Throws a [ServerException] for all error codes.
  Future<CityDetailsModel> getCityDetailsByCurrentLocation();

  /// Calls the https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=6ff048a453fc48c976b7351aac7e6b32&units=metric endpoint
  /// Throws a [ServerException] for all error codes.
  Future<CityDetailsModel> getCityDetailsByCityName(String cityName);
}

class ForcastRemoteDataSourcesImpl implements ForcastRemoteDataSources {
  final GeolocatorPlatform geolocator;
  ForcastRemoteDataSourcesImpl({
    required this.geolocator,
  });
  @override
  Future<ForcastModel> getForcastByCurrentLocation() async {
    Location location = Location(geolocator);
    await location.getCurrentLocation();
    final response = await DioHelper.getData(
      'data/2.5/onecall',
      {
        'lat': location.latitude,
        'lon': location.longitude,
        'exclude': 'alerts,minutely',
        'appid': APIKeys.api,
        'units': 'metric',
      },
    );
    if (response.statusCode == 200) {
      return ForcastModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ForcastModel> getForcastByCityName(String cityName) async {
    late Response<dynamic> response;
    await DioHelper.getData(
      'data/2.5/weather',
      {
        'q': cityName,
        'appid': APIKeys.api,
        'units': 'metric',
      },
    ).then((value) async {
      response = await DioHelper.getData(
        'data/2.5/onecall',
        {
          'lat': value.data['coord'] != null ? value.data['coord']['lat'] : 'r',
          'lon': value.data['coord'] != null ? value.data['coord']['lon'] : 'r',
          'exclude': 'alerts,minutely',
          'appid': APIKeys.api,
          'units': 'metric',
        },
      );
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return ForcastModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CityDetailsModel> getCityDetailsByCityName(String cityName) async {
    final response = await DioHelper.getData(
      'data/2.5/weather',
      {
        'q': cityName,
        'appid': APIKeys.api,
        'units': 'metric',
      },
    );
    if (response.statusCode == 200) {
      return CityDetailsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CityDetailsModel> getCityDetailsByCurrentLocation() async {
    Location location = Location(geolocator);
    await location.getCurrentLocation();
    final response = await DioHelper.getData(
      'data/2.5/weather',
      {
        'lat': location.latitude,
        'lon': location.longitude,
        'appid': APIKeys.api,
        'units': 'metric',
      },
    );
    if (response.statusCode == 200) {
      return CityDetailsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
