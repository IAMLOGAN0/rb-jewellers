import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/profile/domain/address.dart';
import 'package:rb_jewellers/profile/domain/value_objects.dart';
import 'gold_booking_history.dart';
import 'transaction_history.dart';

part 'golden_secure.freezed.dart';

@freezed
abstract class GoldenSecure implements _$GoldenSecure {
  const GoldenSecure._();

  const factory GoldenSecure({
    required String id,
    required String planId,
    required String userId,
    required Name name,
    required Address address,
    required PhoneNumber contactNumber,
    required PhoneNumber whatsappNumber,
    required EmailAddress? emailAddress,
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
    required List<TransactionHistory>? transactionHistory,
    required List<GoldBookingHistory>? goldBookingHistory,
  }) = _GoldenSecure;

  factory GoldenSecure.empty() => GoldenSecure(
        id: '',
        planId: 'INVRBEGSP-',
        userId: AppUser.uniqueId.getOrCrash(),
        name: Name(AppUser.name.value.getOrElse(() => '')),
        status: 'Active',
        address: Address.empty(),
        contactNumber: PhoneNumber(
            AppUser.phoneNumber.value.getOrElse(() => '').split('+91').last),
        whatsappNumber: PhoneNumber(''),
        emailAddress: EmailAddress(''),
        dateOfBirth: AppUser.dateOfBirth ?? DateTime.now(),
        dateOfAnniversary: AppUser.anniversaryDate,
        schemeType: 'Golden Secure ',
        noOfInstallment: 0,
        totalBookedGold: 0.0,
        totalBookingAmount: 0.0,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 365)),
        createdAt: DateTime.now(),
        adminComment: '',
        isTermsAndConditonsAccepted: false,
        transactionHistory: [],
        goldBookingHistory: [],
      );
}

extension GoldenSecureX on GoldenSecure {
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
    final bool isNoOfInstallmentsValid = noOfInstallment >= 0;
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
