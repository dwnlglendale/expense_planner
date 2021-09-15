import 'package:flutter/material.dart';
import './new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
  void addNewTransaction(String txItem, double txPrice) {
    
    final newTx = Transaction(
        title: txItem,
        itemID: DateTime.now().toString(),
        date: DateTime.now(),
        price: txPrice);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx: _userTransactions,),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
