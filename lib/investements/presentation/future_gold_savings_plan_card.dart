import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/calculator/application/bloc/calculator_bloc.dart';
import 'package:rb_jewellers/calculator/infrastructure/gold_repository.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';
import 'package:rb_jewellers/investements/presentation/transaction_history_screen.dart';

import '../../app/domain/core/constants.dart';
import '../../app/presentation/widgets/app_button_widget.dart';
import '../application/bloc/investment_bloc.dart';
import '../domain/future_gold_savings_plan.dart';
import 'gold_booking_history_screen.dart';

class FutureGoldSavingsPlanCard extends StatefulWidget {
  const FutureGoldSavingsPlanCard({
    super.key,
    required this.myInvestment,
    required this.calculatorBloc,
  });

  final FutureGoldSavingsPlan myInvestment;
  final CalculatorBloc calculatorBloc;

  @override
  State<FutureGoldSavingsPlanCard> createState() =>
      _FutureGoldSavingsPlanCardState();
}

class _FutureGoldSavingsPlanCardState extends State<FutureGoldSavingsPlanCard> {
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
                    width: screenWidth / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount Paid',
                          style: largeTextDarkBold,
                        ),
                        Text(
                          '$rupeeSymbol ${widget.myInvestment.amountPaid}',
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
                    width: screenWidth / 2,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      Get.to(() => GoldBookingHistoryScreen(
                            goldBookingHistoryList:
                                widget.myInvestment.goldBookingHistory,
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
                            'Gold Booking History',
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
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () async {
                      Get.to(() => TransactionHistoryScreen(
                            transactionHistoryList:
                                widget.myInvestment.transactionHistory,
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

  final FutureGoldSavingsPlan myInvestment;

  @override
  State<PaymentsAndBookings> createState() => _PaymentsAndBookingsState();
}

class _PaymentsAndBookingsState extends State<PaymentsAndBookings> {
  double calculateQty = 0.0;
  double calculatedPrice = 0.0;
  bool showGoldRateDetails = false;

  final TextEditingController _amountController = TextEditingController();
  bool result = false;

  @override
  void initState() {
    if (widget.myInvestment.balanceAmount != 0.0) {
      _amountController.text =
          '' /*widget.myInvestment.balanceAmount.toString()*/;
    } else {
      _amountController.text = '';
    }
    super.initState();
    result = isInCustomTimeRange();
    print('result >>>>>>> $result');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (!widget.myInvestment.isGoldPriceBooked) {
          context.read<CalculatorBloc>().add(
                CalculatorEvent.calculateGoldQuantity(
                  ((widget.myInvestment.amountPaid / 60) * 100).toString(),
                ),
              );
        }

        return Column(
          children: [
            thickSpace,
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!widget.myInvestment.isGoldPriceBooked ||
                      (widget.myInvestment.isGoldPriceBooked &&
                          widget.myInvestment.balanceAmount > 0)) ...[
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
                      validateCallBack: (v) {
                        if (widget.myInvestment.isGoldPriceBooked &&
                            v != null &&
                            v.isNotEmpty &&
                            double.parse(v) >
                                widget.myInvestment.balanceAmount) {
                          return 'Amount cannot be greater than balance amount';
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
                    if (widget.myInvestment.isGoldPriceBooked) ...[
                      Text(
                          "Maximum Payable Amount: $rupeeSymbol${widget.myInvestment.balanceAmount.toStringAsFixed(2)}",
                          style: standardTextDark),
                      thickSpace,
                    ],
                    if (widget.myInvestment.status != 'Completed' &&
                        widget.myInvestment.status != 'Closed' &&
                        widget.myInvestment.status != 'Matured')
                      AppButtonWidget(
                          onTap: () {
                            if (_amountController.text.isEmpty) {
                              toastMessage('Enter a valid amount');
                              return;
                            }
                            if (widget.myInvestment.isGoldPriceBooked &&
                                double.parse(_amountController.text) >
                                    widget.myInvestment.balanceAmount) {
                              toastMessage(
                                  'Amount cannot be greater than balance amount');
                              return;
                            }

                            // Show Bottom Sheet for Payment Method Selection
                            showPaymentSelectionBottomSheet(
                              onPayOnline: () {
                                context.read<InvestmentBloc>().add(
                                      InvestmentEvent
                                          .payInstallmentOfFutureGoldSavingsPlan(
                                        widget.myInvestment,
                                        _amountController.text,
                                      ),
                                    );
                              },
                              onPayOnStore: () {
                                context.read<InvestmentBloc>().add(
                                      InvestmentEvent.payOnStore(PayOffline(
                                        id: '',
                                        planName: 'Gold Future Advance Plan',
                                        amount: double.parse(
                                            _amountController.text.toString()),
                                        planId: widget.myInvestment.planId,
                                        userId: AppUser.uniqueId.getOrCrash(),
                                        createdAt:
                                            DateTime.now().toIso8601String(),
                                        status: false,
                                        goldPrice: null,
                                        qty: null,
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
                  if (widget.myInvestment.isGoldPriceBooked) ...[
                    Center(
                      child: Text(
                          'You have booked ${widget.myInvestment.goldQuantityBooked.toStringAsFixed(3)}gm gold for price $rupeeSymbol${widget.myInvestment.totalPriceForBookedQty} on ${formatDate(widget.myInvestment.goldPrice.dateTime)} at the rate of $rupeeSymbol${widget.myInvestment.goldPrice.price22}/gm'),
                    ),
                    thinSpace,
                  ],
                  if (!widget.myInvestment.isGoldPriceBooked) ...[
                    thickSpace,
                    widget.myInvestment.status != 'Matured'
                        ? Column(
                            children: [
                              result
                                  ? widget.myInvestment.goldBookingStatus
                                      ? Container()
                                      : AppButtonWidget(
                                          onTap: () {},
                                          buttonText: 'Book Gold Price',
                                          isEnabled: false,
                                          buttonTextColor: Colors.black,
                                          color: Colors.grey.shade600)
                                  : AppButtonWidget(
                                      onTap: () {
                                        // print('calculatedPrice >> ${double.parse(state.calculatedPrice.toString())}');
                                        if (double.parse(state.calculatedPrice
                                                .toString()) >
                                            0) {
                                          final parentContext = context;
                                          showDialog(
                                            context: parentContext,
                                            barrierDismissible: false,
                                            // Prevent dismiss on outside tap
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            // Background overlay color
                                            builder: (dialogContext) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                backgroundColor: Colors.white,
                                                // Dialog background
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                          'Book Gold Price',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      const SizedBox(
                                                          height: 10),
                                                      Text(
                                                          'Do you want to book ${double.tryParse(state.calculatedQuantity)?.toStringAsFixed(3)} gm of gold for ₹${double.tryParse(state.calculatedPrice)?.toStringAsFixed(2)}',
                                                          // 'Are you sure you want to book ${state.calculatedQuantity}gm of gold for ₹${(state.calculatedPrice)}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      18)),
                                                      const SizedBox(
                                                          height: 20),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              Navigator.of(
                                                                      dialogContext)
                                                                  .pop();
                                                              parentContext
                                                                  .read<
                                                                      InvestmentBloc>()
                                                                  .add(InvestmentEvent
                                                                      .bookGoldPriceForFutureGold(
                                                                    widget
                                                                        .myInvestment
                                                                        .copyWith(
                                                                      isGoldPriceBooked:
                                                                          false,
                                                                      goldPrice:
                                                                          state
                                                                              .goldPrice,
                                                                      goldQuantityBooked:
                                                                          double.parse(
                                                                              state.calculatedQuantity),
                                                                      totalPriceForBookedQty:
                                                                          double.parse(
                                                                              state.calculatedPrice),
                                                                    ),
                                                                  ));

                                                              /*Navigator.of(
                                                                  dialogContext)
                                                                  .pop();
                                                              parentContext.read<
                                                                  InvestmentBloc>()
                                                                  .add(InvestmentEvent
                                                                  .bookGoldPriceForFutureGold(
                                                                widget
                                                                    .myInvestment
                                                                    .copyWith(
                                                                  isGoldPriceBooked: true,
                                                                  goldPrice: state.goldPrice,
                                                                  goldQuantityBooked: double.parse(state.calculatedQuantity),
                                                                  totalPriceForBookedQty: double.parse(state.calculatedPrice),
                                                                ),
                                                              ));*/
                                                              // final goldBookingConfirmation = {
                                                              //   "goldPrice": {
                                                              //     "dateTime": "",
                                                              //     "gst": "",
                                                              //     "id": "",
                                                              //     "makingChargesPercent": "",
                                                              //     "price18": "",
                                                              //     "price22": "",
                                                              //     "price24": "",
                                                              //     "title": "",
                                                              //     "title18": "",
                                                              //     "title22": "",
                                                              //     "title24": "",
                                                              //   },
                                                              //   'status': "Pending",
                                                              //   'goldQuantityBooked': double.parse(state.calculatedQuantity),
                                                              //   'plan_id': widget.myInvestment.planId,
                                                              // };
                                                              //
                                                              // await FirebaseFirestore.instance
                                                              //     .collection('gold_booking_confirmation')
                                                              //     .add(goldBookingConfirmation);
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              height: 30,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8))),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                    "Yes",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      dialogContext)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              height: 30,
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8))),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                    "No",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      buttonText: 'Book Gold Price',
                                    ),
                              result
                                  ? const Center(
                                      child: Text(
                                          "You can't Book Gold Price between 10:00 PM To 11:00 AM"),
                                    )
                                  : Container(),
                            ],
                          )
                        : const Center(
                            child: Text(
                              'This plan has been matured',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                    thickSpace,
                    Center(
                      child: Text(
                          'You can now book up to ${double.tryParse(state.calculatedQuantity)?.toStringAsFixed(3)}gm gold for price $rupeeSymbol${double.tryParse(state.calculatedPrice)?.toStringAsFixed(2)}'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        InkWell(
                            onTap: () {
                              showGoldRateDetails = !showGoldRateDetails;
                              setState(() {});
                            },
                            child: showGoldRateDetails
                                ? Text(
                                    'Click to Hide Details..',
                                    style: smallTextDarkBold,
                                  )
                                : Text(
                                    'Click to Show More Details..',
                                    style: smallTextDarkBold,
                                  )),
                      ],
                    ),
                    thinSpace,
                    if (showGoldRateDetails)
                      _gradientCard(Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text('Quantity', style: largeText),
                              ),
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text(
                                  '${double.tryParse(state.calculatedQuantity)?.toStringAsFixed(3)}gm',
                                  textAlign: TextAlign.end,
                                  style: largeTextBold,
                                ),
                              ),
                            ],
                          ),
                          thickSpace,
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text('Value', style: largeText),
                              ),
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text(
                                  '$rupeeSymbol ${((double.tryParse(state.goldPrice.price22) ?? 0) * (double.tryParse(state.calculatedQuantity) ?? 0)).toStringAsFixed(2)}',
                                  textAlign: TextAlign.end,
                                  style: largeTextBold,
                                ),
                              ),
                            ],
                          ),
                          thickSpace,
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text(
                                  'Making Charges(${state.goldPrice.makingChargesPercent}%)',
                                  style: largeText,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text(
                                  '$rupeeSymbol${((double.tryParse(state.calculatedQuantity) ?? 0) * (double.tryParse(state.calculatedMakingCharges) ?? 0)).toStringAsFixed(2)}',
                                  textAlign: TextAlign.end,
                                  style: largeTextBold,
                                ),
                              ),
                            ],
                          ),
                          thickSpace,
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text('GST(${state.goldPrice.gst}%)',
                                    style: largeText),
                              ),
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text(
                                  '$rupeeSymbol${double.tryParse(state.calculatedGST)?.toStringAsFixed(2)}',
                                  textAlign: TextAlign.end,
                                  style: largeTextBold,
                                ),
                              ),
                            ],
                          ),
                          thickSpace,
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text('Total Amount(Includes GST)',
                                    style: largeTextBold),
                              ),
                              SizedBox(
                                width: screenWidth / 2 - 46,
                                child: Text(
                                  '$rupeeSymbol${double.tryParse(state.calculatedPrice)?.toStringAsFixed(0)}',
                                  textAlign: TextAlign.end,
                                  style: largeTextBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  ],
                ],
              ),
            ),
          ],
        );
      },
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
