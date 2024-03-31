import 'package:get/get.dart';
import 'package:tb_driver/data/models/order_model.dart';
import 'package:tb_driver/fetaures/dynamic/orders/controllers/product_controller.dart';
import 'package:tb_driver/fetaures/dynamic/orders/screens/order_details_screen.dart';
import 'package:tb_driver/utils/comman/app_snackbar.dart';
import 'package:tb_driver/utils/constant/app_list.dart';
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
  final RxList<OrderModel> _dummyOrders = <OrderModel>[].obs;
  final RxList<OrderModel> _filteredOrders = <OrderModel>[].obs;
  final Rx<OrderModel> _order = OrderModel.empty().obs;

  //* Getters
  List<OrderModel> get filteredOrders => _filteredOrders;
  Rx<OrderModel> get order => _order;

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
  List<OrderModel> refreshOrders() {
    _dummyOrders.clear();
    _dummyOrders.value = Utils.generateDummyOrders(controller.dummyProducts);
    clearFilter();
    return _dummyOrders;
  }

  // Function to filter orders based on status
  List<OrderModel> filterOrdersByStatus(OrderStatus status) {
    return _dummyOrders.where((order) => order.status == status).toList();
  }

  // Function to calculate the length of orders with a specific status
  int getOrderLengthByStatus(OrderStatus status) {
    return filterOrdersByStatus(status).length;
  }

  // -- Get Order By Id
  void getOrderDetails(String orderId) {
    OrderModel order = _dummyOrders.firstWhere(
      (order) => order.id == orderId.toString(),
      orElse: () => OrderModel.empty(),
    );
    _order.value = order;
  }

  // -- Change Order Status
  void changeOrderStatus(OrderStatus newStatus) {
    _order.value.status = newStatus;
  }

  void orderPicked() {
    if (_order.value.status == OrderStatus.readyForPickup) {
      changeOrderStatus(OrderStatus.pickedUpByDriver);
      changeOrderStatus(OrderStatus.outForDelivery);
      MySnackBar.showSuccess(
        title: "Order Picked Successfully",
        message: "follow the route to deliver the order to buyer",
      );
    }
    update();
  }

  void orderDelivered() {
    if (_order.value.status == OrderStatus.pickedUpByDriver ||
        _order.value.status == OrderStatus.outForDelivery) {
      changeOrderStatus(OrderStatus.delivered);
      MySnackBar.showSuccess(
        title: "Order Delivered Successfully",
        message: "",
      );
    }
    update();
  }
}













  // final Rx<OrderModel> _order = OrderModel(
  //   id: "",
  //   date: "",
  //   time: "",
  //   paymentMode: PaymentMode.paySwifter,
  //   products: [],
  //   status: OrderStatus.readyForPickup,
  //   storeName: "",
  //   subTotal: 0,
  //   tax: 0,
  //   deliveryCharges: 0,
  //   discount: 0,
  //   total: 0,
  //   deliveryAddress: '',
  //   pickupAddress: '',
  // ).obs;
