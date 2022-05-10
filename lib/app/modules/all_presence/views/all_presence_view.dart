import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:presence/app/style/app_color.dart';
import 'package:presence/app/widgets/presence_tile.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/all_presence_controller.dart';

class AllPresenceView extends GetView<AllPresenceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Presence',
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
        actions: [
          Container(
            width: 44,
            height: 44,
            margin: EdgeInsets.only(bottom: 8, top: 8, right: 8),
            child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  Dialog(
                    child: Container(
                      height: 372,
                      child: SfDateRangePicker(
                        headerHeight: 50,
                        headerStyle: DateRangePickerHeaderStyle(textAlign: TextAlign.center),
                        monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                        selectionMode: DateRangePickerSelectionMode.range,
                        selectionColor: AppColor.primary,
                        rangeSelectionColor: AppColor.primary.withOpacity(0.2),
                        viewSpacing: 10,
                        showActionButtons: true,
                        onCancel: () => Get.back(),
                        onSubmit: (data) {
                          if (data != null) {
                            PickerDateRange range = data as PickerDateRange;
                            if (range.endDate != null) {
                              controller.pickDate(range.startDate!, range.endDate!);
                            }
                          }
                          //else skip
                        },
                      ),
                    ),
                  ),
                );
              },
              child: SvgPicture.asset('assets/icons/filter.svg'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: GetBuilder<AllPresenceController>(
        builder: (con) {
          return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: controller.getAllPresence(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  var data = snapshot.data!.docs;
                  return ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      var presenceData = data[index].data();
                      return PresenceTile(
                        presenceData: presenceData,
                      );
                    },
                  );
                default:
                  return SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
