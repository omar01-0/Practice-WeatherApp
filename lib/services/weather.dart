import 'package:weaknow/services/networking.dart';
import 'location.dart';
import 'package:weaknow/utilities/constants.dart';

Location locate = Location();


class WeatherModal {
  Future<dynamic> getCurrentWeatherData() async {
    await locate.getLocationData();
    NetworkHelper networkHelperCurrent = NetworkHelper(
        url: '$kURLCurrent?lat=${locate.latitude}&lon=${locate.longitude}&appid=$kAPIKey&units=metric');

    var weatherData = await networkHelperCurrent.getData();

    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getWeeklyWeatherData() async {
    NetworkHelper networkHelperWeekly = NetworkHelper(
        url: '$kURLWeekly?lat=${locate.latitude}&lon=${locate.longitude}&exclude=hourly,minutely,current&cnt=7&appid=$kAPIKey&units=metric');

    var weatherWeeklyData = await networkHelperWeekly.getData();
    print(weatherWeeklyData);
    return weatherWeeklyData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}