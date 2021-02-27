import '../discountCards.dart';

class BronzeCard implements DiscountCard{
  @override
  double _turnover;

  BronzeCard(this._turnover);

  @override
  String calculateTotal(double purchaseValue) {
    double discount;
    double discountRate = 0;
    double total;
    if(this._turnover >= 100 && this._turnover < 300){
      discountRate = 1;
    } else {
      if(this._turnover >= 300){
        discountRate = 2.5;
      }
    }
    discount = purchaseValue * discountRate / 100;
    total = purchaseValue - discount;
    String response = renderResponse(purchaseValue, discount, discountRate, total);
    print(response);
    return response;
  }

  @override
  String renderResponse(double purchaseValue, double discount, double discountRate, double total) {
    return "Purchase value: \$$purchaseValue \nDiscount rate: $discountRate% \nDiscount: \$$discount \nTotal: \$$total\n";
  }
}