import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
   NewTransaction({Key? key, required this.addTx}) : super(key: key);

  final itemController = TextEditingController();
  final priceController = TextEditingController();
  final Function addTx ;


  void submitData (){
    
    final enteredTitle = itemController.text;
    final enteredAmount = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    
    addTx(enteredTitle, enteredAmount,);
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
