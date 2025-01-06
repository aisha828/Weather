import 'package:get/get.dart';
import 'package:weather/Screen/model/current_weather_data.dart';
import 'package:weather/Screen/model/five_hours_data.dart';
import 'package:weather/Screen/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  String? searchText;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveHoursData> fiveHoursData = [];

  HomeController({this.city});

  @override
  void onInit() {
    super.onInit();
    initState();
    getTopFiveCities();
  }

  void updateWeather() {
    initState();
  }
  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    if (city != null) {
      WeatherService(city: city!).getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) {
          print(error);
          update();
        },
      );
    }
  }
  void getTopFiveCities() {
    List<String> cities = [
      'Tafilah',
      'Karak',
      'Ajloun',
      'Zarqa',
      'Jerash',
    ];
    cities.forEach((c) {
      WeatherService(city: c).getCurrentWeatherData(
        onSuccess: (data) {
          dataList.add(data);
          update();
        },
        onError: (error) {
          print(error);
          update();
        },
      );
    });
  }

  void getFiveDaysData() {
    if (city != null) {
      WeatherService(city: city!).getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveHoursData = data;
          update();
        },
        onError: (error) {
          print(error);
          update();
        },
      );
    }
  }
}
