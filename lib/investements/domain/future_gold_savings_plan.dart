import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/calculator/domain/gold_price.dart';
import 'package:rb_jewellers/profile/domain/address.dart';
import 'package:rb_jewellers/profile/domain/value_objects.dart';

import 'gold_booking_history.dart';
import 'transaction_history.dart';

part 'future_gold_savings_plan.freezed.dart';

@freezed
abstract class FutureGoldSavingsPlan implements _$FutureGoldSavingsPlan {
  const FutureGoldSavingsPlan._();

  const factory FutureGoldSavingsPlan({
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
    required double amountPaid,
    required double balanceAmount,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required String status,
    required String adminComment,
    required bool isGoldPriceBooked,
    required bool goldBookingStatus,
    required double goldQuantityBooked,
    required double totalPriceForBookedQty,
    required GoldPrice goldPrice,
    required int noOfInstallmentsPaid,
    required bool isTermsAndConditonsAccepted,
    required List<TransactionHistory> transactionHistory,
    required List<GoldBookingHistory> goldBookingHistory,
  }) = _FutureGoldSavingsPlan;

  factory FutureGoldSavingsPlan.empty() => FutureGoldSavingsPlan(
        id: '',
        planId: 'INVRBGFAP-',
        userId: AppUser.uniqueId.value.getOrElse(
          () => '',
        ),
        name: Name(AppUser.name.value.getOrElse(() => '')),
        amountPaid: 0.0,
        balanceAmount: 0.0,
        status: 'Active',
        adminComment: '',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 365)),
        transactionHistory: [],
        goldBookingHistory: [],
        address: Address.empty(),
        contactNumber: PhoneNumber(
            AppUser.phoneNumber.value.getOrElse(() => '').split('+91').last),
        whatsappNumber: PhoneNumber(''),
        emailAddress: EmailAddress(''),
        dateOfBirth: AppUser.dateOfBirth ?? DateTime.now(),
        dateOfAnniversary: AppUser.anniversaryDate,
        schemeType: 'Golden Future ',
        createdAt: DateTime.now(),
        noOfInstallmentsPaid: 1,
        isGoldPriceBooked: false,
        goldBookingStatus: false,
        goldQuantityBooked: 0.0,
        totalPriceForBookedQty: 0.0,
        goldPrice: GoldPrice.empty(),
        isTermsAndConditonsAccepted: false,
      );
}

extension FutureGoldSavingsPlanX on FutureGoldSavingsPlan {
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
        isNoOfInstallmentsValid &&
        areDatesValid &&
        areTermsAccepted;
  }
}
