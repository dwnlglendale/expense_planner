import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
   const TransactionList({Key? key, required this.transactions}) : super(key: key);

   final List<Transaction> transactions;


  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
          return Card(
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
                child: Text(
                  '\$${tx.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.purple),
                ),
              ),
              title: Text(tx.title),
              subtitle: Text(DateFormat.yMMMd().format(tx.date)),
            ),
          );
        }).toList());
  }
}
