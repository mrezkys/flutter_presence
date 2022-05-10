import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AllPresenceController extends GetxController {
  DateTime? start;
  DateTime end = DateTime.now();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getAllPresence() async {
    String uid = auth.currentUser!.uid;
    if (start == null) {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("employee")
          .doc(uid)
          .collection("presence")
          .where("date", isLessThan: end.toIso8601String())
          .orderBy(
            "date",
            descending: true,
          )
          .get();
      return query;
    } else {
      QuerySnapshot<Map<String, dynamic>> query = await firestore
          .collection("employee")
          .doc(uid)
          .collection("presence")
          .where("date", isGreaterThan: start!.toIso8601String())
          .where("date", isLessThan: end.add(Duration(days: 1)).toIso8601String())
          .orderBy(
            "date",
            descending: true,
          )
          .get();
      return query;
    }
  }

  void pickDate(DateTime pickStart, DateTime pickEnd) {
    start = pickStart;
    end = pickEnd;

    update();
    Get.back();
  }
}
