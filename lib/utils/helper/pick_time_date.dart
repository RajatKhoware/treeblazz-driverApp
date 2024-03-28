import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tb_driver/utils/constant/app_colors.dart';
import 'package:tb_driver/utils/comman/my_button.dart';
import 'package:tb_driver/utils/comman/my_text.dart';
import 'package:tb_driver/utils/utils.dart';

class PickerDateTimeRoute extends StatefulWidget {
  const PickerDateTimeRoute({super.key});

  @override
  PickerDateTimeRouteState createState() => PickerDateTimeRouteState();
}

class PickerDateTimeRouteState extends State<PickerDateTimeRoute> {
  late Future<DateTime?> selectedDate;
  String date = "-";

  late Future<TimeOfDay?> selectedTime;
  String time = "-";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomButton(
          buttonColor: AppColor.lightPink,
          borderRadiuss: 12,
          text: "PICK DATE & TIME",
          fontColor: AppColor.black,
          fontSize: width * 0.04,
          hspacing: width * 0.06,
          onTap: () {
            showDialogPicker(context);
          },
        ),
        SizedBox(height: height * 0.02),
        date == "-"
            ? const SizedBox()
            : Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.015, horizontal: width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(width * 0.03),
                  border: Border.all(color: AppColor.green, width: 2),
                ),
                child: Column(
                  children: [
                    MyTextPoppines(
                      text: time,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                    MyTextPoppines(
                      text: date,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  void showDialogPicker(BuildContext context) {
    selectedDate = showDatePicker(
      context: context,
      // helpText: 'Your Date of Birth',
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((value) {
      setState(() {
        if (value == null) return;
        date = Utils.getFormattedDateSimple(value.millisecondsSinceEpoch);
      });
      showDialogTimePicker(context);
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void showDialogTimePicker(BuildContext context) {
    selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedTime.then((value) {
      setState(() {
        if (value == null) return;
        time = "${value.hour} : ${value.minute}";
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
