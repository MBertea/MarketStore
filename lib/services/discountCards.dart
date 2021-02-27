abstract class DiscountCard{
  double _turnover;

  String calculateTotal(double purchaseValue);
  String renderResponse(double purchaseValue, double discount, double discountRate, double total);
}

