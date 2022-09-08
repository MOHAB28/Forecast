import '../../../../core/services/database.dart';
import '../../domain/repositories/forcast_database_repo.dart';
import '../models/forcast_database_model.dart';

abstract class ForcastdatabaseLocalDataSource {
  Future<List<ForcastDatabaseModel>> getAllStoredWeather();
  Future<void> addCitytoDatabase(DatebaseInput input);
  Future<void> uppateCityInDatabase(DatebaseInput input);
  Future<void> deleteCityFromDatabase(String cityName);
}

class ForcastdatabaseLocalDataSourceImpl
    implements ForcastdatabaseLocalDataSource {
  final DbHelper _dbHelper;
  ForcastdatabaseLocalDataSourceImpl(this._dbHelper);
  
  @override
  Future<void> addCitytoDatabase(DatebaseInput input) async {
    return await _dbHelper.addCity(input);
  }
  
  @override
  Future<void> deleteCityFromDatabase(String cityName) async {
    return  await _dbHelper.delete(cityName);
  }
  
  @override
  Future<List<ForcastDatabaseModel>> getAllStoredWeather() async {
    List dBWeather = await _dbHelper.allStoredWeather();
    List<ForcastDatabaseModel> weathers = [];
    for (var weather in dBWeather) {
      weathers.add(ForcastDatabaseModel.fromJson(weather));
    }
    return weathers;
  }
  
  @override
  Future<void> uppateCityInDatabase(DatebaseInput input) async {
    return await _dbHelper.weahterUpdate(input);
  }
}
