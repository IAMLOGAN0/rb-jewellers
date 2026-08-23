import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';

part 'pay_offline.freezed.dart';

@freezed
abstract class PayOffline implements _$PayOffline {
  const PayOffline._();

  const factory PayOffline({
    required String id,
    required String planId,
    required String planName,
    required String userId,
    required double amount,
    required String createdAt,
    required String? qty,
    required String? goldPrice,
    required bool status,
  }) = _PayOffline;

  factory PayOffline.empty() => PayOffline(
        id: '',
        planId: '',
        planName: '',
        userId: AppUser.uniqueId.getOrCrash(),
        amount: 0.0,
        createdAt: DateTime.now().toIso8601String(),
        goldPrice: null,
        qty: null,
        status: false,
      );
}
