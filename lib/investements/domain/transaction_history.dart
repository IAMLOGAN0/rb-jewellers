import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history.freezed.dart';

@freezed
abstract class TransactionHistory implements _$TransactionHistory {
  const TransactionHistory._();

  const factory TransactionHistory({
    required String transactionId,
    required DateTime transactionDate,
    required double amount,
    required double? goldPrice,
    required double? noOfInstallment,
    required double? qty,
    required double? balanceAmount,
    required double? totalAmount,
    required int? installmentPaying,
    required String paymentMethod,
    required String transactionType,
    required String status,
    required String? description,
    required String? userId,
    required String planId,
  }) = _TransactionHistory;

  factory TransactionHistory.empty() => TransactionHistory(
        transactionId: '',
        transactionDate: DateTime.now(),
        amount: 0.0,
        goldPrice: 0.0,
        noOfInstallment: 0,
        qty: 0.0,
        paymentMethod: '',
        transactionType: '',
        status: '',
        description: '',
        userId: '',
        balanceAmount: 0.0,
        totalAmount: 0.0,
        installmentPaying: 0,
        planId: '',
      );
}
