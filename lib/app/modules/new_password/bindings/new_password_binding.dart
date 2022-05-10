import 'package:get/get.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(
      () => NewPasswordController(),
    );
  }
}
