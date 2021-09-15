import 'package:flutter/material.dart';
import 'user_transactions.dart';

class NewTransaction extends StatelessWidget {
   NewTransaction({Key? key, required this.addTx}) : super(key: key);

  final itemController = TextEditingController();
  final priceController = TextEditingController();
  final Function addTx ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end ,
          children:  [
            TextField(decoration: const InputDecoration(labelText: 'Item'),controller: itemController,),
            TextField(decoration: const InputDecoration(labelText: 'Price'),controller: priceController,),
            TextButton(onPressed: () {
                addTx(itemController.text, double.parse(priceController.text));
              },
              child: const Text('Add Transaction',),),
          ],
        ),
      ),
    );
  }
}
