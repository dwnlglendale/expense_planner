import 'package:expense_planner/widgets/user_transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Card(
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text('TRANSACTIONS MADE'),
            ),
          ),
          UserTransaction()
        ],
      ),
    );
  }
}
