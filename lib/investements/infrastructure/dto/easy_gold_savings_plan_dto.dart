import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../profile/domain/value_objects.dart';
import '../../domain/easy_gold_savings_plan.dart';
import '../../../profile/infrastructure/address_dto.dart';
import 'transaction_history_dto.dart';

part 'easy_gold_savings_plan_dto.freezed.dart';
part 'easy_gold_savings_plan_dto.g.dart';

@freezed
abstract class EasyGoldSavingsPlanDto with _$EasyGoldSavingsPlanDto {
  const EasyGoldSavingsPlanDto._();

  const factory EasyGoldSavingsPlanDto({
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
    required double amount,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime? nextInstallmentDate,
    required DateTime createdAt,
    required String status,
    required String adminComment,
    required int noOfInstallmentsPaid,
    required double balanceAmount,
    required bool isTermsAndConditonsAccepted,
    required List<Map> transactionHistory,
  }) = _EasyGoldSavingsPlanDto;

  factory EasyGoldSavingsPlanDto.fromJson(Map<String, dynamic> json) =>
      _$EasyGoldSavingsPlanDtoFromJson(json);

  // Conversion from Domain (EasyGoldSavingsPlan) to DTO
  factory EasyGoldSavingsPlanDto.fromDomain(EasyGoldSavingsPlan plan) {
    return EasyGoldSavingsPlanDto(
      id: '',
      planId: plan.planId,
      userId: plan.userId,
      name: plan.name
          .getOrCrash(), // Assuming `getOrCrash` gets the raw value from `ValueObject`
      address: AddressDto.fromDomain(plan.address).toJson(),
      contactNumber: plan.contactNumber.getOrCrash(),
      whatsappNumber: plan.whatsappNumber.getOrCrash(),
      emailAddress: plan.emailAddress.getOrElse(''),
      dateOfBirth: plan.dateOfBirth,
      dateOfAnniversary: plan.dateOfAnniversary,
      schemeType: plan.schemeType,
      amount: plan.amount,
      startDate: plan.startDate,
      endDate: plan.endDate,
      nextInstallmentDate: plan.nextInstallmentDate,
      createdAt: plan.createdAt,
      status: plan.status,
      adminComment: plan.adminComment,
      noOfInstallmentsPaid: plan.noOfInstallmentsPaid,
      balanceAmount: plan.balanceAmount,
      isTermsAndConditonsAccepted: plan.isTermsAndConditonsAccepted,
      transactionHistory: plan.transactionHistory
          .map((transaction) =>
              TransactionHistoryDto.fromDomain(transaction).toJson())
          .toList(),
    );
  }

  // Conversion from DTO to Domain (EasyGoldSavingsPlan)
  EasyGoldSavingsPlan toDomain() {
    return EasyGoldSavingsPlan(
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
      amount: amount,
      startDate: startDate,
      endDate: endDate,
      nextInstallmentDate: nextInstallmentDate,
      createdAt: createdAt,
      status: status,
      adminComment: adminComment,
      noOfInstallmentsPaid: noOfInstallmentsPaid,
      balanceAmount: balanceAmount,
      isTermsAndConditonsAccepted: isTermsAndConditonsAccepted,
      transactionHistory: transactionHistory
          .map((transaction) => TransactionHistoryDto.fromJson(
                  Map<String, dynamic>.from(transaction))
              .toDomain())
          .toList(),
    );
  }

  factory EasyGoldSavingsPlanDto.fromFirestore(DocumentSnapshot doc) {
    return EasyGoldSavingsPlanDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}
