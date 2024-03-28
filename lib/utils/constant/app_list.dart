import 'package:tb_driver/utils/constant/enum.dart';

class AppList {
  static List<Earnings> earings = [
    Earnings(title: "Today Earning", earning: "100"),
    Earnings(title: "Weekly Earning", earning: "400"),
    Earnings(title: "Febarury 2024", earning: "1420"),
    Earnings(title: "January 2024", earning: "1320"),
    Earnings(title: "December 2023", earning: "1100"),
    Earnings(title: "November 2023", earning: "1500"),
  ];

  static List<Order> orders = [
    Order(
      name: "Purple Haze Strain",
      orderNo: "ORD001",
      date: "2024-03-08",
      time: "10:00 AM",
      price: "\$50.00",
    ),
    Order(
      name: "OG Kush Strain",
      orderNo: "ORD002",
      date: "2024-03-08",
      time: "11:30 AM",
      price: "\$30.00",
    ),
    Order(
      name: "Blue Dream Strain",
      orderNo: "ORD003",
      date: "2024-03-08",
      time: "01:45 PM",
      price: "\$25.00",
    ),
    Order(
      name: "Girl Scout Cookies Strain",
      orderNo: "ORD004",
      date: "2024-03-08",
      time: "03:20 PM",
      price: "\$40.00",
    ),
    Order(
      name: "White Widow Strain",
      orderNo: "ORD005",
      date: "2024-03-08",
      time: "05:00 PM",
      price: "\$55.00",
    ),
  ];

  static const List<String> profileOptions = [
    "History",
    "My Cash Balance",
    "Earing History",
    "Change Password",
    "Help",
    "FAQ",
    "Notification Sound",
    "Sign Out"
  ];

  // List of profile features
  static List profileOptionsList = [
    // [
    //   "Delivery Address",
    //   "/myAddress",
    // ],
    [
      "Change Password",
      "/changePassword",
    ],
    // [
    //   "Help",
    //   "/support",
    // ],
    [
      "Terms and Conditions",
      "/tandc",
    ],
    [
      "Privacy Polices",
      "/privacy",
    ],
    [
      "FAQ",
      "/faq",
    ],
    ["Sign Out", "/signin"],
  ];

  // Product Names according to Categories
  static Map<ProductCategories, List<String>> categoryWords = {
    ProductCategories.cannabis: [
      'Indica',
      'Sativa',
      'Hybrid',
      'Edibles',
      'Concentrates'
    ],
    ProductCategories.vegitable: [
      'Organic',
      'Fresh',
      'Local',
      'Exotic',
      'Seasonal'
    ],
    ProductCategories.personalCare: [
      'Organic',
      'Natural',
      'Vegan',
      'Luxury',
      'Gentle'
    ],
    ProductCategories.homeCare: [
      'Eco-Friendly',
      'Non-Toxic',
      'Fragrance-Free',
      'Pet-Safe'
    ],
    ProductCategories.drinks: [
      'Organic',
      'Artisanal',
      'Craft',
      'Premium',
      'Sparkling'
    ],
  };
}

class Earnings {
  final String title;
  final String earning;

  Earnings({required this.title, required this.earning});
}

class Order {
  final String name;
  final String orderNo;
  final String date;
  final String time;
  final String price;

  Order({
    required this.name,
    required this.orderNo,
    required this.date,
    required this.time,
    required this.price,
  });
}
