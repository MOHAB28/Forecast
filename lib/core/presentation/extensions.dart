import 'assets_manager.dart';

extension UVIndexExtension on int {
  String uvi() {
    if (this >= 0 && this < 3) {
      return 'min';
    } else if (this >= 3 && this < 6) {
      return 'low';
    } else if (this >= 6 && this < 8) {
      return 'moderate';
    } else if (this >= 8 && this < 11) {
      return 'high';
    } else {
      return 'error';
    }
  }
}

extension WeatherIconExtension on String {
  String imagePath() {
    Map<String, String> weatherIcon = {
      '01d': AssetsManager.clearSkyWithSun,
      '01n': AssetsManager.clearSkyWithMoon,
      '02d': AssetsManager.fewCloudsWithSun,
      '02n': AssetsManager.fewCloudsWithMoon,
      '03d': AssetsManager.scatteredClouds,
      '03n': AssetsManager.scatteredClouds,
      '04d': AssetsManager.scatteredClouds,
      '04n': AssetsManager.scatteredClouds,
      '09d': AssetsManager.showerRainClouds,
      '09n': AssetsManager.showerRainClouds,
      '10d': AssetsManager.rainWithSun,
      '10n': AssetsManager.rainWithMoon,
      '11d': AssetsManager.thunderstormClouds,
      '11n': AssetsManager.thunderstormClouds,
      '13d': AssetsManager.snow,
      '13n': AssetsManager.snow,
      '50d': AssetsManager.mistWithSun,
      '50n': AssetsManager.mistWithMoon,
    };
    return weatherIcon[this]!;
  }
}
