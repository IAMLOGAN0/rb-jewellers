import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';

part 'pay_offline_dto.freezed.dart';
part 'pay_offline_dto.g.dart';

@freezed
abstract class PayOfflineDto with _$PayOfflineDto {
  const PayOfflineDto._();

  const factory PayOfflineDto({
    required String id,
    required String planId,
    required String planName,
    required String userId,
    required double amount,
    required String createdAt,
    required bool status,
       required String? qty,
    required String? goldPrice,
  }) = _PayOfflineDto;

  factory PayOfflineDto.fromJson(Map<String, dynamic> json) =>
      _$PayOfflineDtoFromJson(json);

  // Conversion from Domain (EasyGoldSavingsPlan) to DTO
  factory PayOfflineDto.fromDomain(PayOffline plan) {
    return PayOfflineDto(
      id: '',
      planName: plan.planName,
      planId: plan.planId,
      userId: plan.userId,
      amount: plan.amount,
      createdAt: plan.createdAt,
      status: plan.status,
      goldPrice: plan.goldPrice, 
      qty: plan.qty,
    );
  }

  // Conversion from DTO to Domain (EasyGoldSavingsPlan)
  PayOffline toDomain() {
    return PayOffline(
      id: id,
      planName: '',
      planId: planId,
      userId: userId,
      amount: amount,
      createdAt: createdAt,
      status: status,
      qty: qty,
      goldPrice: goldPrice,
    );
  }

  factory PayOfflineDto.fromFirestore(DocumentSnapshot doc) {
    return PayOfflineDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}
