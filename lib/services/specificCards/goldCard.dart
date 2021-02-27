import '../discountCards.dart';

class GoldCard implements DiscountCard{
  @override
  double _turnover;

  GoldCard(this._turnover);

  @override
  String calculateTotal(double purchaseValue) {
    double discount;
    double discountRate = 2.0;
    double total;

    double turnoverAux = this._turnover;

    while(discountRate < 10 && turnoverAux >= 100){
      discountRate += 1;
      turnoverAux -= 100;
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