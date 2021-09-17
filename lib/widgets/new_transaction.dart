import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
   NewTransaction({Key? key, required this.addTx}) : super(key: key);

  final Function addTx ;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemController = TextEditingController();

  final priceController = TextEditingController();

  void submitData (){

    final enteredTitle = itemController.text;
    final enteredAmount = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    widget.addTx(enteredTitle, enteredAmount,);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end ,
          children:  [
            TextField(decoration: const InputDecoration(labelText: 'Item'),controller: itemController,onSubmitted: (_val) => submitData(),),
            TextField(decoration: const InputDecoration(labelText: 'Price'),controller: priceController, keyboardType: TextInputType.number,onSubmitted: (_val) => submitData(),),
            TextButton(onPressed: () {
                submitData();
              },
              child: const Text('Add Transaction',),),
          ],
        ),
      ),
    );
  }
}
