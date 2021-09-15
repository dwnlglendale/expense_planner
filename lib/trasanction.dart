import 'package:flutter/foundation.dart';

class Transaction {
  final String itemID;
  final String title;
  final double price;
  final DateTime date;

  Transaction({required this.title, required this.itemID, required this.date, required this.price });
}