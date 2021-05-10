import 'package:expensive_track/models/transaction.dart';
import 'package:expensive_track/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    // Checking width of screen
    final isLargeWidth = MediaQuery.of(context).size.width > 460;

    return transactions.isEmpty
        // Use LayoutBuilder to get the constraint value of the device
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions.map((e) {
              return TransactionItem(
                key: ValueKey(e.id),
                transaction: e,
                isLargeWidth: isLargeWidth,
                deleteTransaction: deleteTransaction,
              );
            }).toList(),
          );
  }
}
