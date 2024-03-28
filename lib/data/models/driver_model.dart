import 'package:cloud_firestore/cloud_firestore.dart';

import 'address_model.dart';
import 'driver_delivery_history_model.dart';
import 'vechicle_info_model.dart';

class DriverModel {
  final int id;
  final String userName;
  final String name;
  final String email;
  final int phoneNumber;
  final String? profilePicture;
  final AddressModel? address;
  final double? latitude;
  final double? longitude;
  final VehicleInfoModel vehicleInfoModel;
  final List<DriverDeliveryHistory>? deliveryHistory;
  final double? averageRating;
  final Order? assignedOrders;

  DriverModel(
      {required this.id,
      required this.userName,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.vehicleInfoModel,
      required this.deliveryHistory,
      required this.averageRating,
      required this.assignedOrders});
}
