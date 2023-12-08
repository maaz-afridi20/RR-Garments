class TPricingCalculator {
  //----------------------------------------------------------------
  static double getTaxRateForLocation(String location) {
    // return the appropriate tax rate
    return 0.10;
  }

  //----------------------------------------------------------------
  static double getShippingCost(String location) {
    // calculate the shipment cost based on various factors
    return 5.00;
  }
  //----------------------------------------------------------------

  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shipmentcost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shipmentcost;
    return totalPrice;
  }

  // calculates the shipment cost

  static String calculateShipmentCost(double productPrice, String location) {
    double shipmentCost = getShippingCost(location);
    return shipmentCost.toStringAsFixed(2);
  }

// calculates the tax cost

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }
}
