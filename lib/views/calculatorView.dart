import 'package:flutter/material.dart';
import 'package:marketstoreapp/services/discountCards.dart';
import 'package:marketstoreapp/services/specificCards/bronzeCard.dart';
import 'package:marketstoreapp/services/specificCards/goldCard.dart';
import 'package:marketstoreapp/services/specificCards/silverCard.dart';
import 'package:marketstoreapp/widgets/alertCalculator.dart';
import 'package:marketstoreapp/widgets/dropdownList.dart';
import 'package:marketstoreapp/widgets/inputField.dart';
import 'package:marketstoreapp/widgets/textWidget.dart';

class CalculatorView extends StatelessWidget {
  final InputField _turnover = InputField('Turnover');
  final InputField _purchaseValue = InputField('Purchase Value');
  final DropDownList _dropDownList = DropDownList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        centerTitle: true,
        title: TextWidget('Market Store'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWidget(
              'Please input the data: ',
              italic: true,
              fontSize: 25,
              color: Colors.grey[400],
            ),
            _turnover,
            _purchaseValue,
            _dropDownList,
            OutlineButton(
                child: TextWidget('Calculate', color: Colors.orange,),
                highlightColor: Colors.blueGrey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                onPressed: () {
                  double turnoverV = _turnover.getValue();
                  double purchaseValueV = _purchaseValue.getValue();
                  if(turnoverV == null || purchaseValueV == null){
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertCalculator('Both fields must be completed and containing numbers!\nPlease use valid data (numbers only)', size: 15,);
                        }
                    );
                  }
                  if(turnoverV < 0 || purchaseValueV <= 0){
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertCalculator('Both fields must contain positive numbers! \nThe purchase value must be more than 0!', size: 15,);
                        }
                    );
                  }
                  String dropDownV = _dropDownList.dropdownValue;
                  DiscountCard discountCard;
                  if(dropDownV == 'Bronze'){
                    discountCard = BronzeCard(turnoverV);
                  } else {
                    if(dropDownV == 'Silver'){
                      discountCard = SilverCard(turnoverV);
                    } else {
                      discountCard = GoldCard(turnoverV);
                    }
                  }
                  String result = discountCard.calculateTotal(purchaseValueV);
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertCalculator('Result', content: result);
                      }
                  );
                })
          ],
        ),
      ),
    );
  }
}

