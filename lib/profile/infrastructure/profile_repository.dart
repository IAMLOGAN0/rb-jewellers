import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rb_jewellers/profile/domain/kyc.dart';
import 'package:rb_jewellers/profile/infrastructure/kyc_dto.dart';

import '../../app/domain/core/value_objects.dart';
import '../domain/i_profile_repository.dart';
import '../domain/profile.dart';
import '../domain/profile_failure.dart';
import 'profile_dto.dart';

class ProfileRepository implements IProfileRepository {
  final CollectionReference _usersCollection;
  final CollectionReference _kycCollection;
  final FirebaseStorage _storage;

  ProfileRepository()
      : _usersCollection = FirebaseFirestore.instance.collection('users'),
        _kycCollection = FirebaseFirestore.instance.collection('kyc'),
        _storage = FirebaseStorage.instance;

  @override
  Future<Either<ProfileFailure, Unit>> createProfile(
      UniqueId userId, Profile profile) async {
    try {
      final docRef = _usersCollection.doc(userId.getOrCrash());
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        return left(const ProfileFailure.profileAlreadyExists());
      } else {
        final profileDto = ProfileDto.fromDomain(profile);
        await docRef.set(profileDto.toJson());
        return right(unit);
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(ProfileFailure.unexpected(
            'Failed to create profile: ${e.message}'));
      } else {
        return left(ProfileFailure.unexpected('Failed to create profile: $e'));
      }
    }
  }

  @override
  Future<Either<ProfileFailure, Profile>> getProfile(UniqueId userId) async {
    try {
      final docSnapshot = await _usersCollection.doc(userId.getOrCrash()).get();

      if (docSnapshot.exists) {
        final profileDto = ProfileDto.fromFirestore(docSnapshot);
        final profile = profileDto.toDomain();
        return right(profile);
      } else {
        return left(const ProfileFailure.profileNotFound());
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(
            ProfileFailure.unexpected('Failed to get profile: ${e.message}'));
      } else {
        return left(ProfileFailure.unexpected('Failed to get profile: $e'));
      }
    }
  }

  @override
  Future<Either<ProfileFailure, Unit>> updateProfile(
      UniqueId userId, Profile profile) async {
    try {
      final profileDto = ProfileDto.fromDomain(profile);

      await _usersCollection
          .doc(userId.getOrCrash())
          .update(profileDto.toJson());
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        throw Exception('Failed to update user: ${e.message}');
      } else {
        throw Exception('Failed to update user: $e');
      }
    }
  }

  Future<void> deleteUser(UniqueId userId) async {
    try {
      await _usersCollection.doc(userId.getOrCrash()).delete();
    } catch (e) {
      if (e is FirebaseException) {
        throw Exception('Failed to delete user: ${e.message}');
      } else {
        throw Exception('Failed to delete user: $e');
      }
    }
  }

  @override
  Future<Either<ProfileFailure, Unit>> uploadKYC(
    UniqueId userId,
    File aadharFront,
    File aadharBack,
    File panFront,
    File panBack,
  ) async {
    try {
      log('UPLOAD KYC REPO');
      final String userIdStr = userId.getOrCrash();

      Future<String> uploadFile(String filePath, String fileName) async {
        final ref = _storage.ref().child('kyc/$userIdStr/$fileName');
        await ref.putFile(File(filePath));
        return await ref.getDownloadURL();
      }

      final aadharFrontUrl =
          await uploadFile(aadharFront.path, 'aadhar_front.jpg');
      final aadharBackUrl =
          await uploadFile(aadharBack.path, 'aadhar_back.jpg');
      final panFrontUrl = await uploadFile(panFront.path, 'pan_front.jpg');
      final panBackUrl = await uploadFile(panBack.path, 'pan_back.jpg');

      final kycDto = KYCDto.fromDomain(KYC(
        id: '',
        userId: userIdStr,
        aadharFront: aadharFrontUrl,
        aadharBack: aadharBackUrl,
        panFront: panFrontUrl,
        panBack: panBackUrl,
      ));

      await _kycCollection.doc(userIdStr).set(kycDto.toJson());
      return right(unit);
    } catch (e) {
      return left(ProfileFailure.unexpected('Failed to upload KYC: $e'));
    }
  }

  @override
  Future<Either<ProfileFailure, KYC>> getKYC(UniqueId userId) async {
    try {
      final docSnapshot = await _kycCollection.doc(userId.getOrCrash()).get();
      if (docSnapshot.exists) {
        final kycDto =
            KYCDto.fromJson(docSnapshot.data() as Map<String, dynamic>);
        return right(kycDto.toDomain());
      } else {
        return left(const ProfileFailure.profileNotFound());
      }
    } catch (e) {
      return left(ProfileFailure.unexpected('Failed to get KYC: $e'));
    }
  }
}
