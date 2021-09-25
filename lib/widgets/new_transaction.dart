import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key, required this.addTx}) : super(key: key);

  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemController = TextEditingController();

  final priceController = TextEditingController();
   DateTime? _selectedDate;

  void _submitData() {
     if(priceController.text.isEmpty){return;}
    final _enteredTitle = itemController.text;
    final _enteredAmount = double.parse(priceController.text);


    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      _enteredTitle,
      _enteredAmount,
      _selectedDate,

    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()).then((pickedDate){
          if (pickedDate == null) {
            return;
          }
           setState(() {
             _selectedDate = pickedDate;
           });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Item'),
              controller: itemController,
              onSubmitted: (_val) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Price'),
              controller: priceController,
              keyboardType: TextInputType.number,
              onSubmitted: (_val) => _submitData(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Expanded(child: Text( _selectedDate == null ? 'No Date Chosen' :'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}' )),
                TextButton(
                  child: Text (
                    'Choose Date',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    _presentDatePicker();
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _submitData();
              },
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
