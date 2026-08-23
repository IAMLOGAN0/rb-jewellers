import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app/domain/core/failures.dart';
import '../../app/domain/core/value_objects.dart';
import 'value_objects.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile implements _$Profile {
  const Profile._();

  const factory Profile({
    required UniqueId id,
    required Name name,
    // required EmailAddress email,
    required DateTime dateOfBirth,
    required String mariatialStatus,
    required DateTime? anniversaryDate,
    required String location,
    // required Address address,
    required PhoneNumber phoneNumber,
    required String couponCode,
    required bool couponRedeemed,
  }) = _Profile;

  factory Profile.empty() => Profile(
        id: UniqueId(),
        name: Name(''),
        // email: EmailAddress(''),
        dateOfBirth: DateTime.now(),
        mariatialStatus: '',
        anniversaryDate: null,
        location: '',
        // address: Address.empty(),
        phoneNumber: PhoneNumber(''), couponCode: '',
        couponRedeemed: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        // .andThen(email.failureOrUnit)

        .andThen(phoneNumber.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
