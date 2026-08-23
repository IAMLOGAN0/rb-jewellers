import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'dart:async';

class PaymentHandler {
  //old key
  // static const String keyId = 'rzp_live_YZGMhWQdILjaMV';
  //old key
  // static const String keyId = 'rzp_live_YZGMhWQdILjaMV';
  //new key
  static const String keyId = 'rzp_live_RQUO8EBgkLoDit';

  //test key
  // static const String keyId = 'rzp_test_RQUMpS0PypUkL1';
  static final Razorpay _razorpay = Razorpay();
  static Completer<PaymentStatus>? completer;

  static Future<PaymentStatus> startPayment(
      Map<String, dynamic> options) async {
    completer = Completer<PaymentStatus>();

    _razorpay.clear();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    _razorpay.open(options);

    return completer!.future;
  }

  // static startPayment(Map<String, dynamic> options) async {
  //   // Ensure there is no leftover completer
  //   completer = Completer<PaymentStatus>();

  //   // Clear previous event listeners (to avoid multiple triggers)
  //   _razorpay.clear();

  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  //   try {
  //     _razorpay.open(options);
  //     // ✅ Add a timeout to prevent infinite waiting
  //     await Future.delayed(const Duration(minutes: 15), () {
  //       if (!completer!.isCompleted) {
  //         completer?.complete(PaymentStatus(
  //           success: false,
  //           errorMessage: "Payment timed out",
  //         ));
  //       }
  //     });
  //   } catch (e) {
  //     log("Error opening Razorpay: $e");
  //     completer?.complete(PaymentStatus(
  //       success: false,
  //       errorMessage: "Error initializing payment: $e",
  //     ));
  //   }

  //   // Return future that resolves ONLY when payment is completed (success or failure)
  //   return await completer!.future;
  // }

  static void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log(response.toString());

    // Extract Razorpay payment details
    PaymentSuccessResponse paymentData =
        response; // jsonDecode(response.toString());

    log(paymentData.toString());

    completer?.complete(PaymentStatus(
      success: true,
      paymentId: response.paymentId,
      paymentMethod: response.orderId ?? "Unknown",
      transactionType: response.signature ?? "Online",
    ));
  }

  static void _handlePaymentError(PaymentFailureResponse response) {
    log('${response.message} ${response.toString()}');
    // Map<String, dynamic> paymentData = jsonDecode(response.toString());

    // log(paymentData.toString());
    completer?.complete(PaymentStatus(
      success: false,
      errorMessage: '${response.message} ${response.code.toString()}',
    ));
  }

  static void _handleExternalWallet(ExternalWalletResponse response) {
    log(response.toString());

    completer?.complete(PaymentStatus(
      success: true,
      paymentMethod: response.walletName ?? "External Wallet",
      transactionType: "Wallet",
      // errorMessage: "External Wallet Selected: ${response.walletName}",
    ));
  }
}

class PaymentStatus {
  final bool success;
  final String? paymentId;
  final String? paymentMethod;
  final String? transactionType;
  final String? errorMessage;

  PaymentStatus({
    required this.success,
    this.paymentId,
    this.paymentMethod,
    this.transactionType,
    this.errorMessage,
  });
}
