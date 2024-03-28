import 'package:tb_driver/utils/constant/enum.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final ProductCategories category;
  final int availableQuantity;
  final bool productVisibility;
  final String thumbnailImg;
  final List imgs;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.availableQuantity,
    required this.productVisibility,
    required this.thumbnailImg,
    required this.imgs,
  });
}
