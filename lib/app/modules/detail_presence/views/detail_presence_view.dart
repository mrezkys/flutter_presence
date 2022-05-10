import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presence/app/style/app_color.dart';

import '../controllers/detail_presence_controller.dart';

class DetailPresenceView extends GetView<DetailPresenceController> {
  final Map<String, dynamic> presenceData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Presence Detail',
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
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        children: [
          // check in ============================================
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.secondaryExtraSoft, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'check in',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          (presenceData["masuk"] == null) ? "-" : "${DateFormat.jm().format(DateTime.parse(presenceData["masuk"]["date"]))}",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    //presence date
                    Text(
                      "${DateFormat.yMMMMEEEEd().format(DateTime.parse(presenceData["date"]))}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  'status',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  (presenceData["masuk"]?["in_area"] == true) ? "In area presence" : "Outside area presence",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 14),
                Text(
                  'address',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  (presenceData["masuk"] == null) ? "-" : "${presenceData["masuk"]["address"]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          // check out ===========================================
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.secondaryExtraSoft, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'check out',
                          style: TextStyle(color: AppColor.secondary),
                        ),
                        SizedBox(height: 4),
                        Text(
                          (presenceData["keluar"] == null) ? "-" : "${DateFormat.jm().format(DateTime.parse(presenceData["keluar"]["date"]))}",
                          style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    //presence date
                    Text(
                      "${DateFormat.yMMMMEEEEd().format(DateTime.parse(presenceData["date"]))}",
                      style: TextStyle(color: AppColor.secondary),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  'status',
                  style: TextStyle(color: AppColor.secondary),
                ),
                SizedBox(height: 4),
                Text(
                  (presenceData["keluar"]?["in_area"] == true) ? "In area presence" : "Outside area presence",
                  style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 14),
                Text(
                  'address',
                  style: TextStyle(color: AppColor.secondary),
                ),
                SizedBox(height: 4),
                Text(
                  (presenceData["keluar"] == null) ? "-" : "${presenceData["keluar"]["address"]}",
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 150 / 100,
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
