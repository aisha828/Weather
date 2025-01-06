import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/Screen/utils/binding/home_binding.dart';
import 'package:weather/Screen/view/home/splash_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
