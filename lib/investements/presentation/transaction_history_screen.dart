import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';

import '../domain/transaction_history.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({
    super.key,
    required this.transactionHistoryList,
  });

  final List<TransactionHistory> transactionHistoryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Transaction History',
          style: titleText,
        ),
        backgroundColor: secondaryColor, // Customize as needed
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: transactionHistoryList.length,
        itemBuilder: (context, index) {
          TransactionHistory transactionHistory = transactionHistoryList[index];

          return ListTile(
            // selectedColor: secondaryColor.shade200,
            // tileColor: secondaryColor.shade200,
            // focusColor: secondaryColor.shade200,
            // selectedTileColor: secondaryColor.shade200,
            shape: const RoundedRectangleBorder(side: BorderSide(width: .5)),
            title: Text(
              'Transaction ID: ${transactionHistory.transactionId}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Date: ${transactionHistory.transactionDate.toLocal().toString().split(' ')[0]}'),
                Text(
                    'Amount: $rupeeSymbol${transactionHistory.amount.toStringAsFixed(2)}'),
                if (transactionHistory.balanceAmount != null &&
                    transactionHistory.balanceAmount != 0)
                  Text(
                      'Balance: $rupeeSymbol${transactionHistory.balanceAmount?.toStringAsFixed(2)}'),
                if (transactionHistory.goldPrice != null)
                  Text(
                      'Gold Price: $rupeeSymbol${transactionHistory.goldPrice?.toStringAsFixed(2)}'),
                if (transactionHistory.qty != null)
                  Text(
                      'Quantity:${transactionHistory.qty?.toStringAsFixed(3)} gm'),

                // Text(
                //     'Total: $rupeeSymbol${transactionHistory.totalAmount.toStringAsFixed(2)}'),
                if (transactionHistory.installmentPaying != null)
                  // Text('Installment: ${transactionHistory.installmentPaying}'),
                  Text('Payment Method: ${transactionHistory.paymentMethod}'),
                Text('Type: ${transactionHistory.transactionType}'),
                Text('Status: ${transactionHistory.status}'),
              ],
            ),
            trailing: Icon(
              transactionHistory.status == 'Success'
                  ? Icons.check_circle
                  : Icons.error_outline,
              color: transactionHistory.status == 'Success'
                  ? Colors.green
                  : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
