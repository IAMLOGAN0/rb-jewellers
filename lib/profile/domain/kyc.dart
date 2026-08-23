import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc.freezed.dart';

@freezed
abstract class KYC implements _$KYC {
  const KYC._();

  const factory KYC({
    required String id,
    required String userId,
    required String aadharFront,
    required String aadharBack,
    required String panFront,
    required String panBack,
  }) = _KYC;

  factory KYC.empty() => const KYC(
        id: '',
        userId: '',
        aadharFront: '',
        aadharBack: '',
        panFront: '',
        panBack: '',
      );
}
