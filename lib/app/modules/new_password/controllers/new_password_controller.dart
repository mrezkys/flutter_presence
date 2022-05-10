import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presence/app/controllers/page_index_controller.dart';
import 'package:presence/app/routes/app_pages.dart';
import 'package:presence/app/widgets/toast/custom_toast.dart';
import 'package:presence/company_data.dart';

class NewPasswordController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();
  RxBool isLoading = false.obs;
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();

  RxBool newPassObs = true.obs;
  RxBool newPassCObs = true.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  void newPassword() async {
    if (passC.text.isNotEmpty && confirmPassC.text.isNotEmpty) {
      if (passC.text == confirmPassC.text) {
        isLoading.value = true;
        if (passC.text != CompanyData.defaultPassword) {
          _updatePassword();
          isLoading.value = false;
        } else {
          CustomToast.errorToast('Error', 'you must change your password');
          isLoading.value = false;
        }
      } else {
        CustomToast.errorToast('Error', 'password doesnt match');
      }
    } else {
      CustomToast.errorToast('Error', 'you must fill all form');
    }
  }

  void _updatePassword() async {
    try {
      String email = auth.currentUser!.email!;
      await auth.currentUser!.updatePassword(passC.text);
      // relogin
      await auth.signOut();
      await auth.signInWithEmailAndPassword(email: email, password: passC.text);
      Get.offAllNamed(Routes.HOME);

      pageIndexController.changePage(0);
      CustomToast.successToast('success', 'success update password');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomToast.errorToast('Error', 'password too weak, you need at least six charachter');
      }
    } catch (e) {
      CustomToast.errorToast('Error', 'error : ${e.toString()}');
    }
  }
}
