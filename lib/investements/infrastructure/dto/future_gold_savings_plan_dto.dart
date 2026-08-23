import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/calculator/infrastructure/gold_price_dto.dart';
import '../../../profile/domain/value_objects.dart';
import '../../domain/future_gold_savings_plan.dart';
import '../../../profile/infrastructure/address_dto.dart';
import 'gold_booking_history_dto.dart';
import 'transaction_history_dto.dart';

part 'future_gold_savings_plan_dto.freezed.dart';
part 'future_gold_savings_plan_dto.g.dart';

@freezed
abstract class FutureGoldSavingsPlanDto with _$FutureGoldSavingsPlanDto {
  const FutureGoldSavingsPlanDto._();

  const factory FutureGoldSavingsPlanDto({
    required String id,
    required String planId,
    required String userId,
    required Map address,
    required String name,
    required String contactNumber,
    required String whatsappNumber,
    required String emailAddress,
    required DateTime dateOfBirth,
    required DateTime? dateOfAnniversary,
    required String schemeType,
    required double amountPaid,
    required double balanceAmount,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required bool goldBookingStatus,
    required String status,
    required String adminComment,
    required bool isGoldPriceBooked,
    required double goldQuantityBooked,
    required double totalPriceForBookedQty,
    required Map<String, dynamic> goldPrice,
    required int noOfInstallmentsPaid,
    required bool isTermsAndConditonsAccepted,
    required List<Map> transactionHistory,
    required List<Map> goldBookingHistory,
  }) = _FutureGoldSavingsPlanDto;

  factory FutureGoldSavingsPlanDto.fromJson(Map<String, dynamic> json) =>
      _$FutureGoldSavingsPlanDtoFromJson(json);

  // Conversion from Domain (FutureGoldSavingsPlan) to DTO
  factory FutureGoldSavingsPlanDto.fromDomain(FutureGoldSavingsPlan plan) {
    return FutureGoldSavingsPlanDto(
      id: plan.id,
      planId: plan.planId,
      userId: plan.userId,
      name: plan.name.getOrCrash(),
      address: AddressDto.fromDomain(plan.address).toJson(),
      contactNumber: plan.contactNumber.getOrCrash(),
      whatsappNumber: plan.whatsappNumber.getOrCrash(),
      emailAddress: plan.emailAddress.getOrElse(''),
      dateOfBirth: plan.dateOfBirth,
      dateOfAnniversary: plan.dateOfAnniversary,
      schemeType: plan.schemeType,
      amountPaid: plan.amountPaid,
      balanceAmount: plan.balanceAmount,
      startDate: plan.startDate,
      endDate: plan.endDate,
      createdAt: plan.createdAt,
      goldBookingStatus: plan.goldBookingStatus,
      status: plan.status,
      adminComment: plan.adminComment,
      isGoldPriceBooked: plan.isGoldPriceBooked,
      goldQuantityBooked: plan.goldQuantityBooked,
      totalPriceForBookedQty: plan.totalPriceForBookedQty,
      goldPrice: GoldPriceDto.fromDomain(plan.goldPrice).toJson(),
      noOfInstallmentsPaid: plan.noOfInstallmentsPaid,
      isTermsAndConditonsAccepted: plan.isTermsAndConditonsAccepted,
      transactionHistory: plan.transactionHistory
          .map((transaction) =>
              TransactionHistoryDto.fromDomain(transaction).toJson())
          .toList(),
      goldBookingHistory: plan.goldBookingHistory
          .map((transaction) =>
          GoldBookingHistoryDto.fromDomain(transaction).toJson())
          .toList(),
    );
  }

  // Conversion from DTO to Domain (FutureGoldSavingsPlan)
  FutureGoldSavingsPlan toDomain() {
    return FutureGoldSavingsPlan(
      id: id,
      planId: planId,
      userId: userId,
      name: Name(name),
      address:
          AddressDto.fromJson(Map<String, dynamic>.from(address)).toDomain(),
      contactNumber: PhoneNumber(contactNumber),
      whatsappNumber: PhoneNumber(whatsappNumber),
      emailAddress: EmailAddress(emailAddress),
      dateOfBirth: dateOfBirth,
      dateOfAnniversary: dateOfAnniversary,
      schemeType: schemeType,
      amountPaid: amountPaid,
      balanceAmount: balanceAmount,
      startDate: startDate,
      endDate: endDate,
      createdAt: createdAt,
      goldBookingStatus: goldBookingStatus,
      status: status,
      adminComment: adminComment,
      isGoldPriceBooked: isGoldPriceBooked,
      goldQuantityBooked: goldQuantityBooked,
      totalPriceForBookedQty: totalPriceForBookedQty,
      goldPrice: GoldPriceDto.fromJson(goldPrice).toDomain(),
      noOfInstallmentsPaid: noOfInstallmentsPaid,
      isTermsAndConditonsAccepted: isTermsAndConditonsAccepted,
      transactionHistory: transactionHistory
          .map((transaction) => TransactionHistoryDto.fromJson(
                  Map<String, dynamic>.from(transaction))
              .toDomain())
          .toList(),
      goldBookingHistory: goldBookingHistory
          .map((goldBooking) => GoldBookingHistoryDto.fromJson(
                  Map<String, dynamic>.from(goldBooking))
              .toDomain())
          .toList(),
    );
  }

  factory FutureGoldSavingsPlanDto.fromFirestore(DocumentSnapshot doc) {
    return FutureGoldSavingsPlanDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}
