import 'package:flutter/material.dart';
import 'package:marketstoreapp/services/discountCards.dart';
import 'package:marketstoreapp/services/specificCards/bronzeCard.dart';
import 'package:marketstoreapp/services/specificCards/goldCard.dart';
import 'package:marketstoreapp/services/specificCards/silverCard.dart';
import 'package:marketstoreapp/views/calculatorView.dart';
import 'package:marketstoreapp/widgets/mockResult.dart';
import 'package:marketstoreapp/widgets/textWidget.dart';

class HomeView extends StatelessWidget {
  String _mockResultBronze;
  String _mockResultSilver;
  String _mockResultGold;

  double _mockTurnoverBronze = 0;
  double _mockTurnoverSilver = 600;
  double _mockTurnoverGold = 1500;

  double _mockPurchaseBronze = 150;
  double _mockPurchaseSilver = 850;
  double _mockPurchaseGold = 1300;

  @override
  Widget build(BuildContext context) {
    DiscountCard discountBronze = BronzeCard(_mockTurnoverBronze);

    DiscountCard discountSilver = SilverCard(_mockTurnoverSilver);

    DiscountCard discountGold = GoldCard(_mockTurnoverGold);

    _mockResultBronze = discountBronze.calculateTotal(_mockPurchaseBronze);
    _mockResultSilver = discountSilver.calculateTotal(_mockPurchaseSilver);
    _mockResultGold = discountGold.calculateTotal(_mockPurchaseGold);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        centerTitle: true,
        title: TextWidget('Market Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWidget(
              'Results from mock data:',
              italic: true,
              fontSize: 25,
              color: Colors.grey[400],
            ),
            MockResult('Bronze', _mockResultBronze),
            MockResult('Silver', _mockResultSilver),
            MockResult('Gold', _mockResultGold)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) =>
                    CalculatorView()
                )
            );
          },
          icon: Icon(Icons.arrow_forward_rounded),
          label: TextWidget(
            'Calculator',
          )
      ),
    );
  }
}

