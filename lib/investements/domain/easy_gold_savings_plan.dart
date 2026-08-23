import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/profile/domain/address.dart';
import 'package:rb_jewellers/profile/domain/value_objects.dart';

import 'transaction_history.dart';

part 'easy_gold_savings_plan.freezed.dart';

@freezed
abstract class EasyGoldSavingsPlan implements _$EasyGoldSavingsPlan {
  const EasyGoldSavingsPlan._();

  const factory EasyGoldSavingsPlan({
    required String id,
    required String planId,
    required String userId,
    required Name name,
    required Address address,
    required PhoneNumber contactNumber,
    required PhoneNumber whatsappNumber,
    required EmailAddress emailAddress,
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
    required List<TransactionHistory> transactionHistory,
  }) = _EasyGoldSavingsPlan;

  factory EasyGoldSavingsPlan.empty() => EasyGoldSavingsPlan(
        id: '',
        planId: 'INVRBEGSP-',
        userId: AppUser.uniqueId.getOrCrash(),
        name: Name(AppUser.name.value.getOrElse(() => '')),
        amount: 0.0,
        status: 'Active',
        adminComment: '',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 365)),
        nextInstallmentDate: DateTime.now(),
        transactionHistory: [],
        address: Address.empty(),
        contactNumber: PhoneNumber(
            AppUser.phoneNumber.value.getOrElse(() => '').split('+91').last),
        whatsappNumber: PhoneNumber(''),
        emailAddress: EmailAddress(''),
        dateOfBirth: AppUser.dateOfBirth ?? DateTime.now(),
        dateOfAnniversary: AppUser.anniversaryDate,
        schemeType: 'Golden Assurance',
        createdAt: DateTime.now(),
        noOfInstallmentsPaid: 1,
        balanceAmount: 0.0,
        isTermsAndConditonsAccepted: false,
      );
}

extension EasyGoldSavingsPlanX on EasyGoldSavingsPlan {
  bool isValid() {
    // Validate required string fields
    // final bool isUserIdValid = u
    final bool isNameValid = name.value.fold((l) => false, (r) => r.isNotEmpty);
    final bool isAddressValid =
        address.isValid(); // Assuming Address has its own validation logic
    final bool isContactNumberValid =
        contactNumber.value.fold((l) => false, (r) => r.isNotEmpty);
    final bool isWhatsappNumberValid =
        whatsappNumber.value.fold((l) => false, (r) => r.isNotEmpty);
    // final bool isEmailValid = emailAddress.value
    //     .fold((l) => false, (r) => r.isNotEmpty && r.contains('@'));

    // Validate numeric and date fields
    final bool isAmountValid = amount >= 1000.0;
    final bool isBalanceAmountValid = balanceAmount >= 0.0;
    final bool isNoOfInstallmentsValid = noOfInstallmentsPaid >= 0;
    final bool areDatesValid =
        startDate.isBefore(endDate) && createdAt.isBefore(DateTime.now());

    // Check terms and conditions accepted
    final bool areTermsAccepted = isTermsAndConditonsAccepted;

    // Combine all validations
    return isNameValid &&
        isAddressValid &&
        isContactNumberValid &&
        isWhatsappNumberValid &&
        // isEmailValid &&
        isAmountValid &&
        isBalanceAmountValid &&
        isNoOfInstallmentsValid &&
        areDatesValid &&
        areTermsAccepted;
  }
}
