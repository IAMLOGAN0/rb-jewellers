import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/profile/domain/kyc.dart';

import '../../app/domain/core/value_objects.dart';
import 'profile.dart';
import 'profile_failure.dart';

abstract class IProfileRepository {
  Future<Either<ProfileFailure, Unit>> createProfile(
      UniqueId userId, Profile profile);
  Future<Either<ProfileFailure, Profile>> getProfile(UniqueId userId);
  Future<Either<ProfileFailure, Unit>> updateProfile(
      UniqueId userId, Profile profile);
  Future<Either<ProfileFailure, Unit>> uploadKYC(
    UniqueId userId,
    File aadharFront,
    File aadharBack,
    File panFront,
    File panBack,
  );
  Future<Either<ProfileFailure, KYC>> getKYC(UniqueId userId);
}
