import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
abstract class Address implements _$Address {
  const Address._();

  const factory Address({
    required String locality,
    required String postOffice,
    required String city,
    required String landmark,
    required String policeStation,
    required String district,
    required String pin,
  }) = _Address;

  factory Address.empty() => const Address(
        locality: '',
        postOffice: '',
        city: '',
        landmark: '',
        policeStation: '',
        district: '',
        pin: '',
      );
}

extension AddressX on Address {
  bool isValid() {
    final bool isLocalityValid = locality.isNotEmpty;
    final bool isPostOfficeValid = postOffice.isNotEmpty;
    final bool isCityValid = city.isNotEmpty;
    // final bool isLandmarkValid = landmark.isNotEmpty;
    final bool isPoliceStationValid = policeStation.isNotEmpty;
    final bool isDistrictValid = district.isNotEmpty;
    final bool isPinValid =
        pin.isNotEmpty && pin.length == 6 && RegExp(r'^[0-9]+$').hasMatch(pin);

    // Combine all validations
    return isLocalityValid &&
        isPostOfficeValid &&
        isCityValid &&
        // isLandmarkValid &&
        isPoliceStationValid &&
        isDistrictValid &&
        isPinValid;
  }
}
