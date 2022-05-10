import 'package:get/get.dart';

import '../controllers/update_pofile_controller.dart';

class UpdatePofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePofileController>(
      () => UpdatePofileController(),
    );
  }
}
