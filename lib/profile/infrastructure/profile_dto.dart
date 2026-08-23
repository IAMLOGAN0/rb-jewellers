import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app/domain/core/value_objects.dart';
import '../domain/profile.dart';
import '../domain/value_objects.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
abstract class ProfileDto with _$ProfileDto {
  const ProfileDto._();

  const factory ProfileDto({
    required String id,
    required String name,
    required DateTime dateOfBirth,
    required String mariatialStatus,
    required DateTime? anniversaryDate,
    required String location,
    // required Map address,
    required String phoneNumber,
    required String couponCode,
    required bool couponRedeemed,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  factory ProfileDto.fromDomain(Profile profile) {
    return ProfileDto(
      id: profile.id.getOrCrash(),
      name: profile.name.getOrCrash(),
      dateOfBirth: profile.dateOfBirth,
      mariatialStatus: profile.mariatialStatus,
      anniversaryDate: profile.anniversaryDate,
      location: profile.location,
      // address: AddressDto.fromDomain(profile.address).toJson(),
      phoneNumber: profile.phoneNumber.getOrCrash(),
      couponCode: profile.couponCode,
      couponRedeemed: profile.couponRedeemed,
    );
  }

  factory ProfileDto.fromFirestore(DocumentSnapshot doc) {
    return ProfileDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }

  Profile toDomain() {
    return Profile(
      id: UniqueId.fromUniqueString(id),
      name: Name(name),
      dateOfBirth: dateOfBirth,
      mariatialStatus: mariatialStatus,
      anniversaryDate: anniversaryDate,
      location: location,
      // address:
      //     AddressDto.fromJson(Map<String, dynamic>.from(address)).toDomain(),
      phoneNumber: PhoneNumber(phoneNumber),
      couponCode: couponCode,
      couponRedeemed: couponRedeemed,
    );
  }
}
