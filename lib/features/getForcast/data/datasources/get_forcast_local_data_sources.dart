import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/get_forcast_model.dart';

abstract class ForcastLocalDataSources {
  /// Gets the cached [ForcastModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<ForcastModel> getLastForcast();
  Future<void> cacheForcast(ForcastModel forcastToCache);
  Future<CityDetailsModel> getLastCityDetails();
  Future<void> cacheCityDetails(CityDetailsModel cityToCache);
}

const String cachedForcastKey = 'CACHED_FORCAST';
const String cachedCityDetailsKey = 'CACHED_CityDetails';

class ForcastLocalDataSourcesImpl implements ForcastLocalDataSources {
  final SharedPreferences sharedPreferences;
  ForcastLocalDataSourcesImpl(this.sharedPreferences);
  @override
  Future<void> cacheForcast(ForcastModel forcastToCache) {
    return sharedPreferences.setString(
      cachedForcastKey,
      json.encode(
        forcastToCache.toJson(),
      ),
    );
  }

  @override
  Future<ForcastModel> getLastForcast() {
    final jsonString = sharedPreferences.getString(cachedForcastKey);
    if (jsonString != null) {
      return Future.value(ForcastModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCityDetails(CityDetailsModel cityToCache) {
    return sharedPreferences.setString(
      cachedCityDetailsKey,
      json.encode(
        cityToCache.toJson(),
      ),
    );
  }

  @override
  Future<CityDetailsModel> getLastCityDetails() {
    final jsonString = sharedPreferences.getString(cachedCityDetailsKey);
    if (jsonString != null) {
      return Future.value(CityDetailsModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
