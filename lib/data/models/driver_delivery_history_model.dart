import '../../utils/constant/enum.dart';
import 'address_model.dart';

class DriverDeliveryHistory {
  final String orderId;
  final DateTime? pickupTime;
  final DateTime? deliveryTime;
  final OrderStatus deliveryStatus;
  final AddressModel deliveryAddress;
  final String recipientName;
  final String recipientPhoneNumber;

  DriverDeliveryHistory(
      {required this.orderId,
      required this.pickupTime,
      required this.deliveryTime,
      required this.deliveryStatus,
      required this.deliveryAddress,
      required this.recipientName,
      required this.recipientPhoneNumber});
}
