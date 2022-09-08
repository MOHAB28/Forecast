import 'package:equatable/equatable.dart';

class CityDetails extends Equatable {
  final String cityName;
  const CityDetails({required this.cityName});
  @override
  List<Object?> get props => [cityName];
}

class Forcast extends Equatable {
  final String message;
  final String code;
  final CurrentForcast currentForcast;
  final List<HourlyForcast> hourlyForcast;
  final List<DailyForcast> dailyForcast;
  const Forcast({
    required this.hourlyForcast,
    required this.currentForcast,
    required this.dailyForcast,
    required this.message,
    required this.code,
  });
  @override
  List<Object?> get props => [
        hourlyForcast,
        dailyForcast,
        currentForcast,
        message,
        code,
      ];
}

class CurrentForcast extends Equatable {
  final int dateTime;
  final int sunrise;
  final int sunset;
  final int temp;
  final int feelsLike;
  final int pressure;
  final int humidity;
  final int uvi;
  final int windSpeed;
  final String mainTitle;
  final String description;
  final String icon;

  const CurrentForcast({
    required this.dateTime,
    required this.description,
    required this.feelsLike,
    required this.humidity,
    required this.icon,
    required this.mainTitle,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.uvi,
    required this.windSpeed,
  });
  @override
  List<Object?> get props => [
        dateTime,
        description,
        feelsLike,
        humidity,
        icon,
        mainTitle,
        pressure,
        sunrise,
        sunset,
        temp,
        uvi,
        windSpeed,
      ];
}

class HourlyForcast extends Equatable {
  final int dateTime;
  final int temp;
  final int windSpeed;
  final String icon;
  const HourlyForcast({
    required this.dateTime,
    required this.icon,
    required this.temp,
    required this.windSpeed,
  });
  @override
  List<Object?> get props => [];
}

class DailyForcast extends Equatable {
  final int dateTime;
  final int sunrise;
  final int sunset;
  final int temp;
  final int nightTemp;
  final int mornTemp;
  final String mainTitle;
  final String icon;
  const DailyForcast({
    required this.dateTime,
    required this.mainTitle,
    required this.mornTemp,
    required this.nightTemp,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.icon,
  });
  @override
  List<Object?> get props => [
        dateTime,
        icon,
        mainTitle,
        mornTemp,
        nightTemp,
        sunrise,
        sunset,
        temp,
      ];
}
