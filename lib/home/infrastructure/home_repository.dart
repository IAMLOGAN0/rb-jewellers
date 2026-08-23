import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/home/domain/banners.dart';
import 'package:rb_jewellers/home/infrastructure/banners_dto.dart';

import '../domain/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final CollectionReference _banners =
      FirebaseFirestore.instance.collection('banners');

  @override
  Future<Either<AppFailures, Unit>> deleteBanner(String photoId) async{
    return right(unit);
  }

  @override
  Future<Either<AppFailures, List<Banners>>> getBanners() async {
    try {
      final QuerySnapshot snapshot = await _banners.get();

      // Convert the query results to Banners objects
      final List<Banners> photos = snapshot.docs.map((doc) {
        final bannerDto = BannersDto.fromFirestore(doc);
        return bannerDto.toDomain();
      }).toList();

      return right(photos);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> uploadBanner(File bannerImage) async {
    try {
      // Generate a unique ID for the Banner document
      final bannerId = _banners.doc().id;

      // Upload the photo to Firestore Storage
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('banners//$bannerId.jpg');
      final UploadTask uploadTask = storageRef.putFile(bannerImage);
      final TaskSnapshot storageSnapshot = await uploadTask;

      // Get the download URL of the uploaded photo
      final String bannerURL = await storageSnapshot.ref.getDownloadURL();

      // Save the photo document to Firestore
      final BannersDto bannersDto = BannersDto(
          id: bannerId, bannerUrl: bannerURL, url: 'https://www.google.com');
      await _banners.doc(bannerId).set(bannersDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }
}
