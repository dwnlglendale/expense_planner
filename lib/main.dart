import 'package:expense_planner/trasanction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'trasanction.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      title: 'Converse',
      itemID: 's001',
      date: DateTime.now(),
      price: 99.99,
    ),
    Transaction(
        title: 'Vans Old School',
        itemID: 's002',
        date: DateTime.now(),
        price: 59.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Card(
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text('TRANSACTIONS MADE'),
            ),
          ),
          Column(
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
                    '\$${tx.price}',
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
          }).toList()),
        ],
      ),
    );
  }
}
