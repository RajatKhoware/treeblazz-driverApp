import 'package:flutter/material.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  static const String routeName = '/privacy';
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(text: "Privacy And Policy"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for TreeBlazz',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            Text(
              'At TreeBlazz, accessible from treeblazz.com, the privacy of our visitors is a top priority. This Privacy Policy document outlines the types of information collected and recorded by TreeBlazz and how we use it.',
            ),
            SizedBox(height: 12.0),
            Text(
              'If you have additional questions or need more information about our Privacy Policy, please do not hesitate to contact us.',
            ),
            SizedBox(height: 12.0),
            Text(
              '1. Consent',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'By using our website, you hereby consent to our Privacy Policy and agree to its terms.',
            ),
            SizedBox(height: 12.0),
            Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask for it. If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you send us, and any other information you choose to provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.',
            ),
            SizedBox(height: 12.0),
            Text(
              '3. How We Use Your Information',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We use the information we collect for various purposes, including to provide, operate, and maintain our website; improve, personalize, and expand our website; understand and analyze how you use our website; develop new products, services, features, and functionality; communicate with you for customer service, updates, and marketing purposes; prevent fraud; and more.',
            ),
            SizedBox(height: 12.0),
            Text(
              '4. Log Files',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'TreeBlazz follows standard log file procedures. These files log visitors when they visit websites. Information collected includes internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. This information is used for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information. It is not linked to any personally identifiable information.',
            ),
          ],
        ),
      ),
    );
  }
}
