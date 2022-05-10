import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:presence/app/style/app_color.dart';
import 'package:presence/app/widgets/custom_input.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 35 / 100,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColor.primaryGradient,
              image: DecorationImage(
                image: AssetImage('assets/images/pattern-1-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Open Source\nPresence App",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontFamily: 'poppins',
                    height: 150 / 100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "by github.com/mrezkys",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 65 / 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 84),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "You log in with the default password. To continue, you must create a new password.",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          height: 150 / 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => CustomInput(
                    controller: controller.passC,
                    label: 'New Password',
                    hint: '*****************',
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
                    controller: controller.confirmPassC,
                    label: 'Confirm New Password',
                    hint: '*****************',
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
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.isLoading.isFalse) {
                          print('exc');
                          controller.newPassword();
                        }
                      },
                      child: Text(
                        (controller.isLoading.isFalse) ? 'Continue' : 'Loading...',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        primary: AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('NewPasswordView'),
    //     centerTitle: true,
    //   ),
    //   body: ListView(
    //     shrinkWrap: true,
    //     padding: EdgeInsets.all(16),
    //     children: [
    //       TextField(
    //         controller: controller.passC,
    //         autocorrect: false,
    //         obscureText: true,
    //         decoration: InputDecoration(
    //           border: OutlineInputBorder(),
    //           labelText: 'Password',
    //         ),
    //       ),
    //       SizedBox(height: 16),
    //       ElevatedButton(
    //         onPressed: () {
    //           controller.newPassword();
    //         },
    //         child: Text('Login'),
    //       ),
    //     ],
    //   ),
    // );
  }
}
