import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';


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


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _userTransactions = [
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

  //function to add user input
  void _addNewTransaction(String txItem, double txPrice) {

    final newTx = Transaction(
        title: txItem,
        itemID: DateTime.now().toString(),
        date: DateTime.now(),
        price: txPrice);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(addTx: _addNewTransaction,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
        actions: [IconButton(onPressed: () => _startAddNewTransaction(context), icon: const Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const Card(
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text('TRANSACTIONS MADE'),
              ),
            ),
            TransactionList(transactions:_userTransactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _startAddNewTransaction(context),child: const Icon(Icons.add),),
    );
  }
}
