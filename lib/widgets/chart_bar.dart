import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar({
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to get the constraint value of the device
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final mHeight = constraints.maxHeight * 0.05;
        final txtHeight = constraints.maxHeight * 0.15;
        final barHeight = constraints.maxHeight * 0.6;

        return Column(
          children: [
            Container(
              height: txtHeight,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(height: mHeight),
            Container(
              height: barHeight,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor:
                        spendingPctOfTotal.isNaN ? 0 : spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mHeight),
            Container(
              height: txtHeight,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
