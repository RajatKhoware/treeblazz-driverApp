enum ProductCategory {
  flower,
  preroll,
  bong,
  pipe,
  vap,
  grinders,
  cartridges,
  edibles,
  smoking,
}

enum PaymentMode { paySwifter }

enum ProductCategories {
  cannabis,
  vegitable,
  personalCare,
  homeCare,
  drinks,
}

enum OrderStatus {
  // // User app statuses
  // placed, // Order placed by user
  // cancelled, // Order cancelled by the user

  // // Partner app statuses
  // accept, why beed it
  // preparing, // Order is being prepared by the partner
  readyForPickup, // Order is ready for pickup by the driver --> show order to delivery company
  // outForPickup,
  pickedUpByDriver, // Order picked up by the driver from the partner

  // Driver app statuses
  outForDelivery, // Driver is en route for delivery
  delivered, // Order has been delivered by the driver
}

enum OrderStatuss {
  //* User
  pending, // --> placed by user

  //* Partner
  processing, // --> accepted by seller and preparing the order
  readyForPickup, // Order is ready for pickup by the driver --> show order to delivery company and driver

  //* Driver
  outForPickup, // --> order accepted by driver and out for pick up
  pickedUpByDriver, // --> order picked up by the driver from the partner and out for delivery to buyer

  // Driver app statuses
  outForDelivery, // Driver is en route for delivery
  delivered, // Order has been delivered by the driver
}

/// Order placed
/// order perparing by seller
/// order is ready to pickup by driver
/// 
/// order is accepted by driver 
/// driver is on the way to pick order
/// 
/// order picked by driver form seller
/// on the way to deliver the order to buyer 
/// 
/// order delivered
/// order cancelled by user
/// 
