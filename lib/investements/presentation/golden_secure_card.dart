import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/calculator/application/bloc/calculator_bloc.dart';
import 'package:rb_jewellers/calculator/infrastructure/gold_repository.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';
import 'package:rb_jewellers/investements/presentation/transaction_history_screen.dart';

import '../../app/domain/core/constants.dart';
import '../../app/presentation/widgets/app_button_widget.dart';
import '../application/bloc/investment_bloc.dart';
import '../domain/future_gold_savings_plan.dart';
import 'gold_booking_history_screen.dart';

class GoldenSecureCard extends StatefulWidget {
  const GoldenSecureCard({
    super.key,
    required this.myInvestment,
    required this.calculatorBloc,
  });

  final GoldenSecure myInvestment;
  final CalculatorBloc calculatorBloc;

  @override
  State<GoldenSecureCard> createState() => _GoldenSecureCardState();
}

class _GoldenSecureCardState extends State<GoldenSecureCard> {
  bool expandHistoryView = false;

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 12,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan',
                    style: largeTextDarkBold,
                  ),
                  SelectableText(
                    widget.myInvestment.planId,
                    style: standardTextDarkBold.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Text(
                widget.myInvestment.schemeType,
                style: standardTextDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth / 2 - 23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gold Booked',
                          style: largeTextDarkBold,
                        ),
                        Text(
                          '${widget.myInvestment.totalBookedGold.toStringAsFixed(3)} gm',
                          style: standardTextDark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2 - 23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Amount',
                          style: largeTextDarkBold,
                        ),
                        Text(
                          '$rupeeSymbol ${widget.myInvestment.totalBookingAmount.toStringAsFixed(2)}',
                          style: standardTextDark,
                        ),
                      ],
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Status',
                  //       style: largeTextDarkBold,
                  //     ),
                  //     Text(
                  //       widget.myInvestment.status,
                  //       style: standardTextDark,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth / 2 - 23,
                    child: Column(
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
                  ),
                  Column(
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
                ],
              ),
            ),
            // if (expandHistoryView)
            PaymentsAndBookings(
              myInvestment: widget.myInvestment,
            ),

            if (widget.myInvestment.adminComment.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 12),
                child: Text(
                  widget.myInvestment.adminComment,
                  style: standardTextDark,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Text(
                'Note: Hallmarking, Sankha, Pola, Socket, Stone, & Other Charges will be charged extra.',
                textAlign: TextAlign.center,
                style: standardTextDark.copyWith(color: Colors.red),
              ),
            ),

            Material(
              color: secondaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //   onTap: () async {
                  //     Get.to(() => GoldBookingHistoryScreen(
                  //           goldBookingHistoryList:
                  //               widget.myInvestment.goldBookingHistory ?? [],
                  //         ));
                  //     expandHistoryView = !expandHistoryView;
                  //     setState(() {});
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       right: 15,
                  //       left: 15,
                  //       top: 2,
                  //       bottom: 2,
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Gold Booking History',
                  //           style: smallTextDarkBold,
                  //         ),
                  //         expandHistoryView
                  //             ? const Icon(
                  //                 Icons.keyboard_arrow_right,
                  //               )
                  //             : const Icon(
                  //                 Icons.keyboard_arrow_right,
                  //               )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   width: 1,
                  //   height: 20,
                  //   color: Colors.black,
                  // ),
                  InkWell(
                    onTap: () async {
                      Get.to(() => TransactionHistoryScreen(
                            transactionHistoryList:
                                widget.myInvestment.transactionHistory ?? [],
                          ));
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
                ],
              ),
            )
          ],
        ),
    );
  }
}

class PaymentsAndBookings extends StatefulWidget {
  const PaymentsAndBookings({super.key, required this.myInvestment});

  final GoldenSecure myInvestment;

  @override
  State<PaymentsAndBookings> createState() => _PaymentsAndBookingsState();
}

class _PaymentsAndBookingsState extends State<PaymentsAndBookings> {
  double makingCharge = 0.0;
  double gstCharge = 0.0;
  double totalEstimatedAmount = 0.0;
  double goldWt = 0.0;

  bool showGoldRateDetails = false;

  final TextEditingController _amountController = TextEditingController();
  bool result = false;

  @override
  void initState() {
    _amountController.text = '';

    super.initState();
    result = isInCustomTimeRange();
    print('result >>>>>>> $result');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        makingCharge = widget.myInvestment.totalBookingAmount *
            ((double.tryParse(state.goldPrice.makingChargesPercent) ?? 1) /
                100);
        gstCharge = (widget.myInvestment.totalBookingAmount + makingCharge) *
            ((double.tryParse(state.goldPrice.gst) ?? 1) / 100);

        totalEstimatedAmount =
            widget.myInvestment.totalBookingAmount + makingCharge + gstCharge;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estimates',
                    style: largeTextDarkBold,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            insetPadding: const EdgeInsets.all(24),
                            actionsPadding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            title: SizedBox(
                              width: screenWidth - 48,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Estimates", style: largeTextDarkBold),
                                  const Divider(),
                                ],
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildEstimateRow("Quantity",
                                    "${widget.myInvestment.totalBookedGold} gm"),
                                _buildEstimateRow("Value",
                                    "₹${widget.myInvestment.totalBookingAmount}"),
                                _buildEstimateRow(
                                    "Making Charges (10%)", "₹$makingCharge"),
                                _buildEstimateRow("GST (3%)", "₹$gstCharge"),
                                const Divider(),
                                _buildEstimateRow(
                                  "Total Amount (Incl. GST)",
                                  "₹$totalEstimatedAmount",
                                  isBold: true,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'View more',
                      style: smallTextDarkBold.copyWith(color: secondaryColor),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth / 2 - 23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your approximate invoice value  ',
                          style: standardTextDarkBold,
                        ),
                        Text(
                          '$rupeeSymbol $totalEstimatedAmount',
                          style: standardTextDark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2 - 23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You have to pay at counter',
                          style: standardTextDarkBold,
                        ),
                        Text(
                          '$rupeeSymbol ${totalEstimatedAmount - widget.myInvestment.totalBookingAmount}',
                          style: standardTextDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            thickSpace,
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.myInvestment.status == 'Active') ...[
                    Text("Enter an amount to deposit now",
                        style: standardTextDarkBold),
                    thinSpace,
                    AppTextField(
                      autoFocus: false,
                      controller: _amountController,
                      autovalidateMode: AutovalidateMode.always,
                      textInputType: const TextInputType.numberWithOptions(),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      textStyle: largeTextDark,
                      errorStyle: smallText.copyWith(color: Colors.red),
                      hintText: 'Enter Amount',
                      onChangedCallBack: (v) {
                        if ((double.tryParse(v) ?? 0) >= 1000) {
                          double? amountEntered =
                              double.tryParse(_amountController.text);
                          double? goldPrice =
                              double.tryParse(state.goldPrice.price22);
                          if (amountEntered != null &&
                              amountEntered >= 1000 &&
                              goldPrice != null) {
                            goldWt = amountEntered / goldPrice;
                            setState(() {});
                          }
                        } else {
                          goldWt = 0.0;
                          setState(() {});
                        }
                      },
                      validateCallBack: (v) {
                        if (v != null &&
                            v.isNotEmpty &&
                            (double.tryParse(v) ?? 0) < 1000) {
                          return 'Minimum amount should be 1000';
                        }
                        return null;
                      },
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 15,
                          bottom: 15,
                        ),
                        child: Text(
                          rupeeSymbol,
                          style: largeTextDark,
                        ),
                      ),
                    ),
                    thickSpace,
                    if (_amountController.text.isNotEmpty && goldWt > 0) ...[
                      Text(
                        'Current Price: 22KT $rupeeSymbol${state.goldPrice.price22} /gm',
                        style: smallTextDarkBold,
                      ),
                      thickSpace,
                      thickSpace,
                      Text(
                        'Gold Weight: ${goldWt.toStringAsFixed(3)} gm',
                        style: standardTextDarkBold,
                      ),
                    ],
                    thickSpace,
                    if (widget.myInvestment.status != 'Completed' &&
                        widget.myInvestment.status != 'Closed' &&
                        widget.myInvestment.status != 'Matured')
                      AppButtonWidget(
                          onTap: () {
                            // if (_amountController.text.isEmpty) {
                            //   toastMessage('Enter a valid amount');
                            //   return;
                            // }

                            // Show Bottom Sheet for Payment Method Selection
                            showPaymentSelectionBottomSheet(
                              onPayOnline: () {
                                context.read<InvestmentBloc>().add(
                                      InvestmentEvent
                                          .payInstallmentOfGoldenSecure(
                                        widget.myInvestment,
                                        _amountController.text,
                                        double.parse(state.goldPrice.price22),
                                        goldWt,
                                      ),
                                    );
                                _amountController.clear();
                              },
                              onPayOnStore: () {
                                context.read<InvestmentBloc>().add(
                                      InvestmentEvent.payOnStore(PayOffline(
                                        id: '',
                                        planName: 'Golden Secure ',
                                        amount: double.parse(
                                            _amountController.text.toString()),
                                        planId: widget.myInvestment.planId,
                                        userId: AppUser.uniqueId.getOrCrash(),
                                        createdAt:
                                            DateTime.now().toIso8601String(),
                                        status: false,
                                        goldPrice: state.goldPrice.price22,
                                        qty: goldWt.toString(),
                                      )),
                                    );
                                // FocusScope.of(context).unfocus();
                                _amountController.clear();
                                toastMessage(
                                    'Please visit the store to make the payment.');
                              },
                            );
                          },
                          buttonText: 'Pay Now'),
                    thickSpace,
                  ],
                  if (widget.myInvestment.status == 'Completed' ||
                      widget.myInvestment.status == 'Closed') ...[
                    Center(
                      child: Text(
                          'SS is ${widget.myInvestment.status} Contact Jewellery for more details'),
                    ),
                    thinSpace,
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  /// Helper widget for row
  Widget _buildEstimateRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // bool isInRange() {
  //   final now = DateTime.now();
  //   final hour = now.hour;
  //   print('now $now');
  //   print('now $hour');
  //   // 10 PM to 11 AM means:
  //   // true if hour >= 22 (10 PM) OR hour < 11 (before 11 AM)
  //   return hour >= 22 || hour < 11;
  // }

  bool isInCustomTimeRange() {
    // final checkDateTime = DateTime.now();
    // // Extract only the date (year, month, day) from the input
    // DateTime baseDate = DateTime(checkDateTime.year, checkDateTime.month, checkDateTime.day);
    //
    // // Start = same day at 10:01 PM
    // DateTime start = DateTime(baseDate.year, baseDate.month, baseDate.day, 22, 1); // 22:01
    //
    //
    // print('start $start');
    // // End = next day at 11:00 AM
    // DateTime end = start.add(Duration(hours: 12, minutes: 59)); // till 11:00 AM next day
    // print('end $end');
    // return checkDateTime.isAfter(start) && checkDateTime.isBefore(end);

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

// Range 1: 00:00 AM – 11:00 AM
    final range1Start = today; // today at 00:00
    final range1End = DateTime(
        today.year, today.month, today.day, 11, 0); // today at 11:00 AM

// Range 2: 10:00 PM – 11:59 PM
    final range2Start =
        DateTime(today.year, today.month, today.day, 22, 0); // 22:00
    final range2End =
        DateTime(today.year, today.month, today.day, 23, 59); // 23:59

    bool isInRange = (now.isAfter(range1Start) && now.isBefore(range1End)) ||
        (now.isAfter(range2Start) && now.isBefore(range2End));

    print("🕒 Now: $now");
    print("✅ Is in range? $isInRange");

    return isInRange;
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

  Widget _gradientCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            gradientStartColor,
            gradientEndColor,
          ],
          // stops: [0.5, 1.0], // Position of the gradient transition
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
            offset: const Offset(0, 4), // Horizontal and vertical offset
            blurRadius: 10, // Softness of the shadow
            spreadRadius: 2, // Size of the shadow
          ),
        ],
      ),
      child: child,
    );
  }

}
