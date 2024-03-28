import 'package:flutter/material.dart';

import 'utils/comman/my_appbar.dart';

class YourScreen extends StatelessWidget {
  static const String routeName = '/Your';
  const YourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: MyAppBar(text: "Your"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.045,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
