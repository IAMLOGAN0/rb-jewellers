import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/gold_booking_history.dart';

part 'gold_booking_history_dto.freezed.dart';
part 'gold_booking_history_dto.g.dart';

@freezed
abstract class GoldBookingHistoryDto with _$GoldBookingHistoryDto {
  const GoldBookingHistoryDto._();

  const factory GoldBookingHistoryDto({
    required DateTime transactionDate,
    required double bookedQty,
    required double goldRate,
    required double totalAmount,
    required String status,
  }) = _GoldBookingHistoryDto;

  factory GoldBookingHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$GoldBookingHistoryDtoFromJson(json);

  // Conversion from Domain (TransactionHistory) to DTO
  factory GoldBookingHistoryDto.fromDomain(GoldBookingHistory goldBooking) {
    return GoldBookingHistoryDto(
      transactionDate: goldBooking.transactionDate,
      bookedQty: goldBooking.bookedQty,
      goldRate: goldBooking.goldRate,
      totalAmount: goldBooking.totalAmount,
      status: goldBooking.status,

    );
  }

  // Conversion from DTO to Domain (TransactionHistory)
  GoldBookingHistory toDomain() {
    return GoldBookingHistory(
      transactionDate: transactionDate,
      bookedQty: bookedQty,
      goldRate: goldRate,
      totalAmount: totalAmount,
      status: status);
}
}
