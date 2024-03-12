import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: width * 0.065,
        height: height * 0.035,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.black.withOpacity(0.6), // Border color
            width: 2.0,
          ),
          color: Colors.transparent, // Fill color when checked
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: width * 0.045,
                color: Colors.red, // Check icon color
              )
            : null,
      ),
    );
  }
}
