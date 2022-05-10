import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence/app/style/app_color.dart';

class PresenceCard extends StatelessWidget {
  final Map<String, dynamic> userData;
  final Map<String, dynamic>? todayPresenceData;
  PresenceCard({required this.userData, required this.todayPresenceData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage('assets/images/pattern-1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // job
          Text(
            userData["job"],
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          //  Employee ID
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 12),
            child: Text(
              userData["employee_id"],
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
          ),
          // check in - check out box
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              color: AppColor.primarySoft,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                //  check in
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "check in",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        (todayPresenceData?["masuk"] == null) ? "-" : "${DateFormat.jms().format(DateTime.parse(todayPresenceData!["masuk"]["date"]))}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1.5,
                  height: 24,
                  color: Colors.white,
                ),
                // check out
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "check out",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        (todayPresenceData?["keluar"] == null) ? "-" : "${DateFormat.jms().format(DateTime.parse(todayPresenceData!["keluar"]["date"]))}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
