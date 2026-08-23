import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/kyc.dart';

part 'kyc_dto.freezed.dart';
part 'kyc_dto.g.dart';

@freezed
abstract class KYCDto with _$KYCDto {
  const KYCDto._();

  const factory KYCDto({
    required String id,
    required String userId,
    required String aadharFront,
    required String aadharBack,
    required String panFront,
    required String panBack,
  }) = _KYCDto;

  factory KYCDto.fromJson(Map<String, dynamic> json) => _$KYCDtoFromJson(json);

  // Conversion from Domain (KYC) to DTO
  factory KYCDto.fromDomain(KYC kyc) {
    return KYCDto(
      id: kyc.id,
      userId: kyc.userId,
      aadharFront: kyc.aadharFront,
      aadharBack: kyc.aadharBack,
      panFront: kyc.panFront,
      panBack: kyc.panBack,
    );
  }

  // Conversion from DTO to Domain (KYC)
  KYC toDomain() {
    return KYC(
      id: id,
      userId: userId,
      aadharFront: aadharFront,
      aadharBack: aadharBack,
      panFront: panFront,
      panBack: panBack,
    );
  }
}
