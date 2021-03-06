import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset("assets/images/waiting.png",
                          fit: BoxFit.cover))
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                                    "\$${transactions[index].amount.toStringAsFixed(2)}")))),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.headline5),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor),
                          )
                        : IconButton(
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
