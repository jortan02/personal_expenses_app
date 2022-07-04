import 'package:flutter/material.dart';
import './../widgets/chart_bar.dart';
import './../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item["amount"] as double);
    });
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                label: (data["day"] as String),
                spendingAmount: (data["amount"] as double),
                spendingPercentage: totalSpending == 0.0 ? 0.0 : (data["amount"] as double) / totalSpending),
          );
        }).toList()),
      ),
    );
  }
}
