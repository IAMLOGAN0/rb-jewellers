import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';

import '../../app/presentation/widgets/app_button_widget.dart';
import '../application/bloc/investment_bloc.dart';
import '../domain/easy_gold_savings_plan.dart';
import 'transaction_history_screen.dart';

class EasyGoldSavingsPlanCard extends StatefulWidget {
  const EasyGoldSavingsPlanCard({
    super.key,
    required this.myInvestment,
  });

  final EasyGoldSavingsPlan myInvestment;

  @override
  State<EasyGoldSavingsPlanCard> createState() =>
      _EasyGoldSavingsPlanCardState();
}

class _EasyGoldSavingsPlanCardState extends State<EasyGoldSavingsPlanCard> {
  bool expandHistoryView = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime todayDateOnly = DateTime(now.year, now.month, now.day);
    DateTime? targetDate = widget.myInvestment.nextInstallmentDate;
    DateTime? endDate = targetDate != null
        ? DateTime(targetDate.year, targetDate.month, targetDate.day)
        : null;
    DateTime? startDate =
        endDate != null ? endDate.subtract(const Duration(days: 4)) : null;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
            offset: const Offset(0, 4), // Horizontal and vertical offset
            blurRadius: 10, // Softness of the shadow
            spreadRadius: 2, // Size of the shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12, bottom: 8),
            child: SelectableText(
              widget.myInvestment.planId,
              style: standardTextDarkBold.copyWith(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth / 2.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plan',
                        style: largeTextDarkBold,
                      ),
                      Text(
                        widget.myInvestment.schemeType,
                        style: standardTextDark,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: largeTextDarkBold,
                    ),
                    Text(
                      widget.myInvestment.status,
                      style: standardTextDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth / 2.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plan Amount',
                        style: largeTextDarkBold,
                      ),
                      Text(
                        '$rupeeSymbol ${widget.myInvestment.amount}',
                        style: standardTextDark,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Date',
                      style: largeTextDarkBold,
                    ),
                    Text(
                      formatDate(widget.myInvestment.startDate),
                      style: standardTextDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth / 2.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: largeTextDarkBold,
                      ),
                      Text(
                        formatDate(widget.myInvestment.endDate),
                        style: standardTextDark,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Payment Date',
                      style: largeTextDarkBold,
                    ),
                    Text(
                      widget.myInvestment.nextInstallmentDate == null
                          ? "Completed"
                          : formatDate(
                              widget.myInvestment.nextInstallmentDate!),
                      style: standardTextDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.myInvestment.nextInstallmentDate != null &&
              startDate != null &&
              endDate != null)
            if (widget.myInvestment.status != 'Completed' &&
                widget.myInvestment.status != 'Closed' &&
                (todayDateOnly.compareTo(startDate) >= 0 &&
                    todayDateOnly.compareTo(endDate) <= 0))
              /*(todayDateOnly.isAfter(startDate.subtract(const Duration(days: 1))) &&
    todayDateOnly.isBefore(endDate.add(const Duration(days: 1)))))*/

              /*(DateTime.now().isAfter(widget.myInvestment.nextInstallmentDate!.subtract(const Duration(days: 4)))) &&
                !DateTime.now().isBefore(widget.myInvestment.nextInstallmentDate!))*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButtonWidget(
                    onTap: () {
                      // Show Bottom Sheet for Payment Method Selection
                      showPaymentSelectionBottomSheet(
                        onPayOnline: () {
                          context.read<InvestmentBloc>().add(
                                InvestmentEvent
                                    .payInstallmentOfEasyGoldSavingsPlan(
                                  widget.myInvestment,
                                ),
                              );
                        },
                        onPayOnStore: () async {
                          context.read<InvestmentBloc>().add(
                                InvestmentEvent.payOnStore(PayOffline(
                                  id: '',
                                  planName: 'Easy Gold Savings Plan',
                                  amount: widget.myInvestment.amount / 12,
                                  planId: widget.myInvestment.planId,
                                  userId: AppUser.uniqueId.getOrCrash(),
                                  createdAt: DateTime.now().toIso8601String(),
                                  status: false,
                                  goldPrice: null,
                                  qty: null,
                                )),
                              );
                          // FocusScope.of(context).unfocus();

                          // final notificationData = {
                          //   'read': false,
                          //   'time_stamp': FieldValue.serverTimestamp(),
                          //   'title': 'Pay at counter made for Rs.${widget.myInvestment.amount / 12}',
                          //   'description':
                          //   'Online Payment made for Rs.${widget.myInvestment.amount / 12}, Scheme Type: Easy Gold Savings Plan, Plan ID- ${widget.myInvestment.planId}',
                          // };
                          //
                          // await FirebaseFirestore.instance
                          //     .collection('admin_notification')
                          //     .add(notificationData); // or .doc(pushKey).set(notificationData)

                          toastMessage(
                              'Please visit the store to make the payment.');
                        },
                      );
                    },
                    buttonText: 'Pay Now'),
              ),
          if (widget.myInvestment.status == 'Completed' ||
              widget.myInvestment.status == 'Closed') ...[
            Center(
              child: Text(
                  'SS is ${widget.myInvestment.status}, Contact Jewellery for more details'),
            ),
            thinSpace,
          ],
          thickSpace,
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 12),
            child: Text(
              widget.myInvestment.adminComment,
              style: standardTextDark,
            ),
          ),
          Material(
            color: secondaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                Get.to(
                  () => TransactionHistoryScreen(
                      transactionHistoryList:
                          widget.myInvestment.transactionHistory),
                );
                expandHistoryView = !expandHistoryView;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  top: 2,
                  bottom: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style: smallTextDarkBold,
                    ),
                    expandHistoryView
                        ? const Icon(
                            Icons.keyboard_arrow_right,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_right,
                          )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showPaymentSelectionBottomSheet(
      {required Function onPayOnline, required Function onPayOnStore}) {
    Get.bottomSheet(
      Container(
        padding:
            const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 70),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                AppButtonWidget(
                  onTap: () {
                    onPayOnline();
                    Get.back(); // Close bottom sheet
                  },
                  buttonText: "Pay Online",
                ),
                thickSpace,
                AppButtonWidget(
                  onTap: () {
                    onPayOnStore();
                    Get.back(); // Close bottom sheet
                  },
                  color: Colors.red,
                  buttonText: "Pay at Counter",
                ),
              ],
            ),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }
}
