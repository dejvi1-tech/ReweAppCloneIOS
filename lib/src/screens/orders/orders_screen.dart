import 'package:flutter/cupertino.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Meine Bestellungen'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.bag,
              size: 80,
              color: CupertinoColors.systemGreen,
            ),
            SizedBox(height: 16),
            Text(
              'Keine Bestellungen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.systemGrey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Sie haben noch keine Bestellungen aufgegeben',
              style: TextStyle(
                color: CupertinoColors.systemGrey2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}