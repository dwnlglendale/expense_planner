import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/widgets/chart.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Planner',
      home: const MyHomePage(),
      theme: ThemeData(
          fontFamily: 'QuickSand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 10,
                  ),
                ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.lightBlueAccent)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   title: 'Converse',
    //   itemID: 's001',
    //   date: DateTime.now(),
    //   price: 99.99,
    // ),
    // Transaction(
    //     title: 'Vans Old School',
    //     itemID: 's002',
    //     date: DateTime.now(),
    //     price: 59.99),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  //function to add user input
  void _addNewTransaction(String txItem, double txPrice, DateTime chosenDate) {
    final newTx = Transaction(
        title: txItem,
        itemID: DateTime.now().toString(),
        date: chosenDate,
        price: txPrice);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(
              addTx: _addNewTransaction,
            ),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String itemID) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.itemID == itemID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Show Chart'),
                Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    }),
              ],
            ),
            _showChart
                ? Chart(recentTransactions: _recentTransactions)
                : TransactionList(
                    transactions: _userTransactions,
                    deleteTx: _deleteTransaction,
                  )
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              onPressed: () => _startAddNewTransaction(context),
              child: const Icon(Icons.add),
            ),
    );
  }
}
