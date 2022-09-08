import '../../domain/entities/forcast_database_entity.dart';

class ForcastDatabaseModel extends ForcastDatabaseEntity {
  const ForcastDatabaseModel({
    required String cityName,
    required String icon,
    required int temp,
    required String description,
  }) : super(
          cityName: cityName,
          icon: icon,
          temp: temp,
          description: description,
        );

  factory ForcastDatabaseModel.fromJson(Map<String, dynamic> json) {
    return ForcastDatabaseModel(
      cityName: json['cityName'],
      temp: json['temp'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'cityName': cityName,
      'icon': icon,
      'description': description,
      'temp': temp,
    };
    return json;
  }
}
