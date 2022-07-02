import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: "Title"),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: "Amount"),
                        controller: amountController,
                      ),
                      TextButton(
                        onPressed: () {
                          addTransaction(titleController.text, double.parse(amountController.text));
                        },
                        style: TextButton.styleFrom(primary: Colors.purple),
                        child: const Text("Add Transaction"),
                      )
                    ]),
              ),
            );
  }
}