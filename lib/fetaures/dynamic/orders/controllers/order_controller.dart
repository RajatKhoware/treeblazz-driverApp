import 'package:get/get.dart';
import 'package:tb_driver/data/models/order.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/product_controller.dart';
import 'package:tb_driver/utils/constant/enum.dart';
import 'package:tb_driver/utils/utils.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final controller = Get.put(ProductController());

  @override
  void onInit() {
    super.onInit();
    _dummyOrders.addAll(Utils.generateDummyOrders(controller.dummyProducts));
    _filteredOrders.assignAll(_dummyOrders);
  }

  //* Variables
  final RxList<Orders> _dummyOrders = <Orders>[].obs;
  final RxList<Orders> _filteredOrders = <Orders>[].obs;

  //* Getters
  List<Orders> get filteredOrders => _filteredOrders;

  //* Methods
  // filtering the order based on there status
  void filterOrders(OrderStatus status) {
    _filteredOrders
        .assignAll(_dummyOrders.where((order) => order.status == status));
  }

  // clear all the filter and set it again to dummyorder list
  void clearFilter() {
    _filteredOrders.assignAll(_dummyOrders);
  }

  // Update the list when page is refreshed
  List<Orders> refreshOrders() {
    _dummyOrders.clear();
    _dummyOrders.value = Utils.generateDummyOrders(controller.dummyProducts);
    clearFilter();
    return _dummyOrders;
  }

  // Function to filter orders based on status
  List<Orders> filterOrdersByStatus(OrderStatus status) {
    return _dummyOrders.where((order) => order.status == status).toList();
  }

  // Function to calculate the length of orders with a specific status
  int getOrderLengthByStatus(OrderStatus status) {
    return filterOrdersByStatus(status).length;
  }
}
