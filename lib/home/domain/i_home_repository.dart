import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/home/domain/banners.dart';

abstract class IHomeRepository {
 
  Future<Either<AppFailures, Unit>> uploadBanner(File photo);
  Future<Either<AppFailures, Unit>> deleteBanner(String photoId);
  Future<Either<AppFailures, List<Banners>>> getBanners();
}