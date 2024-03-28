import 'package:flutter/material.dart';
import 'package:tb_driver/utils/comman/my_appbar.dart';
import 'package:tb_driver/utils/comman/my_text.dart';

import '../../../../utils/constant/app_colors.dart';

class FAQScreen extends StatefulWidget {
  static const String routeName = '/faq';

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<bool> _expandStateList = [];
  int _currentIndex = -1; // Index of the currently expanded tile

  @override
  void initState() {
    super.initState();
    _initializeExpandState();
  }

  void _initializeExpandState() {
    _expandStateList = List.generate(
      _faqData.length,
      (index) => false,
    );
  }

  void _toggleExpansion(int index) {
    _currentIndex = index;
    setState(() {
      if (_currentIndex == index) {
        // If the currently expanded tile is clicked again, collapse it
        _expandStateList[index] = !_expandStateList[index];
        _currentIndex = _expandStateList[index] ? index : -1;
      } else {
        // If a new tile is clicked, collapse the previously expanded one and expand the new one
        _expandStateList[_currentIndex] = false;
        _expandStateList[index] = true;
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "FAQ"),
      body: ListView.builder(
        itemCount: _faqData.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColor.white,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.015,
            ),
            child: ExpansionTile(
              shape: Border.all(color: Colors.transparent),
              title: MyTextPoppines(
                text: _faqData[index]['question']!,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.032,
                color: AppColor.black,
              ),
              onExpansionChanged: (expanded) {
                _toggleExpansion(index);
              },
              initiallyExpanded: _expandStateList[index],
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.04,
                  ),
                  child: MyTextPoppines(
                    text: _faqData[index]['answer']!,
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.032,
                    maxLines: 200,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: height * 0.01)
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Map<String, String>> _faqData = [
  {
    'question': 'What is TreeBlazz?',
    'answer':
        'TreeBlazz is a website accessible at treeblazz.com, dedicated to providing services or information to its visitors.'
  },
  {
    'question': 'What is the main priority of TreeBlazz?',
    'answer': 'The main priority of TreeBlazz is the privacy of its visitors.'
  },
  {
    'question': 'To whom does the Privacy Policy apply?',
    'answer':
        'The Privacy Policy applies to online activities and is valid for visitors to the TreeBlazz website.'
  },
  {
    'question': 'What information does TreeBlazz collect?',
    'answer':
        'TreeBlazz collects personal information such as name, email address, phone number, message contents, attachments, and other information provided by visitors.'
  },
  {
    'question': 'How does TreeBlazz use the collected information?',
    'answer':
        'TreeBlazz uses the collected information to operate and maintain the website, improve user experience, understand user behavior, develop new products or features, communicate with users, prevent fraud, and more.'
  },
  {
    'question': 'What are log files?',
    'answer':
        'Log files are standard procedures followed by TreeBlazz to log visitors\' information when they visit the website. This includes IP addresses, browser type, ISP, date and time stamp, referring/exit pages, and possibly the number of clicks.'
  },
  {
    'question': 'What are cookies and web beacons?',
    'answer':
        'TreeBlazz, like any other website, uses cookies to store information such as visitors\' preferences and page visits to optimize their experience. Web beacons are also utilized for similar purposes.'
  },
  {
    'question': 'What is Google DoubleClick DART Cookie?',
    'answer':
        'Google DoubleClick DART Cookie is a third-party cookie used by Google to serve ads to TreeBlazz visitors based on their browsing history.'
  },
  {
    'question': 'What are the privacy policies of advertising partners?',
    'answer':
        'TreeBlazz advises visitors to consult the Privacy Policies of advertising partners for detailed information on their practices.'
  },
  {
    'question': 'Do third-party advertisers use cookies?',
    'answer':
        'Yes, third-party advertisers or ad networks may use cookies, JavaScript, or Web Beacons for measuring advertising effectiveness and personalizing content.'
  },
  {
    'question': 'Do I have control over third-party cookies?',
    'answer':
        'TreeBlazz does not have control over third-party cookies used by advertisers. Visitors can choose to disable cookies through their browser settings.'
  },
  {
    'question': 'What are CCPA Privacy Rights?',
    'answer':
        'Under CCPA, California consumers have rights to request disclosure, deletion, and non-sale of their personal data by businesses.'
  },
  {
    'question': 'What are GDPR Data Protection Rights?',
    'answer':
        'Under GDPR, users have rights including access, rectification, erasure, restriction, objection, and data portability.'
  },
  {
    'question': 'How can I exercise my rights under CCPA and GDPR?',
    'answer':
        'Users can exercise their rights by contacting TreeBlazz through the provided contact information.'
  },
  {
    'question': 'How does TreeBlazz protect children\'s privacy?',
    'answer':
        'TreeBlazz does not knowingly collect Personal Identifiable Information from children under 13. Parents are encouraged to monitor and guide their children\'s online activities.'
  },
  {
    'question':
        'What should I do if my child provides personal information to TreeBlazz?',
    'answer':
        'If you believe your child provided personal information, please contact TreeBlazz immediately to remove such information from records.'
  },
];
