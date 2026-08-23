import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/address.dart';

part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
abstract class AddressDto with _$AddressDto {
  const AddressDto._();

  const factory AddressDto({
    required String locality,
    required String postOffice,
    required String city,
    required String landmark,
    required String policeStation,
    required String district,
    required String pin,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  // Conversion from Domain (Address) to DTO
  factory AddressDto.fromDomain(Address address) {
    return AddressDto(
      locality: address.locality,
      postOffice: address.postOffice,
      city: address.city,
      landmark: address.landmark,
      policeStation: address.policeStation,
      district: address.district,
      pin: address.pin,
    );
  }

  // Conversion from DTO to Domain (Address)
  Address toDomain() {
    return Address(
      locality: locality,
      postOffice: postOffice,
      city: city,
      landmark: landmark,
      policeStation: policeStation,
      district: district,
      pin: pin,
    );
  }
}
