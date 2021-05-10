import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expensive_track/models/transaction.dart';

class TransactionItem extends StatefulWidget {
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
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const colors = [Colors.blue, Colors.red, Colors.green, Colors.orange];

    _bgColor = colors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(widget.transaction.date),
        ),
        trailing: widget.isLargeWidth
            ? TextButton.icon(
                icon: const Icon(Icons.delete_outline),
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor),
                onPressed: () => widget.deleteTransaction(
                  widget.transaction.id,
                ),
                label: const Text('Deleted'),
              )
            : IconButton(
                icon: const Icon(Icons.delete_outline),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTransaction(
                  widget.transaction.id,
                ),
              ),
      ),
    );
  }
}
