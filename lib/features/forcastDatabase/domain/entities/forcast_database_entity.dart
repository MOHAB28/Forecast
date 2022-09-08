import 'package:equatable/equatable.dart';

class ForcastDatabaseEntity extends Equatable {
  final String cityName;
  final String icon;
  final int temp;
  final String description;
  const ForcastDatabaseEntity({
    required this.cityName,
    required this.icon,
    required this.description,
    required this.temp,
  });

  @override
  List<Object?> get props => [
        cityName,
        icon,
        temp,
        description,
      ];
}
