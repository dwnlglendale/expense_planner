import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {

        return transactions.isEmpty
            ? Column(
                children: [
                  const Text('No available transactions.'),
                  Image.asset('assets/images/waiting.png'),
                ],
              )
            : Card(
          elevation: 6,
                child: ListTile(
                  leading: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: FittedBox(
                      child: Text(
                        '\$${tx.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    ),
                  ),
                  title: Text(tx.title),
                  subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                  trailing: IconButton(onPressed: () => deleteTx(tx.itemID), icon: const Icon(Icons.delete), color: Theme.of(context).errorColor,),
                ),
              );
      }).toList(),
    );
  }
}
