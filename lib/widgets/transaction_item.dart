import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expensive_track/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.isLargeWidth,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final bool isLargeWidth;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
        ),
        trailing: isLargeWidth
            ? TextButton.icon(
                icon: const Icon(Icons.delete_outline),
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor),
                onPressed: () => deleteTransaction(
                  transaction.id,
                ),
                label: const Text('Deleted'),
              )
            : IconButton(
                icon: const Icon(Icons.delete_outline),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(
                  transaction.id,
                ),
              ),
      ),
    );
  }
}
