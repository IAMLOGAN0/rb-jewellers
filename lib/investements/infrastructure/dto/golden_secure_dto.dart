import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import '../../../profile/domain/value_objects.dart';
import '../../../profile/infrastructure/address_dto.dart';
import 'gold_booking_history_dto.dart';
import 'transaction_history_dto.dart';

part 'golden_secure_dto.freezed.dart';
part 'golden_secure_dto.g.dart';

@freezed
abstract class GoldenSecureDto with _$GoldenSecureDto {
  const GoldenSecureDto._();

  const factory GoldenSecureDto({
    required String id,
    required String planId,
    required String userId,
    required Map<String, dynamic> address,
    required String name,
    required String contactNumber,
    required String whatsappNumber,
    required String? emailAddress,
    required DateTime? dateOfBirth,
    required DateTime? dateOfAnniversary,
    required String schemeType,
    required int noOfInstallment,
    required double totalBookedGold,
    required double totalBookingAmount,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required String status,
    required String adminComment,
    required bool isTermsAndConditonsAccepted,
    required List<Map<String, dynamic>>? transactionHistory,
    required List<Map<String, dynamic>>? goldBookingHistory,
  }) = _GoldenSecureDto;

  factory GoldenSecureDto.fromJson(Map<String, dynamic> json) =>
      _$GoldenSecureDtoFromJson(json);

  factory GoldenSecureDto.fromDomain(GoldenSecure plan) {
    return GoldenSecureDto(
      id: plan.id,
      planId: plan.planId,
      userId: plan.userId,
      name: plan.name.getOrCrash(),
      address: AddressDto.fromDomain(plan.address).toJson(),
      contactNumber: plan.contactNumber.getOrCrash(),
      whatsappNumber: plan.whatsappNumber.getOrCrash(),
      emailAddress: plan.emailAddress?.getOrElse(''),
      dateOfBirth: plan.dateOfBirth,
      dateOfAnniversary: plan.dateOfAnniversary,
      schemeType: plan.schemeType,
      noOfInstallment: plan.noOfInstallment,
      totalBookedGold: plan.totalBookedGold,
      totalBookingAmount: plan.totalBookingAmount,
      startDate: plan.startDate,
      endDate: plan.endDate,
      createdAt: plan.createdAt,
      status: plan.status,
      adminComment: plan.adminComment,
      isTermsAndConditonsAccepted: plan.isTermsAndConditonsAccepted,
      transactionHistory: plan.transactionHistory == null
          ? []
          : plan.transactionHistory!
              .map((transaction) =>
                  TransactionHistoryDto.fromDomain(transaction).toJson())
              .toList(),
      goldBookingHistory: plan.goldBookingHistory == null
          ? []
          : plan.goldBookingHistory!
              .map((goldBooking) =>
                  GoldBookingHistoryDto.fromDomain(goldBooking).toJson())
              .toList(),
    );
  }

  GoldenSecure toDomain() {
    return GoldenSecure(
      id: id,
      planId: planId,
      userId: userId,
      name: Name(name),
      address:
          AddressDto.fromJson(Map<String, dynamic>.from(address)).toDomain(),
      contactNumber: PhoneNumber(contactNumber),
      whatsappNumber: PhoneNumber(whatsappNumber),
      emailAddress: EmailAddress(emailAddress ?? ''),
      dateOfBirth: dateOfBirth,
      dateOfAnniversary: dateOfAnniversary,
      schemeType: schemeType,
      noOfInstallment: noOfInstallment,
      totalBookedGold: totalBookedGold,
      totalBookingAmount: totalBookingAmount,
      startDate: startDate,
      endDate: endDate,
      createdAt: createdAt,
      status: status,
      adminComment: adminComment,
      isTermsAndConditonsAccepted: isTermsAndConditonsAccepted,
      transactionHistory: transactionHistory == null
          ? []
          : transactionHistory!
              .map((transaction) => TransactionHistoryDto.fromJson(
                      Map<String, dynamic>.from(transaction))
                  .toDomain())
              .toList(),
      goldBookingHistory: goldBookingHistory == null
          ? []
          : goldBookingHistory!
              .map((goldBooking) => GoldBookingHistoryDto.fromJson(
                      Map<String, dynamic>.from(goldBooking))
                  .toDomain())
              .toList(),
    );
  }

  factory GoldenSecureDto.fromFirestore(DocumentSnapshot doc) {
    return GoldenSecureDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}
