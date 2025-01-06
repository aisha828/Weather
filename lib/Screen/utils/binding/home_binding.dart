import 'package:get/instance_manager.dart';
import 'package:weather/Screen/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'Amman'));
  }
}
