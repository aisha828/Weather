import 'package:weather/Screen/model/current_weather_data.dart';
import 'package:weather/Screen/model/five_hours_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String city;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = 'appid=b02af426a3fad0d92d3e0b32f9324cf0';

  WeatherService({required this.city});

  Future<void> Request({
    required String url,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (onSuccess != null) {
          onSuccess(data);
        }
      } else {
        if (onError != null) {
          onError('Error: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (onError != null) {
        onError(error);
      }
    }
  }
  void getCurrentWeatherData({
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    Request(
      url: url,
      onSuccess: (data) => onSuccess?.call(CurrentWeatherData.fromJson(data)),
      onError: onError,
    );
  }

  void getFiveHoursForcastData({
    Function(List<FiveHoursData> fiveHoursData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    Request(
      url: url,
      onSuccess: (data) {
        final list = (data['list'] as List)
            .map((t) => FiveHoursData.fromJson(t))
            .toList();
        onSuccess?.call(list);
      },
      onError: onError,
    );
  }
}
