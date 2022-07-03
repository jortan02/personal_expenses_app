import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                )
                ,
                Container(
                    height: 200,
                    child: Image.asset("assets/images/waiting.png",
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            "\$${transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.headline5),
                          Text(
                            DateFormat("yyyy-MM-dd")
                                .format(transactions[index].date),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 48, 48, 48)),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
