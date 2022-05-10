import 'package:get/get.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEmployeeController>(
      () => AddEmployeeController(),
    );
  }
}
