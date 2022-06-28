import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  const TransactionList({required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userTransactions.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
                child: Text("\$${tx.amount}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat("yyyy-MM-dd").format(tx.date),
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 48, 48, 48)),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}