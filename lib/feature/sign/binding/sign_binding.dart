import 'package:earnest_task/feature/sign/controller/sign_controller.dart';
import 'package:get/get.dart';

class SignBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignController());
  }

}