import 'package:get/get.dart';

import '../controllers/all_presence_controller.dart';

class AllPresenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPresenceController>(
      () => AllPresenceController(),
    );
  }
}
