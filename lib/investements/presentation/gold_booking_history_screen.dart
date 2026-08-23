import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';

import '../domain/gold_booking_history.dart';

class GoldBookingHistoryScreen extends StatelessWidget {
  const GoldBookingHistoryScreen({
    super.key,
    required this.goldBookingHistoryList,
  });

  final List<GoldBookingHistory> goldBookingHistoryList;

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
          'Gold Booking History',
          style: titleText,
        ),
        backgroundColor: secondaryColor, // Customize as needed
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: goldBookingHistoryList.length,
        itemBuilder: (context, index) {
          GoldBookingHistory transactionHistory = goldBookingHistoryList[index];

          return ListTile(
            // selectedColor: secondaryColor.shade200,
            // tileColor: secondaryColor.shade200,
            // focusColor: secondaryColor.shade200,
            // selectedTileColor: secondaryColor.shade200,
            shape: const RoundedRectangleBorder(side: BorderSide(width: .5)),
            title: Text(''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Date: ${transactionHistory.transactionDate.toLocal().toString().split(' ')[0]}'),
                Text(
                    'Booked Qty: ${transactionHistory.bookedQty.toStringAsFixed(3)} gm'),
                Text(
                    'Gold Rate: $rupeeSymbol${transactionHistory.goldRate.toStringAsFixed(2)}'),
                Text(
                    'Total Price: $rupeeSymbol${transactionHistory.totalAmount.toStringAsFixed(2)}'),
                Text('Status: ${transactionHistory.status}'),
              ],
            ),
            trailing: Icon(
              transactionHistory.status == 'Accepted'
                  ? Icons.check_circle
                  : transactionHistory.status == 'Rejected'
                      ? Icons.close
                      : Icons.error_outline,
              color: transactionHistory.status == 'Accepted'
                  ? Colors.green
                  : transactionHistory.status == 'Rejected'
                      ? Colors.red
                      : Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
