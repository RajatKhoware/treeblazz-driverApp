import 'package:flutter/material.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  static const String routeName = '/tandc';
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(text: "Terms & Conditions"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to TreeBlazz, an e-commerce platform dedicated to providing cannabis products. Before using our services, please carefully read the following terms and conditions:',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '1. Age Requirement:',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'You must be at least 21 years old to use our services. By using our app, you confirm that you meet this age requirement.',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '2. Legal Compliance:',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'You agree to comply with all local, state, and federal laws regarding the purchase and use of cannabis products. It is your responsibility to ensure that your use of our services is legal in your jurisdiction.',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '3. Product Information:',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'We strive to provide accurate and up-to-date information about our products, including their potency, effects, and potential risks. However, we cannot guarantee the accuracy or completeness of this information. Always consult with a qualified healthcare professional before using cannabis products.',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '4. User Conduct:',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'You agree to use our services responsibly and ethically. This includes refraining from any illegal activities, abusive behavior, or violations of our community guidelines.',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '5. Privacy Policy:',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and protect your personal information.',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'By using the TreeBlazz app, you agree to these terms and conditions. If you do not agree with any part of these terms, please refrain from using our services.',
              // style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'For any questions or concerns regarding these terms and conditions, please contact us at support@treeblazz.com.',
              // style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
