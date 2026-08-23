import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_booking_history.freezed.dart';

@freezed
abstract class GoldBookingHistory implements _$GoldBookingHistory {
  const GoldBookingHistory._();

  const factory GoldBookingHistory(
      {required DateTime transactionDate,
      required double bookedQty,
      required double goldRate,
      required double totalAmount,
      required String status}) = _GoldBookingHistory;

  factory GoldBookingHistory.empty() => GoldBookingHistory(
      transactionDate: DateTime.now(),
      bookedQty: 0.0,
      goldRate: 0.0,
      totalAmount: 0.0,
      status: 'Pending');
}
