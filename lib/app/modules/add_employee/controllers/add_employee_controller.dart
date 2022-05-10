import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/app/widgets/dialog/custom_alert_dialog.dart';
import 'package:presence/app/widgets/toast/custom_toast.dart';
import 'package:presence/company_data.dart';

class AddEmployeeController extends GetxController {
  @override
  onClose() {
    idC.dispose();
    nameC.dispose();
    emailC.dispose();
    adminPassC.dispose();
  }

  RxBool isLoading = false.obs;
  RxBool isLoadingCreatePegawai = false.obs;

  TextEditingController idC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  TextEditingController adminPassC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String getDefaultPassword() {
    return CompanyData.defaultPassword;
  }

  String getDefaultRole() {
    return CompanyData.defaultRole;
  }

  Future<void> addEmployee() async {
    if (idC.text.isNotEmpty && nameC.text.isNotEmpty && emailC.text.isNotEmpty && jobC.text.isNotEmpty) {
      isLoading.value = true;
      CustomAlertDialog.confirmAdmin(
        title: 'Admin confirmation',
        message: 'you need to confirm that you are an administrator by inputting your password',
        onCancel: () {
          isLoading.value = false;
          Get.back();
        },
        onConfirm: () async {
          if (isLoadingCreatePegawai.isFalse) {
            await createEmployeeData();
            isLoading.value = false;
          }
        },
        controller: adminPassC,
      );
    } else {
      isLoading.value = false;
      CustomToast.errorToast('Error', 'you need to fill all form');
    }
  }

  createEmployeeData() async {
    if (adminPassC.text.isNotEmpty) {
      isLoadingCreatePegawai.value = true;
      String adminEmail = auth.currentUser!.email!;
      try {
        //checking if the pass is match
        await auth.signInWithEmailAndPassword(email: adminEmail, password: adminPassC.text);
        //get default password
        String defaultPassword = getDefaultPassword();
        String defaultRole = getDefaultRole();
        // if the password is match, then continue the create user process
        UserCredential employeeCredential = await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: defaultPassword,
        );

        if (employeeCredential.user != null) {
          String uid = employeeCredential.user!.uid;
          DocumentReference employee = firestore.collection("employee").doc(uid);
          await employee.set({
            "employee_id": idC.text,
            "name": nameC.text,
            "email": emailC.text,
            "role": defaultRole,
            "job": jobC.text,
            "created_at": DateTime.now().toIso8601String(),
          });

          await employeeCredential.user!.sendEmailVerification();

          //need to logout because the current user is changed after adding new user
          auth.signOut();
          // need to relogin to admin account
          await auth.signInWithEmailAndPassword(email: adminEmail, password: adminPassC.text);

          // clear form

          Get.back(); //close dialog
          Get.back(); //close form screen
          CustomToast.successToast('Success', 'success adding employee');

          isLoadingCreatePegawai.value = false;
        }
      } on FirebaseAuthException catch (e) {
        isLoadingCreatePegawai.value = false;
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          CustomToast.errorToast('Error', 'default password too short');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          CustomToast.errorToast('Error', 'Employee already exist');
        } else if (e.code == 'wrong-password') {
          CustomToast.errorToast('Error', 'wrong passowrd');
        } else {
          CustomToast.errorToast('Error', 'error : ${e.code}');
        }
      } catch (e) {
        isLoadingCreatePegawai.value = false;
        CustomToast.errorToast('Error', 'error : ${e.toString()}');
      }
    } else {
      CustomToast.errorToast('Error', 'you need to input password');
    }
  }
}
