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
  // accept,
  // preparing, // Order is being prepared by the partner
  readyForPickup, // Order is ready for pickup by the driver --> show order to delivery company
  // driver aloted + out for pick
  pickedUpByDriver, // Order picked up by the driver from the partner

  // Driver app statuses
  outForDelivery, // Driver is en route for delivery
  delivered, // Order has been delivered by the driver
}
