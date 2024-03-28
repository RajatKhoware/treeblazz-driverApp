import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_driver/data/models/products.dart';
import 'package:tb_driver/utils/constant/enum.dart';
import 'package:tb_driver/utils/utils.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  @override
  void onInit() {
    // Initialize the controller with the initial value of _productQuantity
    //quantityController.text = _productQuantity.value.toString();
    _dummyProducts.addAll(Utils.generateDummyProducts());
    _filteredProducts.assignAll(_dummyProducts);
    super.onInit();
  }

  // controllers
  TextEditingController quantityController = TextEditingController();

  // variables
  final RxList<Product> _dummyProducts = <Product>[].obs;
  final RxList<Product> _filteredProducts = <Product>[].obs;
  //final Rx<int> _productQuantity = 0.obs;

  // void incrementProductQuantity() {
  //   int currentQuantity = int.tryParse(quantityController.text) ?? 0;
  //   _productQuantity.value = currentQuantity + 1;
  //   quantityController.text = _productQuantity.value.toString();
  // }

  // void decrementProductQuantity() {
  //   int currentQuantity = int.tryParse(quantityController.text) ?? 0;
  //   if (currentQuantity > 0) {
  //     _productQuantity.value = currentQuantity - 1;
  //     quantityController.text = _productQuantity.value.toString();
  //   }
  // }

  // Set selected product
  void selectedProduct(Product p) {
    final product = p;
    quantityController.text = product.availableQuantity.toString();
  }

  List<Product> get filteredProducts => _filteredProducts;

  // check if the product are empty only if it generate dummyorder list
  List<Product> get dummyProducts {
    if (_dummyProducts.isEmpty) {
      _dummyProducts.addAll(Utils.generateDummyProducts());
    }
    return _dummyProducts;
  }

  // filtering the order based on their status
  // void filterProducts(ProductCategories categories) {
  //   _filteredProducts.assignAll(_dummyProducts.where((product) {
  //     return product.category == categories;
  //   }));
  // }

  // void clearFilter() {
  //   _filteredProducts.assignAll(_dummyProducts);
  // }

  // Update the list when the page is refreshed
  // List<Product> refreshProducts() {
  //   _dummyProducts.clear();
  //   _dummyProducts.value = Utils.generateDummyProducts();
  //   clearFilter();
  //   return _dummyProducts;
  // }
}
