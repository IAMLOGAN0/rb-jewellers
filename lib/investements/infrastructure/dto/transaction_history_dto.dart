import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/transaction_history.dart';

part 'transaction_history_dto.freezed.dart';
part 'transaction_history_dto.g.dart';

@freezed
abstract class TransactionHistoryDto with _$TransactionHistoryDto {
  const TransactionHistoryDto._();

  const factory TransactionHistoryDto({
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
  }) = _TransactionHistoryDto;

  factory TransactionHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryDtoFromJson(json);

  // Conversion from Domain (TransactionHistory) to DTO
  factory TransactionHistoryDto.fromDomain(TransactionHistory transaction) {
    return TransactionHistoryDto(
      transactionId: transaction.transactionId,
      transactionDate: transaction.transactionDate,
      amount: transaction.amount,
      goldPrice: transaction.goldPrice,
      noOfInstallment: transaction.noOfInstallment,
      qty: transaction.qty,
      balanceAmount: transaction.balanceAmount,
      totalAmount: transaction.totalAmount,
      installmentPaying: transaction.installmentPaying,
      paymentMethod: transaction.paymentMethod,
      transactionType: transaction.transactionType,
      status: transaction.status,
      description: transaction.description,
      userId: transaction.userId,
      planId: transaction.planId,
    );
  }

  // Conversion from DTO to Domain (TransactionHistory)
  TransactionHistory toDomain() {
    return TransactionHistory(
      transactionId: transactionId,
      transactionDate: transactionDate,
      amount: amount,
      goldPrice: goldPrice,
      noOfInstallment: noOfInstallment,
      qty: qty,
      balanceAmount: balanceAmount,
      totalAmount: totalAmount,
      installmentPaying: installmentPaying,
      paymentMethod: paymentMethod,
      transactionType: transactionType,
      status: status,
      description: description,
      userId: userId,
      planId: planId,
    );
  }
}
