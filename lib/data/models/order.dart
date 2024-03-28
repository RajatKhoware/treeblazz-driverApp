import '../../utils/constant/enum.dart';
import 'products.dart';

class Orders {
  final String id;
  final String date;
  final String time;
  final PaymentMode paymentMode;
  final List<Product> products;
  final OrderStatus status;
  final String storeName;
  final double subTotal;
  final double tax;
  final double deliveryCharges;
  final double discount;
  final double total;
  final String deliveryAddress;
  final String pickupAddress;
  // add user details also

  Orders({
    required this.id,
    required this.date,
    required this.time,
    required this.paymentMode,
    required this.products,
    required this.status,
    required this.storeName,
    required this.subTotal,
    required this.tax,
    required this.deliveryCharges,
    required this.discount,
    required this.total,
    required this.deliveryAddress,
    required this.pickupAddress,
  });
}
