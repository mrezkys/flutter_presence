import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:presence/app/style/app_color.dart';
import 'package:presence/app/widgets/custom_input.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
            color: AppColor.secondary,
            fontSize: 14,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          Obx(
            () => CustomInput(
              controller: controller.currentPassC,
              label: 'Old Password',
              hint: '*************',
              obsecureText: controller.oldPassObs.value,
              suffixIcon: IconButton(
                icon: (controller.oldPassObs.value != false) ? SvgPicture.asset('assets/icons/show.svg') : SvgPicture.asset('assets/icons/hide.svg'),
                onPressed: () {
                  controller.oldPassObs.value = !(controller.oldPassObs.value);
                },
              ),
            ),
          ),
          Obx(
            () => CustomInput(
              controller: controller.newPassC,
              label: 'New Password',
              hint: '******************',
              obsecureText: controller.newPassObs.value,
              suffixIcon: IconButton(
                icon: (controller.newPassObs.value != false) ? SvgPicture.asset('assets/icons/show.svg') : SvgPicture.asset('assets/icons/hide.svg'),
                onPressed: () {
                  controller.newPassObs.value = !(controller.newPassObs.value);
                },
              ),
            ),
          ),
          Obx(
            () => CustomInput(
              controller: controller.confirmNewPassC,
              label: 'Confirm New Password',
              hint: '******************',
              obsecureText: controller.newPassCObs.value,
              suffixIcon: IconButton(
                icon: (controller.newPassCObs.value != false) ? SvgPicture.asset('assets/icons/show.svg') : SvgPicture.asset('assets/icons/hide.svg'),
                onPressed: () {
                  controller.newPassCObs.value = !(controller.newPassCObs.value);
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    await controller.updatePassword();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? "Change Password" : 'Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primary,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
