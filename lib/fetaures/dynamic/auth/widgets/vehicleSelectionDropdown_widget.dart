import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant/app_colors.dart';
import '../../../../utils/comman/my_text.dart';

class VehicleSelectionDropdown extends StatefulWidget {
  const VehicleSelectionDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleSelectionDropdownState createState() =>
      _VehicleSelectionDropdownState();
}

class _VehicleSelectionDropdownState extends State<VehicleSelectionDropdown> {
  String _selectedVehicle = 'Hero Bike'; // Default selected vehicle

  List<String> vehicleTypes = [
    'Hero Bike',
    'Jupiter Scooty',
    'Royal Enfield',
    'Activa Scooter',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        MyTextPoppines(
          text: "Select vehicle type",
          fontSize: width * 0.038,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: height * 0.01),
        Container(
          padding: EdgeInsets.all(width * 0.022),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(width * 0.01),
            border: Border.all(
              width: width * 0.002,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                // flex: 1,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedVehicle,
                    icon: const Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColor.black,
                    ),
                    iconSize: width * 0.05,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedVehicle = newValue!;
                      });
                    },
                    items: vehicleTypes.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: MyTextPoppines(
                            text: value,
                            fontSize: width * 0.038,
                            color: Colors.black.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
